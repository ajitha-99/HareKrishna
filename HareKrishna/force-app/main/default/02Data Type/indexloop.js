console.log("Looping and Collections");
// Looping through arrays and objects using for...of and for...in loops 

let myFavCars = ["BMW", "Audi", "Mercedes","TATA", "Tesla"];

let myDetails ={
    fname: "Azitha",
    lname: "G", 
    age: 55
}


//for for(initilization; condition; increment/decrement) loop

for(let i=0; i < myFavCars.length; i++) {
    console.log(`${i+1}. ${myFavCars[i]}`);
}

//while while(condition) loop

let currentIndex =0;
console.log(myFavCars.length);
while(currentIndex < myFavCars.length){
    console.log(`${currentIndex+1}. ${myFavCars[currentIndex]}`);
    currentIndex = currentIndex+1;

}

//do while do{ }while(condition) loop
// do while loop will always execute at least once irrespective of the condition
//syntax: do{ }while(condition);
do{
    console.log("Do while loop");
}while (1 === 2);

//for...of loop
// The for...of loop is used to iterate over iterable objects like arrays, strings, maps    
// for(let currentitem of myFavCars)
//syntax: for(let item of iterableObject) { // code to be executed for each item in the iterableObject }
// The for...of loop is a modern way to iterate over arrays and other iterable objects in JavaScript.

for(let currentItem of myFavCars){
    console.log("currentItem", currentItem);
} 

//index and item when we give entries
// The for...of loop can also be used with the entries() method to get both the index and the item in an array. 

for(let [index, car] of myFavCars.entries()){
    console.log(`${index+1}.  ${car}`);
}
// to make object iterable we have thre methods:
// 1. Symbol.iterator
// 2. forEach method
// 3. Object.keys(), Object.values(), Object.entries()
for(let currentItem of Object.keys(myDetails)){
    console.log("Current Item", currentItem);
    console.log("Property Name", myDetails[currentItem]); // accessing value using key   
}

for(let currentItem of Object.values(myDetails)){
    console.log("Current Item", currentItem);
}

for(let currentItem of Object.entries(myDetails)){
    console.log("Current Item", currentItem);
}

// destructuring the currentItem to get key and value
for(let [key, value] of Object.entries(myDetails)){
    console.log(key, value);
}

// for...in loop
// The for...in loop is used to iterate over the enumerable properties of an object.
// It iterates over the keys of the object, allowing you to access both the key and
// syntax: for(let key in object) { // code to be executed for each key in the object }

for(let curreItem in myFavCars){
    console.log(curreItem, myFavCars[curreItem]);
}

for(let Item in myDetails){
    console.log(Item, myDetails[Item]);
}

let openingHours ={
    fri : {open:'10 AM', close: '11 PM'},      
    sat : {open:'09 AM', close: '10 PM'},
    sun : {open:'08 AM', close: '9 PM'}
};

// Looping through the openingHours object using for...in loop
for(let day in openingHours){
    console.log(day);
    console.log(openingHours[day]); // accessing value using key and returning the object
    let { open, close } = openingHours[day]; // destructuring the object to get open and close properties
    console.log(`On ${day}, we open at ${open} and close at ${close}.`);
}

// Looping through the openingHours object using for...of loop

for(let [day,{open, close}] of Object.entries(openingHours)){
    console.log(day,open, close);
    console.log(`On ${day} office starts at ${open} and ends at ${close}`);
}

// map collection
// The Map object holds key-value pairs and remembers the original insertion order of the keys.
// It can hold any data type as keys and values, including objects, functions, and primitive types.
// we use set to store value by the key and in apex we use put to store value by the key
// syntax: let myMap = new Map(); myMap.set(key, value); myMap.get(key); myMap.has(key); myMap.delete(key);
//  myMap.clear(); myMap.size;

console.log("Map Collection");
let myMap = new Map();
console.log("My map is ", myMap);

myMap.set("1", "Ankit");
myMap.set(2, 50);
myMap.set(true, "trainer");
console.log("myMap", myMap);
// to access values of map

console.log(myMap.get("1")); // Ankit
console.log(myMap.get(2)); // 50
console.log(myMap.size);// size is a property of the map object

let favPlaces = new Map([
    ["India", "Bangalore"],
    ["USA", "New York"],
    ["UK", "London"],
    ["Japan", "Tokyo"]
]);

console.log(favPlaces);

for(let currItem of favPlaces){
    console.log(currItem);
}
for( let [key, value] of favPlaces){
    console.log(key,value);
}

for(let currItem of favPlaces.values()){
    console.log(currItem);
}
for(let currItem of favPlaces.keys()){
    console.log(currItem);
}

//set collection . we use to store unique values of any type, whether primitive values or object references.
// A Set is a collection of values where each value must be unique. It can hold any
 // new set(), add(), delete(), has(), clear(), size, values(), keys(), entries().
console.log("Set Collection");
let mySet = new Set();
console.log(mySet);
mySet.add('Burger');
mySet.add('Pizza');     
mySet.add('Sandwich');
mySet.add('Ghar ka Khana');
mySet.add('Burger'); // duplicate value, will not be added
console.log(mySet); // Set(3) { 'Burger', 'Pizza', 'Sandwich' }

//check if value exists in set
mySet.has('Pizza');
console.log("mySet is", mySet.has('Pizza'));

let myfavcities = new Set(['Pune', 'Hyderabd', 'Bangalore']);
console.log(myfavCities);

for(let currItem of myfavcities){
    console.log(currItem);
}