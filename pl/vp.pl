:- module(vp, [vp/3, transitive_vp/3, intransitive_vp/1]).

:- use_module(library(clpfd)).
:- use_module(helpers, [concat_words/3]).
:- use_module(v, [v/1, transitive_v/1, intransitive_v/1]).
:- use_module(np, [np/1, np/2]).

vp(V, NP, R):-
	transitive_vp(V, NP, R) ; intransitive_vp(V).
	
transitive_vp(V, NP, R):-
	transitive_v(V),
	np(NP),
	concat_words(V, NP, R).

intransitive_vp(V):-
	intransitive_v(V).


