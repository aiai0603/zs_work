function makeAccount(kind){
        return (m) =>{
            return (money) => {
                if(money===undefined)
                    return kind + " " +m;
                else
                    m =  m + money;
            }
        }
       
}
var rmbAccount = makeAccount('RMB'); 
var account = rmbAccount(100);
console.log(account())
var dollarAccount = makeAccount('$'); 
var account2 = dollarAccount(10000);
console.log(account2())


