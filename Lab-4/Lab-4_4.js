//  Write a program that checks whether the given path is absolute or relative paths.
const path = require('path');
const path_name = '/jash/savsani/abc.txt';
if(path.isAbsolute(path_name)){
    console.log('Given Path is Absolute.');
}else{
    console.log('Given Path is Relative');
}