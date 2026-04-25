
%% our_alpha_member(+Elem, +List, -Result)
%% Result = true if Elem is alpha-equal (=@=) to any element in List, else false
%% our_alpha_member(+Elem, +List, -Result)
%% Checks if Elem is alpha-equal (=@=) to any element in List.
our_alpha_member(_, [], false).
our_alpha_member(Elem, [H|_], true) :- Elem =@= H, !.
our_alpha_member(Elem, [_|Rest], Result) :- our_alpha_member(Elem, Rest, Result).

