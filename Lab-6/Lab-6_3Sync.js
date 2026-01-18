const fs = require('fs');
try{
    fs.writeFileSync("output.txt","Hii Jash")
}catch(err){
    console.log('Error: ',err)
}
console.log('SuccesFully Done')
