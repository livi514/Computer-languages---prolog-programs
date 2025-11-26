% A predicate to reverse a list.
reverse([], []).  % The reverse of an empty list is an empty list.
reverse([X|XS],R)
  :- reverse(XS, W)
    , append(W, [X], R).  % Append the head X to the end of the reversed tail R.