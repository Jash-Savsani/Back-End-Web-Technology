// 10) Write a Node.js program that prints: (B) 
// • Number of CPU cores 
// • Model name of each core 
// • Network interface details 
const os  = require('os');
console.log('CPU Cores Details : ',os.cpus());
let count=0;
for(let i=1;i<=os.cpus().length;i++){
    count++;
}
console.log('Total Core is : ',count);
console.log('NetWork-InterFaces-Details : ',os.networkInterfaces());