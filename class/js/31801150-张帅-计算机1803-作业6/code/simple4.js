console.log(/abc/.test("abc"))
console.log(/[abc]/.test("a"))
console.log(/[^abc]/.test("e"))
console.log(/[0-9]/.test("9"))
console.log(/[0-9]+/.test("999"))
console.log(/[0-9]+?/.test("999"))
console.log(/[0-9]??/.test(""))
console.log(/[0-9]*/.test(""))
console.log(/9{2,4}/.test("999"))
console.log(/(abc)/.test("abc"))
console.log(/a|b|c/.test("a"))
console.log(/\d/.test("2"))
console.log(/\w/.test("a"))
console.log(/\s/.test(" "))
console.log(/./.test("&"))
console.log(/\b/.test("word"))
console.log(/^\w/.test("w1212"))
console.log(/\d$/.test("w12121"))




