let o1 = {
  
    get size() {
      return 22;
    },
    set size(s) {
        this.c=  s+22; 
    }

  };
console.log(o1.size);
o1.size = 18
console.log(o1.c)
