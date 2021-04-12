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



  }
  let group = Group.from([10, 20]);

  console.log(group.has(10));
  // → true
  console.log(group.has(30));
  // → false
  group.add(10);
  group.delete(10);

  
  console.log(group.has(10));
