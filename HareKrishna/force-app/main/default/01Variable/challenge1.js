
const game = {
    team1: "India",
    team2: "Australia",
    players: [
        ["Dhoni", "Kohli", "Virat", "susi", "mangli", "bumrah"], // team1 players
        ["Dhoni1", "Kohli1", "Virat1", "susi1", "mangli1", "bumrah1"] // team2 players
    ],
    Century: ["Kohli", "Dhoni1", "mangli", "susi1"],
    odds: {
        team1: 1.33,
        x: 3.25,
        team2: 6.5
    }
};

//3. create one player array for each team(variables 'player1' and 'palyer2')

let [player1, player2] = game.players;

console.log(player1, player2);

//4. create 1st player in as wicketkeeper and other as field players
// rest operator concept 
let[captain,...fieldPlayers] = player1;
console.log(captain,fieldPlayers);

//create an array 'allplayers' containing all players of both teams

let allPlayers = [...player1,...player2];
console.log(allPlayers);

//5. create a new array as team india substitute three players
// use of spread operator
let player1Final = [...player1,"Sandeep","john","sunil"];
console.log(player1Final);

// based on the game.odds object, create one variable for each odd(called'team1','draw'and 'team2')
let team = game.odds.team1;
console.log(team);

let draw1 = game.odds.x;
console.log(draw1);

let team3 = game.odds.team2;
console.log(team3);

//destructuring
//when destructuring we have to give same namae as property name
//use of alias name
let {team1,x:draw,team2} = game.odds;
console.log(team1,draw,team2);

//6.the team with the lower odd is more likely to win.
//print to the console which team is more likely to win.
//without using if/else statement or ternary operator


team1<team2 && console.log("Team 1 will win");
team2<team1 && console.log("Team 2 will win");

//7.loop over the game.century array and print each player name to the console, along with the century number(example: "Century 1: Kohli")


for(let [index,value] of game.Century.entries()){
    console.log(`Century ${index+1}: ${value} `);
}

//8.avg value of odd
// to itereate an object values we have to use object.values

let sum =0;
let counter =0;

for(let currItem of Object.values(game.odds)){
    console.log(currItem);
    sum = sum+currItem;
    counter = counter+1;

    
}
  console.log(sum);
  console.log("counter",counter);
  console.log("Average", Math.round(sum/counter));
// using in inthe for loop
// we use an array to store the values of the obejct in for loop

let sum1 =0;
let counter1=0;
  for(let currItem in game.odds){
    console.log(game.odds[currItem]);
    sum1 = sum1+game.odds[currItem];
     counter1 = counter1+1;

  }
 console.log(sum1);
 console.log(counter1);
 console.log("Average", Math.round(sum1/counter1));






