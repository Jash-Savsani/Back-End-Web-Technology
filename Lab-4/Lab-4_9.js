// 9) Write a program that prints how long the system has been running (uptime) in seconds and in 
// hours. (B)  
const os = require('os');
console.log('In Hours : ',os.uptime()/(60*60));