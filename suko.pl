main
    :- generator(X), selector(X), write(X). 

generator(X)
    :- permutation([1,2,3,4,5,6,7,8,9], X).

selector([X1,X2,X3,X4,X5,X6,X7,X8,X9])
    :- 15 is X1 + X2 + X4 + X5,
        14 is X2 + X3 + X5 + X6,
        26 is X4 + X5 + X7 + X8,
        23 is X5 + X6 + X8 + X9,
        16 is X1 + X2 + X3 + X4,
        17 is X5 + X7 + X8,
        12 is X6 + X9.