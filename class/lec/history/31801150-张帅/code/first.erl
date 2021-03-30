-module(first).
-export([add/2,add/1]). 
add(A, B) ->
A + B.
add(A) ->
A + 2,
A + 5.