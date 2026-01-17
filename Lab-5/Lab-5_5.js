// 5) Create a new URL object with base, then append pathname and query, also print the final 
// URL. (B) 
const urlObj = new URL("https://temp-user:9sd82Ks!@files.example.com:443/downloads/temp/file12345.png?expires=1733655000&token=ab90f3k2l9#view");
urlObj.pathname="/jash/savsani";
urlObj.searchParams.append("movie","spirit")
urlObj.searchParams.append("song","joota-japani")
console.log('New URL:',urlObj.toString());