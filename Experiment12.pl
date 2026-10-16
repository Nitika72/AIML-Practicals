% Experiment 12: Solve N-Queens Problem Using Backtracking

% Check whether two queens are safe
safe(_, []).
safe(Q, [H|T]) :-
    Q =\= H,
    Q1 is Q + 1,
    H1 is H + 1,
    Q1 =\= H1,
    Q2 is Q - 1,
    H2 is H - 1,
    Q2 =\= H2,
    safe(Q, T).

% Generate queen positions
queens(0, []).
queens(N, [Q|Others]) :-
    N > 0,
    N1 is N - 1,
    queens(N1, Others),
    between(1, 4, Q),
    safe(Q, Others).

% Display solution
:- initialization(main).

main :-
    queens(4, Solution),
    write('Queen positions: '),
    write(Solution),
    nl,
    halt.


