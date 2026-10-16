% Experiment 2: Arithmetic Operations, Factorial, and Fibonacci Series Using Recursion

domains
    num = integer

predicates
    arithmetic(num, num)
    factorial(num, num)
    fibonacci(num, num)

clauses
    arithmetic(A, B) :-
        Sum = A + B,
        Diff = A - B,
        Prod = A * B,
        write("Addition: "), write(Sum), nl,
        write("Subtraction: "), write(Diff), nl,
        write("Multiplication: "), write(Prod), nl,
        write("Division: "), Div = A / B,
        write(Div), nl.

    factorial(0, 1).
    factorial(N, F) :-
        N > 0,
        N1 = N - 1,
        factorial(N1, F1),
        F = N * F1.

    fibonacci(0, 0).
    fibonacci(1, 1).
    fibonacci(N, F) :-
        N > 1,
        N1 = N - 1,
        N2 = N - 2,
        fibonacci(N1, F1),
        fibonacci(N2, F2),
        F = F1 + F2.

goal
    arithmetic(10, 2),
    factorial(5, F),
    write("Factorial: "), write(F), nl,
    fibonacci(6, Fib),
    write("Fibonacci number: "), write(Fib), nl.

