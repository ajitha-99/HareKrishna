console.log("Functions and Expressions");
// calling function first and declaring it later is called hoisting
let calc1result = calc1(10,5);
console.log("Calc1result", calc1result);
// function declaration
function calc1(number1, number2){
    let sum = number1 + number2;
    return sum;
}

// function expression : recommended

let calc2 = function (number1, number2){
    if(number2){
    let sum = number1 + number2;
    return sum;
    }else{
      return  number1;
    }
};



let calc2result = calc2(10,5);
console.log("calc2result", calc2result);

let calc3result = calc2(10);
console.log("calc3result", calc3result);



//difference between declaration and expression

//calling function before declaration in declaration

//calling function before declaration is not possible in expression
// we need to assign the function to a variable

// Arrow function
//modern way of writing down the function expression. the way it works are same
//rules: if function has only one statement you don't need to manually return statement we can remove the brackets and no need to write the brackets

let calc3 = (number1,number2) =>{

    if(number2){
    let sum = number1 + number2;
    return sum;
    }else{
      return  number1;
    }
};

let calc4result = calc3(10,15);
console.log("calc4result", calc4result);

// function expression
let greet =function(username){
    return `${username}, welcome to learn js`;
};

console.log(greet("Ankit"));


//when  you do have single statement you don't need to write the brackets and return statement

let greetArrowfunction = (username) => 
     `${username}, welcome`;


console.log(greetArrowfunction("Ammu"));

//without parameter

let welcomeMessage = () => 'Welecome to learn Js';
console.log(welcomeMessage());

// callback functions
//those are passed as an argument to another function
//callbacks really shine are in asynchronous functions, where one function has to wait for another function.

function welcomeMe(name,callMe){
    console.log(`Hello ${name}`);
    callMe();
}
 function greetMetoo(){
    console.log(`Welcome to tech journey`);

 }
function goodBye(){
    console.log(`See you in future sessions`);

}

welcomeMe("Anna", goodBye);

setTimeout(()=>{}, 1000);
