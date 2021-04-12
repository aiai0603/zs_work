class Ob1  {
  static test() {
      return 12;
  }
};
let o1 = new Ob1();
console.log(o1.test);
console.log(Ob1.test())
