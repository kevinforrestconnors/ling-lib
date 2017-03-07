:- module(word, [
	word/2, 
	morphemes_well_formed/1, 
	display_word/2,
	phrase/1,
	concat_phrases/3,
	display_phrase/2
]).

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
	atomic_list_concat(Prefixes, WordPrefix),
	atomic_list_concat(Suffixes, WordSuffix),
	atom_concat(WordPrefix, Root, T),
	atom_concat(T, WordSuffix, Ortho).

phrase(Words):-
	forall(member(X, Words), word(X)).

concat_phrases(W1, W2, R):-
	W1 = word(_, _),
	W2 = word(_, _),
	append([W1], [W2], R).
concat_phrases(W1, P1, R):-
	W1 = word(_, _),
	phrase(P1),
	append([W1], P1, R).
concat_phrases(P1, W1, R):-
	W1 = word(_, _),
	phrase(P1),
	append(P1, [W1], R).
concat_phrases(P1, P2, R):-
	phrase(P1),
	phrase(P2),
	append(P1, P2, R).

display_phrase(Phrase, OrthoPhrases):-
	maplist(display_word, Phrase, OrthoPhrases).