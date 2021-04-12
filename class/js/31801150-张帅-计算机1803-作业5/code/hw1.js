class Vec{
    constructor(x,y){
        this.x = x;
        this.y = y;
    }

    get length(){
        return Math.sqrt((Math.pow(this.x,2)+Math.pow(this.y,2)))
    }

    plus(o1){
        return new Vec(this.x+o1.x,this.y+o1.y)
    }

    minus(o1){
        return new Vec(this.x-o1.x,this.y-o1.y)
    }
}

console.log(new Vec(1, 2).plus(new Vec(2, 3)));
console.log(new Vec(1, 2).minus(new Vec(2, 3)));
console.log(new Vec(3, 4).length);