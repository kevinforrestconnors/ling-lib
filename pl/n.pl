:- module(n, [
	n/1,
	noun/2,
	normal_noun/1, 
	pronoun/1, 
	pronoun/2,
	pronoun/3,
	sg_pronoun/1,
	pl_pronoun/1,
	word_of_noun/2, 
	person_of_noun/2, 
	pluralize/2,
	sg_n/1, 
	pl_n/1
]).

:- use_module(morpheme, [add_morpheme/3]).

% n = the root word of a noun
n(N):-
	normal_noun(N) ; pr(N).

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

pr(Pr):-
	sg_pronoun(Pr) ; pl_pronoun(Pr).

% pronoun/1
% Describes all pronouns
pronoun(word(Pr, [Person, Number])):-
	pronoun(word(Pr, [Person, Number]), Person, Number).

% pronoun/2
% Describes pronouns with a specific person
pronoun(Word, '-1'):-
	pronoun(Word, '-1', _).
pronoun(Word, '-2'):-
	pronoun(Word, '-2', _).
pronoun(Word, '-3'):-
	pronoun(Word, '-3', _).

% pronoun/2 
% Describes pronouns with a specific number
pronoun(Word, '-sg'):-
	pronoun(Word, _, '-sg').
pronoun(Word, '-pl'):-
	pronoun(Word, _, '-pl').

% pronoun/3
% Describes pronouns with a specific person and number
pronoun(word(Pr, [Person, '-sg']), Person, '-sg'):-
	sg_pronoun(Pr),
	person_of_noun(Pr, Person).
pronoun(word(Pr, [Person, '-pl']), Person, '-pl'):-
	pl_pronoun(Pr),
	person_of_noun(Pr, Person).

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
	n(Noun),
	fst_person(Noun).
person_of_noun(Noun, '-2'):-
	n(Noun),
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

