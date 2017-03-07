:- module(agreement, [person_agreement/2]).

:- use_module(helpers, [concat_words/3]).
:- use_module(n, [n/1, sg_n/1, pl_n/1, person_of_noun/2]).
:- use_module(v, [v/1, transitive_v/1, intransitive_v/1]).
:- use_module(morpheme, [morpheme/1, add_morpheme/2]).

person_agreement(N, V):-
	n(N),
	v(V),
	person_of_noun(N, Person),
	has_morpheme(V, Person).
