:- module(affix, [affix/1, prefix/1, suffix/1]).

:- use_module(library(clpfd)).

affix(X):-
	prefix(X) ; suffix(X). % ; infix(X) ; circumfix(X)

prefix(Affix):-
	atom_length(Affix, Len),
	Dash #= Len - 1,
	sub_atom(Affix, Dash, 1, _, '-').

suffix(Affix):-
	sub_atom(Affix, 0, 1, _, '-').