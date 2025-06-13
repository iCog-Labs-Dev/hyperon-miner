%%%%%%%%%%%%
%% Helper %%
%%%%%%%%%%%%

% Checks if Item is equal to X
equal_to(Item, X) :-
    Item == X.

% Converts Name/Arity into a functor CMP
tofunctor(Name/Arity, CMP) :-
    functor(CMP, Name, Arity).

tofunctor(Atom, CMP) :-
    atom(Atom),
    CMP = Atom.

% Abstracts an expression by checking if Pattern is an atom or by extracting its predicate
abstract_expression(Pattern, APattern) :-
    (   atom(Pattern)
    ->  APattern = Pattern
    ;   get_predicate(Pattern, APattern)
    ).

% Extracts the predicate name and arity from Pattern
get_predicate(Pattern, Name/Arity) :-
    functor(Pattern, Name, Arity).

% Base case for substitution
substitute(_, _, [], []).

% Recursively substitutes occurrences of VAR in Pattern with elements from a list of replacements
substitute(Pattern, VAR, [Replacement|ReplacementsTail], [Result|ResultsTail]) :-
    substituteVar(VAR, Replacement, Pattern, Result),   
    substitute(Pattern, VAR, ReplacementsTail, ResultsTail). 

substituteVar(VAR, Replacement, Pattern, Result) :-
    Pattern == VAR,
    !,               
    Result = Replacement.

substituteVar(_, _, Pattern, Pattern) :-
    \+ compound(Pattern),
    !.

substituteVar(VAR, Replacement, Pattern, Result) :-  
    compound_name_arguments(Pattern, Name, ArgsIn), 
    maplist(substituteVar(VAR, Replacement), [Name|ArgsIn], [NewName|ArgsOut]), 
    compound_name_arguments(Result, NewName, ArgsOut).

% Flattens a list
flatten([], []).

flatten([Head|Tail], FlatList) :-
    flatten(Head, FlatHead), 
    flatten(Tail, FlatTail),
    append(FlatHead, FlatTail, FlatList).

flatten(Element, [Element]) :-
    \+ is_list(Element).

count(Pattern, Count) :-
    findall(Pattern, Pattern, Results),
    length(Results, Count).