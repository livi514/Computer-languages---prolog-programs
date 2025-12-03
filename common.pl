% Lecture 14 examole
% Eight friends met at a party: Alan, Cary, James, Lucy, Nick, Ricky, Steve and Victor,
% with Lucy being the youngest.
% For each of them, the square of their age was a three-digit number consisting of three different digits.
% Furthermore, for any two of them, the squares of their ages had had at least one digit in common
% precisely if their names had at least one letter in common.

% (Note: you have to treat all the names as lowercase for this problem.)

% The solution given by the newspaper was 19, 31, 29, 16, 25, 23, 28, and 27.

age(A)
  :- between(10, 31, A),
     N is A * A,
    digits(N, S),
    different(S).

digits(N, [N])
  :- N < 10.
digits(N, W)
  :- N >= 10,
    divmod(N, 10, A, B),
    digits(A, V),
    append(V, [B], W).

divmod(P, Q, A, B)
  :- A is P div Q,
    B is P mod Q.

different([]).
different([X|XS])
  :- \+ member(X, XS),
    different(XS).

generator([A,C,J,L,N,R,S,V])
  :- age(L),
    age(A), A > L,
    age(C), C > L, \+ member(C, [A]),
    age(J), J > L, \+ member(J, [A,C]),
    age(N), N > L, \+ member(N, [A,C,J]),
    age(R), R > L, \+ member(R, [A,C,J,N]),
    age(S), S > L, \+ member(S, [A,C,J,N,R]),
    age(V), V > L, \+ member(V, [A,C,J,N,R,S]).

selector([A,C,J,L,N,R,S,V])
  :- check([a,l,a,n],   [c,a,r,y],     A, C),
    check([a,l,a,n],   [j,a,m,e,s],   A, J),
    check([a,l,a,n],   [l,u,c,y],     A, L),
    check([a,l,a,n],   [n,i,c,k],     A, N),
    check([a,l,a,n],   [r,i,c,k,y],   A, R),
    check([a,l,a,n],   [s,t,e,v,e],   A, S),
    check([a,l,a,n],   [v,i,c,t,o,r], A, V),
    check([c,a,r,y],   [j,a,m,e,s],   C, J),
    check([c,a,r,y],   [l,u,c,y],     C, L),
    check([c,a,r,y],   [n,i,c,k],     C, N),
    check([c,a,r,y],   [r,i,c,k,y],   C, R),
    check([c,a,r,y],   [s,t,e,v,e],   C, S),
    check([c,a,r,y],   [v,i,c,t,o,r], C, V),
    check([j,a,m,e,s], [l,u,c,y],     J, L),
    check([j,a,m,e,s], [n,i,c,k],     J, N),
    check([j,a,m,e,s], [r,i,c,k,y],   J, R),
    check([j,a,m,e,s], [s,t,e,v,e],   J, S),
    check([j,a,m,e,s], [v,i,c,t,o,r], J, V),
    check([l,u,c,y],   [n,i,c,k],     L, N),
    check([l,u,c,y],   [r,i,c,k,y],   L, R),
    check([l,u,c,y],   [s,t,e,v,e],   L, S),
    check([l,u,c,y],   [v,i,c,t,o,r], L, V),
    check([n,i,c,k],   [r,i,c,k,y],   N, R),
    check([n,i,c,k],   [s,t,e,v,e],   N, S),
    check([n,i,c,k],   [v,i,c,t,o,r], N, V),
    check([r,i,c,k,y], [s,t,e,v,e],   R, S),
    check([r,i,c,k,y], [v,i,c,t,o,r], R, V),
    check([s,t,e,v,e], [v,i,c,t,o,r], S, V).

check(N1, N2, A1, A2)
  :- T1 is A1 * A1,
     T2 is A2 * A2,
    digits(T1, S1),
    digits(T2, S2),
    exactly(N1, N2, S1, S2).

exactly(N1, N2, S1, S2)
  :- intersection(N1, N2, VS), VS = [],
    intersection(S1, S2, WS), WS = [].
exactly(N1, N2, S1, S2)
  :- intersection(N1, N2, VS), VS \= [],
    intersection(S1, S2, WS), WS \= [].

main
  :- generator(X), selector(X), write(X).