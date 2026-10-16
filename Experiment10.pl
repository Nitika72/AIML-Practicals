% Experiment 10: Implement Simulated Annealing Algorithm

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

% Simulated annealing
anneal(State, 0, State).
anneal(State, Temp, Best) :-
    Temp > 0,
    findall(V-Next,
            (neighbor(State, Next), value(Next, V)),
            Neighbors),
    sort(Neighbors, Sorted),
    reverse(Sorted, [ _-NextState | _ ]),
    NewTemp is Temp - 1,
    anneal(NextState, NewTemp, Best).

% Start the algorithm
:- initialization(main).

main :-
    anneal(a, 3, Best),
    write('Best State: '),
    write(Best),
    nl,
    halt.

