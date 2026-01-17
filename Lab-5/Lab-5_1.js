// 1) Write a Node.js program using child_process.exec() to run the shell command to check the 
// current version of node. (A) 
const cp = require('child_process');
cp.exec("node --version",(err,stdout,stderr)=>{
    if(err){
        console.log('err:'+err);
    }
    else if(stdout){
        console.log('stdout:'+stdout);
    }
    else{
        console.log('stderr:'+stderr);
    }
})  