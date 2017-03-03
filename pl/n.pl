:- module(n, [sg_n/1, pl_n/1, np/1, np/2]).

:- use_module(library(clpfd)).
:- [det].

% Subset of English nouns
noun([man]).
noun([woman]).
noun([cat]).
noun([dog]).

pluralize(Noun, Plural):-
	noun(Noun),
	append(Noun, [-pl], Plural).

sg_n(R):-
	noun(R).
pl_n(R):-
	noun(R0),
	pluralize(R0, R).

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
