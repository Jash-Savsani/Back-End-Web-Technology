// 4) Create a program that appends the text into a file named output.txt. (A) 
const fs = require('fs');
fs.appendFile("output.txt","Kem Cho? Moj Maa...",(err)=>{
    if(err) console.log(err);
})
console.log('SuccesFully');