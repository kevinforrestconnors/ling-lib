:- module(n, [
	n/1,
	noun/1,
	normal_noun/1, 
	pronoun/1, 
	sg_pronoun/1,
	pl_pronoun/1,
	word_of_noun/2, 
	person_of_noun/2, 
	pluralize/2,
	sg_n/1, 
	pl_n/1
]).

:- use_module(morpheme, [add_morpheme/3]).
:- use_module(det, [det/1, sg_det/1, pl_det/1]).

% n = the root word of a noun
n(N):-
	normal_noun(N) ; pronoun(N).

sg_n(N):-
	normal_noun(N) ; sg_pronoun(N).
pl_n(N):-
	normal_noun(N) ; pl_pronoun(N).

% noun = a word(Noun, Morphemes) construct
noun(word(Root, Morphemes)):-
	(
		noun(word(Root, Morphemes), '-sg')
	;	noun(word(Root, Morphemes), '-pl')
	).
noun(word(Root, []), '-sg'):-
	sg_n(Root).
noun(word(Root, M2), '-pl'):-
	pl_n(Root),
	pluralize(word(Root, []), word(Root, M2)).

normal_noun('man').
normal_noun('woman').
normal_noun('cat').
normal_noun('dog').

pronoun(X):-
	sg_pronoun(X) ; pl_pronoun(X).

sg_pronoun('i').
sg_pronoun('you').
sg_pronoun('he').
sg_pronoun('she').
sg_pronoun('they').
sg_pronoun('it').

% pl pronouns
pl_pronoun('we').
pl_pronoun('yall').
pl_pronoun('they').

% 1st
fst_person('i').
fst_person('we').

% 2nd
snd_person('you').
snd_person('yall').

% 3rd
trd_person('he').
trd_person('she').
trd_person('they').
trd_person('it').

% word_of_noun(+Noun, -Word)
word_of_noun(Noun, word(Noun, [])).

person_of_noun(Noun, '-1'):-
	is_n(Noun),
	fst_person(Noun).
person_of_noun(Noun, '-2'):-
	is_n(Noun),
	snd_person(Noun).
person_of_noun(Noun, '-3'):-
	n(Noun),
	(trd_person(Noun) ; normal_noun(Noun)).

% pluralize(word(+Noun, +Morphemes), -Word)
pluralize(word(Noun, Morphemes), R):-
	(normal_noun(Noun) ->
		add_morpheme(word(Noun, Morphemes), '-pl', R)
	;
		R = word(Noun, Morphemes)
	).

