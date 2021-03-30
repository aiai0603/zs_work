-module(fourth).
-export([greet/1]). 
greet(Gender) ->
  if 
	Gender == male -> 
	1;
  	Gender == female -> 
	2
  end.