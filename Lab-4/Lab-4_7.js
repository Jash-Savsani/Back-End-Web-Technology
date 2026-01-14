//  Write a program that prints the total memory and free memory in GB (B) 
const os = require('os');
let total_Memory = os.totalmem();
console.log('Total Memory : ',total_Memory/(1024 * 1024 * 1024));
let free_Memory = os.freemem();
console.log('Free Memory : ',free_Memory/(1024 * 1024 * 1024));