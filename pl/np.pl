:- module(np, [np/2, np/3]).

:- use_module(word, [concat_phrases/3]).
:- use_module(n, [noun/2, normal_noun/1, pronoun/2]).
:- use_module(det, [det/3]).

% np(?N, -R)
% phrase(R)
np(N, R):-
	np(N, '-sg', R) ; np(N, '-pl', R).
np(N, Number, R):-
	(
		det(_, Number, Det),
		normal_noun(N),
		noun(word(N, M), Number),
		concat_phrases(Det, word(N, M), R)
	;
		pronoun(Word, Number),
		R = [Word]
	).
