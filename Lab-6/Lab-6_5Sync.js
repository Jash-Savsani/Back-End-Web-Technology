const fs = require('fs');
try{
    fs.unlink('temp2.txt')
}catch(err){
    console.log('Error : ',err);
}
