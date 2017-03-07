:- module(word, [
	word/2, 
	morphemes_well_formed/1, 
	display_word/2
]).

:- use_module(helpers, [concat_words/3]).
:- use_module(affix, [prefix/1, suffix/1]).
:- use_module(morpheme, [morpheme/1]).
:- use_module(n, [n/1]).
:- use_module(v, [v/1]).
:- use_module(det, [det/1]).

% word(?Root, +Morphemes)
word(Root, Morphemes):-
	(
		n(Root)
	;	v(Root)
	;	det(Root)
	),
	morphemes_well_formed(Morphemes).

% morphemes_well_formed(+Morphemes)
morphemes_well_formed(Morphemes):-
	forall(member(X, Morphemes), morpheme(X)).

% display_word(word(+Root, +Morphemes), -Ortho)
display_word(word(Root, Morphemes), Ortho):-
	include(prefix, Morphemes, Prefixes),
	include(suffix, Morphemes, Suffixes),
	atom_list_concat(Prefixes, WordPrefix),
	atom_list_concat(Suffixes, WordSuffix),
	atom_concat(WordPrefix, Root, T),
	atom_concat(T, WordSuffix, Ortho).

phrase(Words):-
	forall(member(X, Words), word(X)).

display_phrase(Phrase, OrthoPhrases):-
	maplist(display_word, Phrase, OrthoPhrases).