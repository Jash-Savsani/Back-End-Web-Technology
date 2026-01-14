// Write a Node.js program that prints the directory name, file name, file extension, and full 
// path of the code file. (A) 
const path = require('path');
console.log('Directory Name : ',path.dirname('./jash/savsani/abc.txt'));
console.log('File Name : ',path.basename('./jash/savsani/abc.txt'));
console.log('File Extension Name : ',path.extname('./jash/savsani/abc.txt'));
console.log('Absolute Path Name : ',path.resolve('./jash/savsani','./abc.txt'));
console.log('Absolute Path Name : ',path.resolve('./jash/savsani/abc.txt'));