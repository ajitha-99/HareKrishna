console.log("Fetch APIS");

// fetch api will assume default as GET method
// FETCH API always returns in the form of promise. whenever we make a callout in javascript
// whenever we get response from the api it should always in the readable form for that we have to make another call.To do that call we use .josn() method for that pupose.
//json is javascriptobjectnotation
//the methods available are get,put,patch,

//random users api : https://reqres.in/api/users

function loadRandomUsers(){
    fetch('https://reqres.in/api/users',{
        method: "GET"
    }).then((response) => response.json())
    .then((data) => console.log(data));
}

loadRandomUsers();

async function loadRandomUsers1(){
    let response = await fetch('https://reqres.in/api/users',{
        method: "GET"
    });
}

async function loadRandomCat(){
    let response = await fetch("https://api.thecatapi.com/v1/images/search");
    let data = await response.json();
  // console.log(`The cat is ${data[0].url}`);
    console.log("data",data);
    const imageUrl = data[0].url;
    console.log("imageurl", imageUrl);
  let element = document.querySelector(".catimage");
  element.src = imageUrl;
}

loadRandomCat();

async function loadExchangeRate(){
    let response = await fetch("https://rest.coinapi.io/v1/exchangerate/BTC/USD",{
        method: "GET"
    });

    let data = await response.json();
    console.log("data", data);
  
}
loadExchangeRate();