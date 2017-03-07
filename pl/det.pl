:- module(det, [det/2, det/3, sg_det/1, pl_det/1]).

det(Word, R):-
	det(Word, _, R).

det(Det, '-sg', word(Det, [])):-
	sg_det(Det).
det(Det, '-pl', word(Det, [])):-
	pl_det(Det).
	
% Subset of English determiners
sg_det('a').
sg_det('one').
%sg_det('the').
%sg_det('this').
%sg_det('that').

pl_det('the').
pl_det('some').
%pl_det('many').
%pl_det('these').
%pl_det('those').
