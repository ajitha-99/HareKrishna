console.log('Arrays and Strings');

let myDetails = 'My name is Azitha';

// length of the string
console.log("myDetails", myDetails.length);

// Extracting the string
 let text = 'Apple, Banana, Kiwi';

 console.log(text);
 // three methods to extract the string
 //1.slice(start,endposition+1)(end is not included)
 //2.substring(start,end);
 //3.substr(start,length);
//4.reverse (); reverses the word


 //slice
 //indexOf is used to check the postion of a string
  let sliceBanana2 = text.slice(" ");
  console.log("sliceBanana2", sliceBanana2);
  


  let sliceBanana = text.slice(text.indexOf("Banana"));
  console.log("sliceBanana", sliceBanana);


 let sliceBanana1 = text.slice(text.indexOf("Banana"),text.indexOf("Banana")+6);
 console.log("sliceBanana Index is", sliceBanana1);

 let sliceRemainingFruits = text.slice(7);
 console.log(sliceRemainingFruits);

 //slice with negative start position
 let sliceNegativestart = text.slice(-12);
 console.log(sliceNegativestart);

 //substirng
 //if you pass negative value in position it will start from the right side and treat as zero

 let substringBanana = text.substring(7,13);
 console.log(substringBanana);
// negative value is trated as zero
 let substringNegative = text.substring(-12);
 console.log(substringNegative);

 //substr
 //substr is used to extract the substring with the given length
 let substrBanana = text.substr(7,6);   
 console.log("substr", substrBanana);

 //replace
 //replace is used to replace the substring with the given string.
 // will only replace the first match and is case sensitive and will not modify the existing string
 let replaceBanana = text.replace("Banana","Mango");
 console.log(replaceBanana);
 console.log(text);

 //Uppercase and lowercase

 console.log(myDetails);
 console.log(myDetails.toUpperCase());
 console.log(myDetails.toLowerCase());

 //concatenation

 let text1 = "Hello";
 let text2 ="world";

 let text3 = text1.concat(" ",text2);
 console.log("text3",text3);

 console.log(`${text1} ${text2}`);

 let concatenationstring = `${text1} ${text2}`;
 console.log("concatenationstring is", concatenationstring);

 //trim

 let trimMe = '         Hello Myworld  ';
 console.log("trimMe",trimMe);
 console.log(trimMe.trim());
 console.log(trimMe.trimStart());
 console.log(trimMe.trimEnd());

//trimStart()
//trimEnd()

//Padding and Spacing

let myNumber = "5"; //00005

console.log("MyNumber is", myNumber);
console.log(myNumber.padStart(6,'0'));
console.log(myNumber.padEnd(6,'$'));

//split
// to break string with the array using any character
let mycsvDetails = "Ankit Amit Nidhi Kiyaan Hare";
let mycsvDetailsArray = mycsvDetails.split(" ");
console.log(mycsvDetails);
console.log("mycsvDetailsArray is", mycsvDetailsArray);

//array into string
//tostring
//join

let myToString = mycsvDetailsArray.toString();
console.log("myToString is", myToString);

let joinString = mycsvDetailsArray.join(" ");
console.log("Join string is", joinString);

// search the string
//search is used to
//indexof method return the postion of a string
// return -1 if not present
//includes method

console.log(text);
console.log(text.indexOf("Banana"));
console.log(text.indexOf("Mango"));
console.log(text.includes("Banana"));

//startsWith -- string starts with a particular string
//endsWith -- string ends with a particular string
//endsWith  

console.log(text.startsWith("Apple"));
console.log(text.endsWith("Mango"));



//duplicates
//break the string into array --->split
//convert array into set--->conversion
//combine the set --->join
//map joins the array into string 

let myString = "Apple,Banana,Mango,Apple,Banana,Mango";

let mystringArray = myString.split(" ");
console.log(mystringArray);

let finalArray =[];

mystringArray.map((currItem) =>{
    if(!finalArray.includes(currItem)){
        console.log(finalArray);
        finalArray = [...finalArray,currItem];
        console.log(finalArray);
    }
    }   );

    console.log(finalArray);
    console.log(finalArray.join(" "));

    let myArrayString = (word) =>{
        return word.split(" ")
        .map(word => word.charAt(0).toUpperCase() + word.slice(1))
        .join(" ");
    };

    let result = myArrayString("hello world");
    console.log("Result is", result);


    let count1 = function(letters){

    let count = {};
    for(let i=0; i<letters.length; i++){

        let currentLetter =letters[i];
        if(count[currentLetter]){
            count[currentLetter] = count[currentLetter]+1;
        }else{
            count[currentLetter] = 1;   
        }

    }
    return count;
};

console.log("count", count1("Hello"));

let count2 = function(word1){

    let counts ={};

    for(let i=0; i<word1.length; i++){

        let currentword =word1[i];
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


