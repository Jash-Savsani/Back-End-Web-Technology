//  Write a Node.js program that uses path.resolve() to convert "folder", "subfolder", "app.js" 
// into an absolute path. Print the final resolved path. (A) 
const path = require('path');
console.log(path.resolve('folder','subfolder','abc.txt'));