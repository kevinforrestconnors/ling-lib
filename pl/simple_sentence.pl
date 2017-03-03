:- module(simple_sentence, [simple_sentence/3]).

:- use_module(library(clpfd)).
:- use_module(helpers, [concat_words/3]).
:- use_module(np, [np/1, np/2]).
:- use_module(vp, [vp/3, transitive_vp/3, intransitive_vp/1]).

simple_sentence(S, VP, R):-
	np(S),
	vp(V, N, VP),
	concat_words(S, VP, R).
