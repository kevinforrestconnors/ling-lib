:- module(det_n, [det/1, sg_det/1, pl_det/1, sg_n/1, pl_n/1, np/1, np/2]).

det(X):-
	sg_det(X) ; pl_det(X).

sg_det([a]).
sg_det([one]).
sg_det([the]).
sg_det([this]).
sg_det([that]).

pl_det([the]).
pl_det([some]).
pl_det([many]).
pl_det([these]).
pl_det([those]).

noun([man]).
noun([woman]).
noun([cat]).
noun([dog]).

plural(Noun, Plural):-
	noun(Noun),
	append(Noun, [-pl], Plural).

sg_n(R):-
	noun(R).
pl_n(R):-
	noun(R0),
	plural(R0, R).

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
