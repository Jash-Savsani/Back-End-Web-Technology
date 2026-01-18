// 2) Use fs.readFileSync() to read info.txt and print the content, Compare execution with the 
// asynchronous version. (A) 
const fs = require('fs');
try{
    const data = fs.readFileSync('temp1.txt',"utf8")//instead of using toString() function , we can use "utf8" parameter after file name
    console.log(data);   
}catch(err){
    console.log('Error : ',err);
}
console.log('Darshan University');