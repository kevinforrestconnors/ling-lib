:- module(n, [n/1, sg_n/1, pl_n/1, person_of_noun/2, pluralize/2]).

:- use_module(det, [det/1, sg_det/1, pl_det/1]).

% Subset of English nouns
n(X):-
	normal_noun(X) ; pronoun(X).

normal_noun([man]).
normal_noun([woman]).
normal_noun([cat]).
normal_noun([dog]).

pronoun(X):-
	sg_pronoun(X) ; pl_pronoun(X).

sg_pronoun([i]).
sg_pronoun([you]).
sg_pronoun([he]).
sg_pronoun([she]).
sg_pronoun([they]).
sg_pronoun([it]).

% pl pronouns
pl_pronoun([we]).
pl_pronoun([yall]).
pl_pronoun([they]).

% 1st
fst_person([i]).
fst_person([we]).

% 2nd
snd_person([you]).
snd_person([yall]).

% 3rd
trd_person([he]).
trd_person([she]).
trd_person([they]).
trd_person([it]).

person_of_noun(Noun, [-1]):-
	n(Noun),
	fst_person(Noun).
person_of_noun(Noun, [-2]):-
	n(Noun),
	snd_person(Noun).
person_of_noun(Noun, [-3]):-
	n(Noun),
	(trd_person(Noun) ; normal_noun(Noun)).

pluralize(Noun, Plural):-
	n(Noun),
	append(Noun, [-pl], Plural).

sg_n(R):-
	n(R).
pl_n(R):-
	n(R0),
	pluralize(R0, R).
