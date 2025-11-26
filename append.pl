% A predicate to append two lists.

append([], YS, YS).  % Appending an empty list to YS results in YS.
% Otherwise, we use recursion to append the head of the first list (X) to the result of appending the tail (XS) to YS.
append([X|XS], YS, [X|WS])
    :- append(XS, YS, WS).

