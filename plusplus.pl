plusplus([],YS,YS).
plusplus([X|ZS], YS, [X|WS])
:- plusplus(XS, YS, WS).