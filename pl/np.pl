:- module(np, [np/2, np/3]).

:- use_module(n, [sg_n/1, pl_n/1]).
:- use_module(det, [sg_det/1, pl_det/1]).

np(N, R):-
	np(N, sg, R) ; np(N, pl, R).
np(N, sg, R):-
	sg_det(Det),
	sg_n(N),
	append(Det, [#], T),
	append(T, N, R).
np(N, pl, R):-
	pl_det(Det),
	pl_n(N),
	append(Det, [#], T),
	append(T, N, R).
