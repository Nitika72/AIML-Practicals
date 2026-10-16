% Experiment 7: Implement Greedy Best-First Search

edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(d, g).
edge(e, g).
edge(f, g).

% Heuristic values
heuristic(a, 6).
heuristic(b, 4).
heuristic(c, 3).
heuristic(d, 2).
heuristic(e, 3).
heuristic(f, 1).
heuristic(g, 0).

greedy(Start, Goal, Path) :-
    greedy_search([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

greedy_search([[Goal|Path]|_], Goal, [Goal|Path]).

greedy_search([Path|Rest], Goal, FinalPath) :-
    Path = [Node|_],
    findall(H-[Next,Node|Path],
            (edge(Node, Next),
             \+ member(Next, Path),
             heuristic(Next, H)),
            Children),
    append(Rest, Children, Queue),
    sort(Queue, SortedQueue),
    remove_heuristics(SortedQueue, NewQueue),
    greedy_search(NewQueue, Goal, FinalPath).

remove_heuristics([], []).
remove_heuristics([_-Path|T], [Path|R]) :-
    remove_heuristics(T, R).

% Find path from a to g
:- initialization(main).

main :-
    greedy(a, g, Path),
    write('Path: '),
    write(Path),
    nl,
    halt.
