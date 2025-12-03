% Example from lecture 13

% I have written down an above-freezing temperature, a whole number of degrees Celsius,
% in which the digits are all different and are in decreasing order. 
% I have then calculated the Fahrenheit equivalent.
% It is also a whole number whose digits are all different, 
% but here the digits are in increasing order.

% Note: we need to press 'next' to see all the possible solutions. 
% There is a 'riddle' aspect to this problem, as there are multiple solutions.
% 'if I told you the first digit of the Celsius temperature, 
% you would not be able to calculate it, however, if I told you the last digit,
% then it would be possible to calculate it.'

% The solution given by the newspaper was 75C/167F.

% generate-and-select design pattern
main
  :- generator(X), selector(X), write(X).

% generating successive Celsius temperatures from 1 to 10000
% no guidance is given on the upper bound, however, we are told that 
% the temperature is above freezing (0C) and whole number of degrees.
generator(C)
  :- between(1, 10000, C).

% The selector picks out those Celsius temperatures that meet the criteria
selector(C)
  :- c2f(C, W),
    whole(W),
    F is truncate(W),
    digits(C, CS),
    different(CS),
    decreasing(CS),
    digits(F, FS),
    different(FS),
    increasing(FS).

% Celsius to Fahrenheit conversion
c2f(C, F)
  :- F is 1.8 * C + 32.

% check if a number is whole, based on floor and ceiling functions
whole(X)
  :- floor(X) =:= ceil(X).

% check if the digits in a list are strictly decreasing
decreasing([]).
decreasing([_]).
decreasing([D1,D2|DS])
  :- D1 > D2,
    decreasing([D2|DS]).

% check if the digits in a list are strictly increasing
increasing([]).
increasing([_]).
increasing([D1,D2|DS])
  :- D1 < D2,
    increasing([D2|DS]).

% check if all digits in a list are different
different([]).
different([X|XS]) :-
  \+ member(X,XS),
    different(XS).

% convert a number to its digits as a list
digits(N, [N])
  :- N < 10.
digits(N, W)
  :- N >= 10,
    divmod(N, 10, D, M),
    digits(D, R),
    append(R, [M], W).

% integer division and modulo
divmod(A, B, D, M)
  :- D is A div B,
    M is A mod B.

  