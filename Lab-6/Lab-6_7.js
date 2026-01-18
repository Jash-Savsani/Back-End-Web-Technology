// 7) Write a program to list all files in a folder called documents/ using fs.readdir() and print the 
// file names one by one. (B) 
const fs = require('fs');
fs.readdir('../Lab-6',(err,data)=>{
    if(err) console.log('Error : ',err);
    else{
        let counter = 0;
        data.forEach((value)=>{
            console.log(++counter,'. ',value);
        })
    }
})