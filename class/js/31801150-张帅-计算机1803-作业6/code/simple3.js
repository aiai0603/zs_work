console.log("THIS is a word".replace(/^(\w+)\s((\s?\w+)+?)/,"$2 $1"));
console.log("THIS is a word".replace(/^(\w+)\s((\s?\w+)+)/,"$2 $1"));