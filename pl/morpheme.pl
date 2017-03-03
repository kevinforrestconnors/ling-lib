:- use_module(library(clpfd)).
:- use_module(affix, [affix/1, prefix/1, suffix/1]).

% Subset of crosslinguistic morphemes

% Prefixes
morpheme('NEG-'). % negation

% Suffixes
morpheme('-1'). % 1st person
morpheme('-2'). % 2nd person
morpheme('-3'). % 3rd person
morpheme('-pl'). % plural