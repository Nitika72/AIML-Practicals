% Experiment 3: Perform Append, Reverse, Member Search, and List Length Operations

domains
    numlist = integer*

predicates
    appendList(numlist, numlist, numlist)
    reverseList(numlist, numlist)
    memberSearch(integer, numlist)
    listLength(numlist, integer)

clauses
    appendList([], L, L).
    appendList([H|T], L, [H|R]) :-
        appendList(T, L, R).

    reverseList([], []).
    reverseList([H|T], R) :-
        reverseList(T, RT),
        appendList(RT, [H], R).

    memberSearch(X, [X|_]).
    memberSearch(X, [_|T]) :-
        memberSearch(X, T).

    listLength([], 0).
    listLength([_|T], N) :-
        listLength(T, N1),
        N = N1 + 1.

goal
    appendList([1,2,3], [4,5], A),
    write("Appended List: "), write(A), nl,

    reverseList([1,2,3,4,5], R),
    write("Reversed List: "), write(R), nl,

    memberSearch(3, [1,2,3,4,5]),
    write("Element found"), nl,

    listLength([1,2,3,4,5], N),
    write("List Length: "), write(N), nl.

