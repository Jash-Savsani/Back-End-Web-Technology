const fs  = require('fs');
try{
    fs.copyFile('source.txt','backup.txt')
}catch(err){
    console.log('Error : ',err);
}
