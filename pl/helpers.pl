:- module(helpers, [head/2, tail/2, concat_words/3]).

head([X|_], X).
tail([_|XS], XS).

concat_words(W1, W2, R):-
	append(W1, [#], T),
	append(T, W2, R).
