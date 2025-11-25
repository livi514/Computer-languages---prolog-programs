% EXAMPLE FROM LECTURE 11

% The Times Suko problem challenges readers to arrange the digits between one and nine 
% in the cells of a 3x3 grid, so that the numbers in the 4 grey circles are the totals
% of the digits in the cells surrounding them, and the numbers in the three coloured
% circles are the totals of the digits in the cells of the same colour.

% A solution to a suko problem is a permutation of the digits 1 to 9 that satisfies the constraints given above.

% The generate-and-select design pattern can be used to describe a good solution to the Suko problem.

% In this pattern, the generator creates a possible candidate solution.
% Here, we generate a permutation of the digits 1-9.
generator(X)
    :- permutation([1,2,3,4,5,6,7,8,9], X).

% The selector checks which of the candidates generated above satisfy the constraints.
% (Check lecture notes for a diagram of the Suko grid to understand the constraints.)
selector([X1,X2,X3,X4,X5,X6,X7,X8,X9])
    :- 15 is X1 + X2 + X4 + X5,
        14 is X2 + X3 + X5 + X6,
        26 is X4 + X5 + X7 + X8,
        23 is X5 + X6 + X8 + X9,
        16 is X1 + X2 + X3 + X4,
        17 is X5 + X7 + X8,
        12 is X6 + X9.

% When you run main, Prolog:
% 1. generates a permutation of the digits 1-9,
% 2. checks if it satisfies the constraints,
% 3. if it does, writes the solution to the output.
main
    :- generator(X), selector(X), write(X). 


% Note about backtracking:

% The generate-and-select pattern relies directly on Prolog's backtracking mechanism.
% What is backtracking?
% Backtracking is Prolog's process of:
% 1. trying a choice (e.g., generating a candidate solution),
% 2. checking if it leads to a solution (e.g., checking constraints),
% 3. if not, going back to the choice point and trying a different option (e.g., generating a different candidate solution).
% This continues until a solution is found or all options are exhausted.

% Backtracking in the generator:
% After one permutation is returned
% Prolog suspends execution at the call to permutation
% If later constraints fail, Prolog backtracks and asks permutation for the next permutation
% So the generator produces permutations one-by-one using backtracking.

% Backtracking in the selector:
% If the constraints fail for a given permutation,
% Prolog backtracks to the call to selector
% and then backtracks further to the call to generator
% to get a new permutation to try.