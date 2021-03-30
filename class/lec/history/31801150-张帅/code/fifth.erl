-module(fifth).
-export([right/1]). 
right(X) when X>=10,X=<100 -> 
    true;
right(X) when X<10;X>105 ->
    false.