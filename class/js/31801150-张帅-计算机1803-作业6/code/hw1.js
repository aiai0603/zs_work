class MultiplicatorUnitFailure extends Error {}

function primitiveMultiply(a, b) {
  if (Math.random() < 0.2) {
    return a * b;
  } else {
    throw new MultiplicatorUnitFailure();
  }
}

function reliableMultiply(a, b) {
  try{
    return primitiveMultiply(a,b);
  }catch(e){
    if (e instanceof  MultiplicatorUnitFailure) {
        return reliableMultiply(a,b);
    }
  }

}

console.log(reliableMultiply(8, 8));

