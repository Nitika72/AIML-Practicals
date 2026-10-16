% Experiment 5: Classify Students as Topper, Average, and Fail

domains
    student = symbol
    marks = integer

predicates
    score(student, marks)
    topper(student)
    average(student)
    fail(student)

clauses
    score(rahul, 95).
    score(priya, 75).
    score(amit, 35).
    score(neha, 88).

    topper(X) :-
        score(X, M),
        M >= 90.

    average(X) :-
        score(X, M),
        M >= 40,
        M < 90.

    fail(X) :-
        score(X, M),
        M < 40.

goal
    topper(rahul),
    write("Rahul is a Topper"), nl,

    average(priya),
    write("Priya is an Average Student"), nl,

    fail(amit),
    write("Amit has Failed"), nl.

