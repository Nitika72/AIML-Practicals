% Experiment 8: Implement A* Search Algorithm

edge(a, b, 1).
edge(a, c, 4).
edge(b, d, 2).
edge(b, e, 5).
edge(c, f, 2).
edge(d, g, 3).
edge(e, g, 2).
edge(f, g, 3).

% Heuristic values
heuristic(a, 6).
heuristic(b, 5).
heuristic(c, 4).
heuristic(d, 3).
heuristic(e, 2).
heuristic(f, 2).
heuristic(g, 0).

astar(Start, Goal, Path) :-
    heuristic(Start, H),
    astar_search([[H, 0, [Start]]], Goal, RevPath),
    reverse(RevPath, Path).

astar_search([[_, _, [Goal|Path]]|_], Goal, [Goal|Path]).

astar_search([[_, Cost, [Node|Path]]|Rest], Goal, FinalPath) :-
    findall([F, NewCost, [Next,Node|Path]],
            (edge(Node, Next, StepCost),
             \+ member(Next, [Node|Path]),
             NewCost is Cost + StepCost,
             heuristic(Next, H),
             F is NewCost + H),
            Children),
    append(Rest, Children, Queue),
    sort(Queue, SortedQueue),
    astar_search(SortedQueue, Goal, FinalPath).

% Find the optimal path from a to g
:- initialization(main).

main :-
    astar(a, g, Path),
    write('Path: '),
    write(Path),
    nl,
    halt.

