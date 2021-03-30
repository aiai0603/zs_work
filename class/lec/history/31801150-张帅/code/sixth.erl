-module(sixth).
-compile(export_all).   
-import(seventh, [x/0]).   
  
start(Tag) ->   
    spawn(fun() -> loop(Tag) end).   
       
loop(Tag) ->   
    timer:sleep(3000),   
    Val = x(),   
    io:format("Vsn3 (~p) b:x() = ~p~n", [Tag, Val]),   
    loop(Tag).     