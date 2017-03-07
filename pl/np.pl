:- module(np, [np/2, np/3]).

:- use_module(helpers, [concat_words/3]).
:- use_module(n, [n/1, normal_noun/1, word_of_noun/2, pronoun/1, sg_n/1, pl_n/1]).
:- use_module(det, [sg_det/1, pl_det/1]).

% np(?N, -R)
% R = word(N, [?-pl])
np(N, R):-
	np(N, sg, R) ; np(N, pl, R).
np(N, '-sg', R):-
	sg_det(Det),
	sg_n(word(N, _)),
	concat_words(Det, word(N, _), R).
np(N, '-pl', R):-
	pl_det(Det),
	pl_n(word(N, _)),
	concat_words(Det, word(N, _), R).
