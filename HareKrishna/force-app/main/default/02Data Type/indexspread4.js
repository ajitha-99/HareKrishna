console.log("Objects and Spread Operator");
//Objects are a collection of key-value pairs, where each key is a string and the value can be any data type.
//An object can be created using object literal notation, which is a comma-separated list of key-value pairs enclosed in curly braces. name and value are seperated by a colon. 
//the key is always a string and the value can be any data type.   
//you can also create an object using the Object() constructor, which is a built-in JavaScript function that creates an object.and access object values by using dot notation or bracket notation (.) and access object values by using bracket ([]) notation.
//you can create a javascript object from a JsON object literal, json.parse(myJson) and object into string by json.stringify(myobj).

let myDetails ={
    name: "Azitha",
    lname: "G",
    age: 35,
    skills: ["Admin", "Apex", "LWC"]
};

console.log("myDetails are", myDetails);

//json.stringify: object into string

let jsonString = JSON.stringify(myDetails);
console.log("jsonString is", jsonString);
console.log(typeof jsonString); // string

//json.parse: string into object

let jsonObject = JSON.parse(jsonString);
console.log("jsonObject is", jsonObject);
console.log("typeof jsonobject is", typeof jsonObject); // object

//modfiying object values and add new property using dot notation
myDetails.doy = "1990";
console.log("myDetails are ", myDetails);

// update object values using bracket notation
myDetails.age = 2023-1990;
console.log("myDetails are ", myDetails);

myCountry = "Country";
myDetails[myCountry] = "India"; // adding new property using bracket notation
console.log("myDetails are ", myDetails);

//adding spaces in key names and using "" to create key names with spaces                  
myDetails["City Name"] = "Pune"; // adding new property with space in key name
console.log("myDetails are ", myDetails);

//Accessing object values using dot notation '.', [] notation
let mycountry = myDetails.Country; // undefined, as country is not defined
console.log("mycountry is", mycountry);

let mycity = myDetails["City Name"]; // Bangalore
console.log("mycity is", mycity);

//Spread Operator ... allows us to quickly copy all or part of an existing array or object into another array or object.
//the operator shape is three dots (...) followed by the array or object to be copied.
//expanding string,combining arrays, copying arrays, copying objects, merging objects, and destructuring objects and creating new shallow copies of objects or arrays.

let numberone = [1, 2, 3];
let numbertwo = [4, 5, 6];

let combinedNumbers =[...numberone, ...numbertwo];
console.log(numberone);
console.log(numbertwo); // combining arrays
console.log("combinedNumbers are", combinedNumbers);

// expanding string

let  myName = "My name is Krishna";
console.log(myName);
console.log(...myName);

//add elements to an array using spread operator

numberone =[...numberone, 10,11,12];
numberone =[13,14,15, ...numberone, 21,22,23];
console.log("numberone after adding elements is", numberone);

//adding the object

let myObj1 = {
    fname: "Azitha1",
    age: 37,
    myskills: ["Admin1", "Apex1", "LWC1"]
};
let myObj2 = {
    lname: "G1",
    age: 38,
    myskills: ["Admin2", "Apex2", "LWC2"]
};
let finalObj = {...myObj1, ...myObj2};
console.log("My final Object is", finalObj);

//copy an array and object using spread operator

//if we want to copy an array using spread operator does not impact the original array, it creates a shallow copy of the array.
//A shallow copy means that the new array will have the same elements as the original array, but the new array is not linked to the original array.

let myFruits = ["Apple", "Banana", "Orange"];
let myFavFruits = myFruits;
myFavFruits.push("Grapes"); // this will change the original array as well, as myFavFruits is a reference to myFruits
console.log("myFavFruits are", myFavFruits);
let myFruitsCopy = [...myFruits];
console.log("myfruits are", myFruitsCopy);
myFruitsCopy.push("Mango");
console.log("myFruitsCopy after adding Mango is", myFruitsCopy);//Deep copy in array in java script
console.log("myFruits after adding Mango is", myFruits); // myFruits is not changed, as we have created a copy of the array

let myDetails2 ={
    name: "Azitha2",
    lname: "G2",
    age: 36,
    skills: ["Admin2", "Apex2", "LWC2"]
};

let myDetailsCopy = {...myDetails2}; // this will create a shallow copy of the object
myDetailsCopy.age = 37; // changing the age in the copied object
console.log("myDetails2 is", myDetails2); // original object is not changed
console.log("myDetailsCopy is", myDetailsCopy);

//Destructuring Objects
//Destructuring is a convenient way to extract values from objects and arrays into distinct variables.  
//It allows you to unpack values from arrays or properties from objects into distinct variables.
//Destructuring can be used with both arrays and objects, but the syntax is slightly different for each. and makes it easier to work with complex data structures by allowing you to extract only the values you need.
// the order that available in the array is important, as it will extract the values based on the order of the array.

console.log("Destructuring Objects");
let myDetails3 = [
"Mango", "cherry", "Avacado", "Plum"
];

let myDetails4 = myDetails3[0];
console.log("myDetails4 is", myDetails4); 
// leaving space in the array when we don't want the specific values to be populated, so that we can extract the values based on the order of the array
// destructuring the array
let [myDetails5, , myDetails7, myDetails8] = myDetails3; // destructuring the array
console.log("myDetails5 is", myDetails5);
console.log("myDetails5 is", myDetails8);
console.log("myDetails5 is", myDetails7);
// using rest operator to extract the remaining values into an array
// the rest operator is used to extract the remaining values into an array, it is used with
//Unpacking the remaining values into an array using the rest operator
// the rest operator is used to extract the remaining values into an array, it is used with
let [favoriteFruit1,favoriteFruit2, ...otherFruits] = myDetails3;
console.log("favoriteFruit1 is", favoriteFruit1);
console.log("favoriteFruit2 is", favoriteFruit2);
console.log("otherFruits are", otherFruits); // otherFruits will contain the remaining values in the array

//Destructuring Objects
//Destructuring objects allows you to extract values from an object and assign them to variables in a more concise way.

let myDetailsObj = {
    name: "Mahalakshmi",
    lname: "G",
    age: 35,

};
//same name as the key name in the object, so that we can extract the values from the object and assign them to variables with the same name as the key name in the object.
//Destructuring the object
let {name: firstName, lname:LastName, age} = myDetailsObj; // destructuring the object
console.log("name is", firstName);

//interpolation of variables in string
let myString = `My name is ${firstName} ${LastName} and I am ${age} years old.`;
console.log("myString is", myString);

//splitting the string into an array using split() method and inside the split leave space between the quotes to split the string by space.
//split() method is used to split a string into an array of substrings, and returns
let myName3 = "My name is AbhiMaha";
let myNameArray = myName3.split(" ");
console.log("myNameArray is", myNameArray); // splitting an array
console.log(myNameArray[0]);
