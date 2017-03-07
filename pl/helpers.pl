:- module(helpers, [head/2, tail/2, concat_phrases/3]).

head([X|_], X).
tail([_|XS], XS).
