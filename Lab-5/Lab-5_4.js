// 4) Write a program that parses the given URL, Print protocol, hostname, pathname, and query 
// parameters separately. (A) 
const data = "https://temp-user:9sd82Ks!@files.example.com:443/downloads/temp/file12345.png?expires=1733655000&token=ab90f3k2l9#view";
const url = new URL(data);
console.log('Protocol:'+url.protocol)
console.log('Hostname:'+url.hostname)
console.log('Pathname:'+url.pathname)
url.searchParams.forEach((value,key)=>{
    console.log("Key : ",key,"    Value : ",value);
}) 