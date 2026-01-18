// 3) Create a program that writes the text into a file named output.txt. (A)
const fs = require('fs');
fs.writeFile("output.txt","Hii Jash",(err)=>{
    if(err) console.log('Error : ' , err);
})