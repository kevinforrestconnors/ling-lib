:- module(det_n, [np_sg, np_pl, np])

plural_type([one]).
plural_type([some]).

det([a]).
plurality([a], [one]). % a cat - *a cats

det([the]).
plurality([the], [one]). % the cat
plurality([the], [some]). % the cats

det([some]).
plurality([some], [some]).

noun([man]).
noun([woman]).
noun([cat]).
noun([dog]).

plural(Noun, Plural):-
	noun(Noun),
	append(Noun, [s], Plural).

% n(Plurality, Result)
n([one], Result):-
	noun(Result).
n([some], Result):-
	noun(N),
	plural(N, Result).

np_sg(Result):-
	np([one], Result).

np_pl(Result):-
	np([some], Result).

np(Plurality, Result):-
	det(Det),
	plurality(Det, Plurality),
	n(Plurality, N),
	append(Det, [#], T),
	append(T, N, Result).

