console.log("Events");

//1.Event name should always be in small case
//2.you have to write ON as prefix before event name like click we have to write onclick
// when we use html element in the javascript we have to use document.queryselector(""). 
function clickme(){
    alert("Welcome Me");
    console.log("click me");
}
 function mouseoverhandler(){
console.log("Mouse over event executed");
let element = document.querySelector(".hover");
element.style.display ="none";
 }

 function mouseouthandler(){
     console.log("Mouse out event executed");
     let element = document.querySelector(".hover");
     element.style.display ="";
 }
// event is used to access the value that is entered
//to access that value event.target.value
//3.To get the element we use querySelector or querySelectorAll
 function changeHandler(event){
    console.log(event.target.value);
    console.log(event.target.name);

 }

 //addEventListener is an inbuilt function in javascript which takes the event to listen for, and a second argument to be called whenever the described event gets fired.
 // element .addEventListener(event, listener);we don't use ON prefix in the js file . elememt is our html element
 // removeEventListener is an inbuilt function that is used to remove an event handler that was previously added using the addEventLsitener()function from the element.

 //Custom Events---our own event
 //A custom event can be created using the customevent constructor.
 //this takes two arguments,the first is the name of the event and the second is an object that contains the data.
 // after creating the events, you need to be able to dispatch them.
 // to listen for the custom event, add an event listener to the element you want to listen on.
 //Example: const myEvent = new CustomEvent("myevent", {detail: {"my data"},bubbles:true,cancelable:true,composed:false});
 //document.querySelector("element").dispatchEvent(myEvent);
 //1.create event
 //2.dispatch to the event
 //3.listen to the event

//3. handle the event
document.addEventListener("valueten", (event)=>{
    console.log("Access Event Data", event.detail.message);

});

 function changeHandler(event){
    console.log(event.target.value);
 let value = event.target.value;

 // whenever user enter value as 10 then we have to fire custom event
 //1. create custom event

 if(value == 10){
    //create custom event
    const myevent = new CustomEvent("valueten",{
        detail: {
            message: "user have entered value 10",
        },
    });

    // dispatch the event

    document.dispatchEvent(myevent);

}
}

// when ever a specific logic is executed after specific set of time
//setTimeout(function, time);executes a function or logic only once, after waiting a specified number of milliseconds
//to stop the execution of the function specified in setTimeout, we can use clearTimeout(timeoutVariable)
//setInterval - same as settimeout(), but repeats the executin of the function continuously
//setInterval(function,milliseconds);
// to stop the executions of the function specified in the setInterval()method.
//clearInterval(timerVariable)

//setTimeout(()=>{
 //   console.log("Timeout done for 5000ms:");
//},5000);

let intervalDetails = "";
intervalDetails = setInterval(() =>{
    console.log("Time Interval done")
},5000);

setTimeout(()=>{
       clearInterval(intervalDetails);
       console.log("Interval Processing Stopped");
},15000);

//import





