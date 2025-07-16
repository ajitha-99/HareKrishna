console.log("Array Method day9");

let myCars = ["BMW", "Ferari", "Audi", "Volvo"];
console.log(myCars);
console.log("typeof myCars", typeof myCars);
//datatype of array is object

console.log(myCars[2]);

// entries are present in array--length

let myFavCars =[];
console.log(myCars.length);
console.log(myFavCars.length);

// add elemnts in the array
//push method add elements in the array at end
//shift method remove the first element
//unshift and spread operator method add element at the begining
//pop method remove the last element

myCars.push("Hyundai");
console.log("myCars", myCars);

myCars.unshift("TATA");
console.log("myCars are", myCars);

myCars =[...myCars, "Honda"];
console.log("myCars after unshifting", myCars);

//remove element from the array. it will return the removed element from the end
// shift --- remove element from the begining
//pop --- remove element from the end
console.log(myCars);
let popItem = myCars.pop();
console.log("myCars after pop", popItem);  
console.log(myCars);  

let shiftItem = myCars.shift();
console.log("myCars after shift are", shiftItem);
console.log(myCars);

// modify the element from the array
//replace Ferrari with Honda

myCars[3] = "Benz";
console.log(myCars);

let myFavPeople = ["Amma", "Nanna","Anna","Anna","Chelli"];
console.log("myFavPeople", myFavPeople);

let mySet = new Set(myFavPeople);
console.log("my set is", mySet);

//search Element
//indexof
//includes -- whether the value is preent or not in the array

let myIndex = myCars.indexOf("Audi");
console.log(myIndex);
console.log(myCars.includes("Honda"));

//how to convert array into string and vice versa
//toString() --- all array entries are seperated by comma
//join method -- we can decide the seperator  

let mytoString = myCars.toString();
console.log(mytoString);

console.log(myCars.join(" "));

//slice -- copy the elements into new array
//splice -- it will remove the elements from the array and add elements in the array
//splice(param1, param2)
//param1 --- position where new element will be added
//param2 --- how many elements will be removed
//rest --> new elements to be added
//splice(2,1) -- remove 1 element from the 2nd position and add new element from the 3rd position
//add

const fruits = ["Banana", "Orange", "Apple", "Mango"];
console.log(fruits);
fruits.splice(2,0,"Lemon", "Kiwi");
console.log(fruits);

//remove 2 fruits

let removedfruits = fruits.splice(0,2);
 console.log("removedFruits", removedfruits);
 console.log("fruits", fruits);

 //slice --> extract any portion from array go for slice.
 // it will return new array .it will not modify original array

let slicedArray = fruits.slice(1,3);
console.log("Sliced Array", slicedArray);

let slicedArray1 = fruits.slice(0,2);
console.log("Sliced Array", slicedArray1);


//iteration of array

let bankingTransactions = [5000,-7000,9000,-4000,2000];
console.log('bankingTransactions',bankingTransactions);

//for each((currItem, index,originalArray))

bankingTransactions.forEach((currItem,index,array)=>{
    currItem = currItem/10;
    console.log(currItem);
    console.log(index);
    console.log(array);
});

let updatedArray = bankingTransactions.map((currItem)=>{
    return currItem/10;
});

console.log("updatedArray", updatedArray);

//get all the deposits
//filter from the main array

let depositArray = bankingTransactions.filter(currItem =>{
    if(currItem>0){
        return currItem;
    }
});
console.log(depositArray);

let withdrawlArray = bankingTransactions.filter(currItem =>{
    if(currItem<0){
        return currItem;
    }
});

console.log(withdrawlArray);

let myFruits = ["fig","Apple","Guava", "Cheery"];

console.log(myFruits);

let greaterThanThree = myFruits.filter(currItem =>{
    if(currItem.length > 3){
        return currItem;
    }
});
 console.log("greater than 3 are", greaterThanThree);

 //find method -- always return one entry

 // check if transaction array have 9000 entry

 let entry9000 = bankingTransactions.find(currItem =>{
    if(currItem == 9000){
        return currItem;
    }
});

console.log(entry9000);


























