:- module(helpers, [
	head/2, 
	tail/2, 
]).

head([X|_], X).
tail([_|XS], XS).
