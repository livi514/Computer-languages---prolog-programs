% The member predicate is true when an element is a member of a list.
% Member works like 'elem' in Haskell.
% Prolog will match these clauses using unification.

% This first clause succeeds if the element E is the head of the list.
member(E, [E|_]).
% This second clause is the recursive case.
% If the first element is not E, ignore it (_), and check the tail XS.
% _ is a wildcard that matches any element (in thi case, any element at the head of the list).
% We don't need to check the head since we already know it is not E.
member(E, [_|XS]) 
  :- member(E, XS).

% How we would write member in Haskell:
% member :: [Int] -> Int -> Bool
% member [] e = False
% member (x:xs) e
%   | x == e    = True
%   | otherwise = member xs e

% Note: In Prolog, you can repeat variables in the same clause, unlike Haskell.
% For example, in the first clause of member/2, E is repeated.
% This is because Prolog uses unification to match variables.

% Statements are evaluated in order from top to bottom.
% We don't need to write a statement for an empty list in the Prolog program, 
% because the first clause will fail if the list is empty, returning false.

% Note about what "member/2" means:
% The "/2" indicates that the predicate "member" takes 2 arguments.