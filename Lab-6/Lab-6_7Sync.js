const fs = require('fs');
try{
    data = fs.readdirSync('../Lab-6')
    let counter = 0;
    data.forEach((value)=>{
        console.log(++counter,'. ',value);
    })
}catch(err){
    console.log('Error : ',err);
}
