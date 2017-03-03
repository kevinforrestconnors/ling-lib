:- module(np, [np/1, np/2]).

:- use_module(n, [sg_n/1, pl_n/1]).
:- use_module(det, [sg_det/1, pl_det/1]).

np(R):-
	np(sg, R) ; np(pl, R).
np(sg, R):-
	sg_det(Det),
	sg_n(Noun),
	append(Det, [#], T),
	append(T, Noun, R).
np(pl, R):-
	pl_det(Det),
	pl_n(Noun),
	append(Det, [#], T),
	append(T, Noun, R).
