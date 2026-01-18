// 6) Write a program that creates a folder named my-data using fs.mkdir(). If the folder already 
// exists, show an appropriate message. (B) 
const fs = require('fs');
fs.mkdir('temp-folder',(err)=>{
    if(err){
        if(err.code == 'EEXIST'){
            console.log('Given Folder is Already Created');
        }else{
            console.log('Error Cheating');
        }
    }
})