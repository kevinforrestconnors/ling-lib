:- module(n, [sg_n/1, pl_n/1]).

:- use_module(det, [det/1, sg_det/1, pl_det/1]).

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
