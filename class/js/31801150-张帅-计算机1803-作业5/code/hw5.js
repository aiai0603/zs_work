var R = require('ramda');



function Vec(x,y) {
    this.x = x;
    this.y = y;
  }
Vec.prototype.length = function() {
    return Math.sqrt((Math.pow(this.x,2)+Math.pow(this.y,2)))
};

Vec.prototype.plus = function(o1) {
    return new Vec(this.x+o1.x,this.y+o1.y)
}

Vec.prototype.minus = function(o1) {
    return new Vec(this.x-o1.x,this.y-o1.y)
}
 

function VectorMul(x,y) {
    Vec.call(this, x,y);  
}

VectorMul.prototype =Object.create(Vec.prototype);
  
VectorMul.prototype.constructor = VectorMul; 

VectorMul.prototype.dotMul= R.curry((number,vector)  => {
    this.x=vector.x*number;
    this.y=vector.y*number
    return this })

VectorMul.prototype.crossMul =R.curry((vector,vector2)  => {
    this.x=vector.x*vector2.x;
    this.y=vector.y*vector2.y;
    return this })



let myvec = new VectorMul(1,2);
console.log  (myvec.dotMul(3)(myvec)   )
    
let myvec2 = new VectorMul(2,2)
console.log  (myvec2.crossMul(myvec2)(myvec2) )

