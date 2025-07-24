:- consult('pminer.pl').

%%% TEST 1 %%%
ms_threshold(1).
supportOf(likes(X,Y), 6).
:- consult('testkb.pl').
%shallow_abstraction_withminsup(likes(X,Y), X, SAP).
%minsup(P).

% %%% TEST 2 %%%
% ms_threshold(4).
% supportOf(inheritance(X,Y), 5)
% :- consult('sample2.pl').
% %shallow_abstraction_withminsup(likes(X,Y), X, SAP).
% %minsup(P).