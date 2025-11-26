% Exercise: last
% Write a predicate that finds the last element of a list.

last([E], E).  % The last element of a single-element list is that element.
last([_|XS], R)
  :- last(XS, R).  % The last element of a list with head _ and tail XS is the last element of XS.