:- module(v, [v/1, transitive_v/1, intransitive_v/1]).

:- use_module(helpers, [head/2]).

v(X):-
	(
		transitive_v(X)
	;
		intransitive_v(X)
	).
	
% Subset of English verbs
transitive_v('hit').
transitive_v('love').
transitive_v('kiss').

intransitive_v('cry').
intransitive_v('sleep').