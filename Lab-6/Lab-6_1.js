// 1) Write a Node.js program that uses fs.readFile() to read a file named data.txt asynchronously 
// and print its content on the console. (A) 
const fs = require('fs');
fs.readFile("temp1.txt",(err,data)=>{
    if(err) console.log('Error : ',err);
    else console.log(data.toString())
})
console.log('Darshan University');