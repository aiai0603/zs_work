-module(third).
-export([greet/1]). 
greet(Gender) ->
  case Gender of
    male ->
      1;
    female ->
      2;
    _ ->
      3
  end.