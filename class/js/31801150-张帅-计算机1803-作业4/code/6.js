var _ = require('ramda');

//loop:: undefined -> (Number -> undifined) -> (Number-> Boolean)-> Number
var loop = _.curry(

  function(start, bool, updated, todo ){  

  if( bool(start) ) {
  todo(start);

  loop( updated(start), bool, updated,todo)

}else{
  return ;
} });


loop(3, n => n > 0, n => n - 1, console.log);







