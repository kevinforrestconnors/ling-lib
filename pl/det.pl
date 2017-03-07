:- module(det, [det/1, sg_det/1, pl_det/1]).

det(word(Det, [])):-
	sg_det(Det) ; pl_det(Det).
	
% Subset of English determiners
sg_det('a').
sg_det('one').
%sg_det('the').
%sg_det('this').
%sg_det('that').

pl_det('he').
pl_det('some').
%pl_det('many').
%pl_det('these').
%pl_det('those').
