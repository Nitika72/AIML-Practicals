% Experiment 11: Solve Map Coloring Using Backtracking

color(red).
color(green).
color(blue).

different(A, B) :-
    A \= B.

map(A, B, C, D) :-
    color(A),
    color(B),
    color(C),
    color(D),
    different(A, B),
    different(A, C),
    different(B, C),
    different(B, D),
    different(C, D).

:- initialization(main).

main :-
    map(A, B, C, D),
    write('Region A: '), write(A), nl,
    write('Region B: '), write(B), nl,
    write('Region C: '), write(C), nl,
    write('Region D: '), write(D), nl,
    halt.

