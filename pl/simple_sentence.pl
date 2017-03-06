:- module(simple_sentence, [simple_sentence/3]).

:- use_module(library(clpfd)).
:- use_module(helpers, [concat_words/3]).
:- use_module(agreement, [person_agreement/3]).
:- use_module(n, [person_of_noun/2]).
:- use_module(np, [np/2, np/3]).
:- use_module(vp, [vp/3, transitive_vp/3, intransitive_vp/1]).

simple_sentence(S, VP, R):-
	np(Noun1, S),
	person_agreement(Noun1, _, V),
	vp(V, DO, VP),
	concat_words(S, VP, R).
