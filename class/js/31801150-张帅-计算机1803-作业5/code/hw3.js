class Group {
    constructor(){
        this.data = []
    }
    static from(d){
        let newGroup = new Group();
        for(let value of d){
            newGroup.data.push(value)
        }

        return newGroup;
    }

    has(num){
       
        if(this.data.indexOf(num) !== -1){
            return true;
        }else{
            return false;
        }
    }

    add(num){
       
        if(this.data.indexOf(num) === -1){
            this.data.push(num)
        }
    }

    delete(num){
        let index = this.data.indexOf(num);
        if(index !== -1){
            this.data.splice(index,1)
        }
        
    }


    [Symbol.iterator]() {
            this.current = 0
            this.length = this.data.length
            return this;
    }
    next(){
    
        if (this.current < this.length)
            return {done:false,value:this.data[this.current++]};
        else 
            return {done:true};
        
    }


 
}


  for (let value of Group.from(["a", "b", "c"])) {
    console.log(value);
  }