% Experiment 6: Implement Breadth-First Search (BFS)

edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(d, g).
edge(e, g).
edge(f, g).

bfs(Start, Goal, Path) :-
    bfs_search([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

bfs_search([[Goal|Path]|_], Goal, [Goal|Path]).

bfs_search([Path|Rest], Goal, FinalPath) :-
    Path = [Node|_],
    findall([Next,Node|Path],
            (edge(Node, Next), \+ member(Next, Path)),
            NewPaths),
    append(Rest, NewPaths, Queue),
    bfs_search(Queue, Goal, FinalPath).

% Goal: Find a path from node a to node g
:- initialization(main).

main :-
    bfs(a, g, Path),
    write('Path: '),
    write(Path),
    nl,
    halt.

