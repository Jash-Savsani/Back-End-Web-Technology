// 9) Write a program that checks if the file config.json exists in the current directory using 
// fs.existsSync() and prints the result. (B) 
const fs = require('fs');
console.log(fs.existsSync('config.json'));
console.log('Hello Bhai')