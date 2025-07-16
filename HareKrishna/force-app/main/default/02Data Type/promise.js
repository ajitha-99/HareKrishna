console.log("Promises");

// to call a method in the background the first thing is we have to go pass the output to other method
//one call is dependent on another call
//to do that we have to use callback function
// the below situation is called callback help situation
// setTimeout(() =>{
//     console.log("Hello1");
//     setTimeout(()=>{
//         console.log("Hello2");
//         setTimeout(()=>{
//             console.log("Hello3");
//             setTimeout(()=>{
//                 console.log("Hello4");
//             },5000);
//         },5000);
//     },5000);
// },5000);

// promise is basically a promise to return something at a later time. Enter the time you wanted is returned or an error
//it returns something based on the server either a success output or error
// whenever we have to make a callout to third party systems we have to use promise in js or LWC
// all apex methods returns promise
// the promise object supports two properties:state and result
//three states: pending:undefined, fulfilled:a result value, rejected: an error object
// to create promise we have to use promise constructor 
// it always has state and result in it

// function generatePromise(message){
//     return new Promise((resolve,reject)=>{
//         if(!message){
//             reject("Message is Empty");
//         }else{
//         setTimeout(()=>{
//             console.log(message);
//             resolve(message);
//         },1000);
//     }
//     });
// }

// generatePromise()
// .then(()=>{
//     console.log("Promise resolved successfully");
// })
// .catch((error)=> {
//  console.log("Promise rejected", error);

// });



//how to call promise

// generatePromise("Ist Call")
// .then(() =>{
//     console.log("Promise resolved successfully");
//      generatePromise("Second Call");
// })
//    .then(()=>{
//         console.log("Second promise resolved successfully");
//          generatePromise("");
// })
//     .catch((error)=>{
//         console.log("Promise rejected", error);
//     });

//async function generatePromise(message){
//     return new Promise((resolve,reject)=>{ which  returns a promise.in case your promise is successfull then await block will return otherwise catch block will return
// you have to use  await inside async function
// async function generatePromise(message){
//     return new Promise((resolve,reject)=>{

// async function generateDifferentPromises() {
//     try{
//   await generatePromise("Ist Call");
//   await generatePromise("Second Call");

//     }
//     catch(error){
//   console.log(error);
//     }

// };

//generateDifferentPromises();

// promise.all gives successful message only when all files are uploaded successfully, if any single file has error it will reject


function resolveTimeout(value,delay){
    return new Promise((resolve) =>setTimeout(() => resolve(value), delay));
    
}

function rejectTimeout(reason,delay){
    return new Promise((resolve,reject) =>setTimeout(() => reject(reason), delay));
    
}

//invoke both the methods

async function load(){
    let promise1 = resolveTimeout("Welcome to Tech Journey",5000);
   // let promise2 = resolveTimeout("Welcome to Day12",4000);
   let promise2 = rejectTimeout("Loading failed",4000);

    const allPromise = Promise.race([promise1,promise2]);

    try{
        const lists = await allPromise;
        console.log("All Promises are resolved", lists);
    }
    catch(error){
        console.log("One of the promise is rejected",error);
    }
}

load();

//the difference between promise.all and promise.any() is it will return the output if any one of the promise is returned
//promise.race() returns which one is first resolved or which one is first rejected

