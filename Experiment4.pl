% Experiment 4: Develop a College Timetable Knowledge Base

domains
    faculty, subject, classroom, day = symbol

predicates
    teaches(faculty, subject)
    room(subject, classroom)
    scheduled(subject, day)

clauses
    teaches(amit, java).
    teaches(neha, python).
    teaches(rahul, ai).
    teaches(priya, dbms).

    room(java, room101).
    room(python, room102).
    room(ai, room103).
    room(dbms, room104).

    scheduled(java, monday).
    scheduled(python, tuesday).
    scheduled(ai, wednesday).
    scheduled(dbms, thursday).

goal
    teaches(amit, java),
    write("Faculty Amit teaches Java"), nl,

    room(python, R),
    write("Python Classroom: "), write(R), nl,

    scheduled(ai, D),
    write("AI Class Day: "), write(D), nl.

