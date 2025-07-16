console.log("Variable Declaration");
let myName = "Azitha";
console.log(myName);
myName = "Azitha S";
console.log(myName);

//as soon as we redeclare the variable we will get an error
// myName = 10; // This will throw an error because we are trying to assign a number to a string variable
// const keyword is used to declare a constant variable and caanot be reassigned or redeclared.
const myAge = 25;
console.log("My Age is", myAge);


const myLastName = "Garlapati";
console.log("My LastName is", myLastName);
// we cannot assign a new value to a constant variable
// define object using const keyword
const myObject ={
    fname: "Azitha",
    lname: "Garlapati",
    age: 25
};
//when we reassign the whole object we will get an error, but when we modify the property of an object we will not get an error.
console.log("My Object is", myObject);
myObject.fname = "Azitha S";
console.log("My Object after modification is", myObject);

// var keyword can be reassigned and redeclared and is a bad practice to use
var bootcamp = "Salesforce";
console.log("Bootcamp is", bootcamp);
var bootcamp="LWC Developer";
console.log(bootcamp);
console.log(window.bootcamp);