// 6) Write a program that prints: (A) 
// • Operating system name 
// • Release version 
// • Platform 
// • Architecture 
const os  = require('os');
console.log('Operating system name : ',os.type());
console.log('Release Version name : ',os.version());
console.log('Platform name : ',os.platform());
console.log('Architecture(Bit System) name : ',os.arch());