% load utils
:- consult('utils.pl').

%%%%%%%%%%%%%%%%%%%%%%%
%% Miner Minsup Rule %%
%%%%%%%%%%%%%%%%%%%%%%%

minsup(Pattern) :-
    supportOf(Pattern, Count), % Assume user provides this initially
    ms_threshold(MS),
    MS < Count.

minsup(SPattern):-
    minsup(APattern),
    !,
    specializations_with_minsup(APattern, SPatterns),
    member(SPattern, SPatterns).

% Generates specialized patterns (SPatterns) from an abstract pattern (APattern)
specializations_with_minsup(APattern, SPatterns) :-
    term_variables(APattern, Variables),
    findall(SPattern,
            (   member(VAR, Variables),
                shallow_abstraction_withminsup(APattern, VAR, SAP),
                substitute(APattern, VAR, SAP, SPattern)
            ),
            SPList),
    flatten(SPList, SPatterns).

% Return shallow abstractions of VAR in a given pattern
% e.g
% VAR  X
% Pattern likes(X, Y)
% Facts likes(fullname(john, cook), cat), likes(a,b), likes(a,e), human(fullname(john, cook)) ....
% SAP fullname(A, B), a,
shallow_abstraction_withminsup(Pattern, VAR, SAP):-
    findall(VAR, Pattern, Result), 
    maplist(abstract_expression, Result, AbstractedList),
    list_to_set(AbstractedList, Unique),
    ms_threshold(MS),
    findall(CMP,
            (   member(Item, Unique),
                include(equal_to(Item), AbstractedList, Filtered),   % Filter the list for the current item
                length(Filtered, Count),
                Count > MS,
                tofunctor(Item, CMP)
            ),
            SAP).
