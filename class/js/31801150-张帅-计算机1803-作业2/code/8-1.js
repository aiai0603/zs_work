function makeAccount(m){
    
    return money => {
        if(money===undefined)
            return m;
        else
            m =  m + money;
    }
}
let account = makeAccount(1000);
let account2 = makeAccount(100200);
account(-8900)
account(100)
console.log(account());



