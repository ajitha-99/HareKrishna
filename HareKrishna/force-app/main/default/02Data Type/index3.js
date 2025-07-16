console.log("Logical Operators");
let myNumber = 10;
let myNumber1 = "20";

console.log(myNumber + myNumber1); // Addition);
// if you define any varibale and not assign any value to it , the result will be undefined an typeof the variable is undefined
//Javascript will take the + as a concatenation operator when it is a stirng and another is a number
// we use number() to convert a string to a number
console.log(myNumber + Number(myNumber1)); // Addition with type conversion

if(isNaN(myNumber1)){
    console.log("myNumber1 is not a number");
}
else{
console.log(myNumber + Number(myNumber1));
}

let myNumber3 ="30";
let myNumber4 = 10;
console.log(typeof myNumber3, typeof myNumber4); 
console.log(myNumber3 - myNumber4); 
//Subtraction will convert the string to a number and then perform the operation the same is true for multiplication and division.
//for addition it will concatenate the string and number and we have to use number() to convert the string to a number.

console.log(myNumber3 * myNumber4); // Multiplication
console.log(myNumber3 / myNumber4); // Division 

//Assignment Operators "=" "==  "===" "!=" "!==" "<" "<=" ">" ">="
// "==" is used to compare the value and type of the variable
// "===" is used to compare the value and type of the variable
let myNumber5 = 10;
myNumber = 60;//Assignement

//Comparision Operators, >, <, >=, <=, ==, ===, !=, !==

let myNumber6 = 10;
let myNumber7 = 20;

console.log(myNumber6 > myNumber7);
console.log(myNumber6 < myNumber7);
console.log(myNumber6 >= myNumber7);
console.log(myNumber6 <= myNumber7);

//Logical Operators, &&, ||, !

console.log(true && false);
console.log(true || false);
console.log(!true);
console.log(true && true);
console.log(false || false);
console.log(myNumber6>0 && myNumber7>0);
//Logical AND (&&) returns true if both operands are true, otherwise it returns the first falsy value it encounters.
let myString12="";  
let myString13="JIRA";
console.log(myString12 && myString13);
console.log(myString12 || myString13);

//Ternary Operator- checking a condition and returning a value based on the condition.
let myNumber8 = 10;
let myNumber9 = 20;

let result = (myNumber8 > myNumber9) ? "myNumber8 is greater than myNumber9" : "myNumber8 is less than or equal to myNumber9";
console.log(result);

let myString1 = "Hello";
let myString2 = "World";

console.log(myString1 && myString2);
console.log(myString1 || myString2);

//!operator is used to toggle(switch) the boolean value

let isSalaryCredited = false;
console.log("isSalaryCredited", isSalaryCredited);
isSalaryCredited = !isSalaryCredited; // toggles the value of isSalaryCredited from false to true
console.log("isSalaryCredited", isSalaryCredited); // true


//== checks the value only
//=== checks the value and type it will return false if the type is different and true if the type is same

let myNumber10 = 10;
let myNumber11 = 10;
console.log(typeof myNumber10, typeof myNumber11);
console.log(myNumber10, myNumber11);
console.log(myNumber10 == myNumber11); // true
console.log(myNumber10 === myNumber11);//true

console.log('ankit' == "Ankit");//false
// Java script is case sensitive so 'ankit' and 'Ankit' are not same
console.log('ankit' === "Ankit");//false    

//null and undefined . both are used to make the value empty
let myVariable = null; // null is used to make the variable empty
let myString11;
console.log(typeof myVariable);
console.log(typeof myVariable, typeof myString11)
console.log(myVariable == myString11);
console.log(myVariable === myString11);







