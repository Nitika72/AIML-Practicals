% Experiment 1: Create a Simple Knowledge Base Using Prolog

domains
    student, course = symbol

predicates
    enrolled(student, course)

clauses
    enrolled(rahul, java).
    enrolled(priya, python).
    enrolled(amit, java).
    enrolled(neha, python).

goal
    enrolled(rahul, java).