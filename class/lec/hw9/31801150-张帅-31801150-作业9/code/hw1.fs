type cell = 
   | Next of int * cell
   | NULL

let cell = Next(1,Next(2,Next(3,NULL)));;
