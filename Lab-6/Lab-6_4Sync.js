const fs = require('fs');
try{
    fs.appendFile("output.txt","Kem Cho? Moj Maa...")
}catch(err){
    console.log('Error : ',err);
}
console.log('SuccesFully');