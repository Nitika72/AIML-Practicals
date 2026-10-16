% Experiment 9: Implement Hill Climbing Algorithm

% Values of different states
value(a, 2).
value(b, 5).
value(c, 8).
value(d, 6).
value(e, 10).

% Connections between states
neighbor(a, b).
neighbor(b, c).
neighbor(c, d).
neighbor(c, e).

hill_climb(State, Best) :-
    value(State, V1),
    findall(V-Next,
            (neighbor(State, Next), value(Next, V)),
            Neighbors),
    sort(Neighbors, Sorted),
    reverse(Sorted, [BestValue-NextState|_]),
    (BestValue > V1 ->
        hill_climb(NextState, Best)
    ;
        Best = State
    ).

% Start hill climbing from state a
:- initialization(main).

main :-
    hill_climb(a, Best),
    write('Best State: '),
    write(Best),
    nl,
    halt.

