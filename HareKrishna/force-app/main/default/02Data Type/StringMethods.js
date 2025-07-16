console.log("Arrays and Methods");

const capitalizeFirstLetter = (inputString)=>{
    let convertedArray = inputString.split(" ");//convert into an array
   let convertedMap = convertedArray.map(currItem => currItem[0].toUpperCase()+ currItem.slice(1));// convert the first letter in a word to capital
   let resultString = convertedMap.join(" ");// convert the array to string
 
    console.log(convertedArray);
    console.log(convertedMap);
      console.log("Result is", resultString);

};


capitalizeFirstLetter("hello world");

// second way of writing the function to convert the first letter to capital

const capitalLetter1 = (outputstring) => 
  outputstring.split(" ")
  .map((currItem)=> currItem[0].toUpperCase()+currItem.slice(1))
  .join(" ");
console.log(capitalLetter1("hello my dear children"));

//2.write a function that takes a string and reverse the string maintain the case of each character

const reverseString = (inputString1) => 
    inputString1.split("")
    .reverse()
    .join("");


console.log(reverseString("Hello world"));

//3.the number of occurrences of each character in a input

let count2 = function(word1){

    let counts ={};

    for(let i=0; i<word1.length; i++){

        let currentword =word1[i];
        console.log(currentword);
        if(counts[currentword]){
            counts[currentword] = counts[currentword]+1;
        }
        else{
            counts[currentword] =1;

        }
        }
        return counts;
    };

    console.log(count2("marry golld"));

//4.generate the username based on first and last name and middle name

const generateUsername = (inputString) => 
 //let uppercase = inputString.toUpperCase();
 //console.log("UpperCase is", uppercase);

 //let inputArray = uppercase.split(" ");
 //console.log(inputArray);
 //let initialsArray = inputArray.map((currItem) => currItem[0]);
 //console.log("initialsArray is", initialsArray);
 //let output = initialsArray.join("");
 //console.log("Output is", output);

 inputString
 .toUpperCase().split(" ")
 .map((currItem)=> currItem[0])
 .join("");
 
 console.log(generateUsername("abhi maha dj"));

 //5.takes an array of numbers as input and returns the unique numbers

 let uniqueNumbers =[1,2,3,4,3,5,4,6];
 console.log(uniqueNumbers);

 let unique = new Set(uniqueNumbers);
 console.log(unique);



