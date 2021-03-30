    const isEven=(a)=>{
        if(a<0) a=-a
        if(a===1)return false
        else if(a===0)return true
        else return isEven(a-2)
    }

    console.log(isEven(50))
    console.log(isEven(75))
    console.log(isEven(-1))
