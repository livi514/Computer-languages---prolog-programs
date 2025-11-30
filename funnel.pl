% Funnel teaser:
% Betty, being a keen mathematician, has devised a game to improve her children's maths additions.
% She constructed an inverted triangular tiling of hexagonal shapes, with 9 hexagons in the top row,
% 8 in the next row, down to 1 in the bottom row. 
% Then, completing the top row with 0s and 1s, she asks them to complete each row below
% by adding inn each hexagon the two numbers in the hexagons directly above it.

% In the last game, she noticed that if the top row is considered as a base-2 binary number,
% then this is exactly four and a half times the bottom total.

% The answer given by the newspaper was 102.

%The generate-and-select design pattern can be used to describe a good solution to the number funnel problem,
% obtained by picking out values from a generator using a selector.

% main uses the generator to produce numbers from 1 to 510,
% then uses the selector to filter those numbers according to the funnel rule,
% and finally writes the selected numbers to the output.
main
  :- generator(X), selector(X), write(X).

% The generator yields successive 9-bit values that might provide solutions to the number funnel problem.
% We are excluding 0 and 511 as the teaser specifically says that the binary number has 0s and 1s.
% (The constrains can be adjusted as needed.)
generator(N)
  :- between(1, 510, N).

% The selector can be used to pick out those values that do provide solutions to the number funnel problem.
% Each value is a number N whose nine binary digits fill the top row of a funnel, 
% and yield a number R in the bottom row such that N = 4.5 * R.
selector(N)
  :- digits2(N, DS), % Convert N to binary digits
      pad0(9, 0, DS, ES), % Pad to 9 digits with leading zeros
      funnel(ES, R), % Apply the funnel process
      N is R * 9 / 2. % Check if the result matches the required condition

% Funnel process implementation

% A next row may be computed from the current one by adding adjacent pairs of numbers.
next([N1,N2], [W])
  :- W is N1 + N2. 
next([N1,N2|NS], [W|WS])
  :- W is N1 + N2,
      next([N2|NS],WS).

% Funnel predicate that reduces the list to a single number
% The result of a funnel computation with a top row of numbers is recursively that of a funnel computation with 
% a next row of numbers, until a row with just one number is reached, and the result is that number.
funnel([N], N).
funnel(NS, R)
  :- next(NS, WS), 
      funnel(WS, R).

% Convert a number to its binary representation as a list of digits
% A number may be converted to a sequence of binary digits by recursively dividing the number by 2, 
% and writing the remainders as binary digits in reverse, until the number is less than 2 and is written as a single digit.
digits2(N, [N]) :-
  N < 2.
digits2(N, W) :-
  N >= 2,
  divMod(N, 2, D, M),
  digits2(D, R),
  append(R, [M], W).

% Integer division and modulo
divMod(A, B, D, M) :-
  D is A div B,
  M is A mod B.

% Pad a list XS with leading Xs to ensure it has at least N elements
pad0(N, _, XS, XS)
  :- length(XS, T),
      T >= N.
pad0(N, X, XS, [X|WS])
  :- length(XS, T),
      T < N,
      N1 is N - 1,
      pad0(N1, X, XS, WS).