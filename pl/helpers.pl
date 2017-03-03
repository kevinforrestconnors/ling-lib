:- module(helpers, [concat_words/3]).

concat_words(W1, W2, R):-
	append(W1, [#], T),
	append(T, W2, R).
