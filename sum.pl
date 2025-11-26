% Example from lecture 12

% The sum predicate adds up the items in a list.

% Remember: In Haskell, we have to write the data types, but not in Prolog.
% In Prolog, we write logical "facts".

% The answer appears in the last argument position (this does not apply to Boolean predicates).
sum([], 0).  % The sum of an empty list is 0.
% X is the head of the list, XS is the tail of the list.
sum([X|XS], R)
    % The conditions are shown after the ":-" symbol.

    % This is the recursive case, we get the tail and sum it up recursively.
    :- sum(XS, R1),

    % This is the base case, we add the head to the result of summing the tail.
      R is X + R1.

% There is no iteration in Prolog hence why we are using recursion here.