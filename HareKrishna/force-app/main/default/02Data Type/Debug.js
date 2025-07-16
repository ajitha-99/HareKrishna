console.log("Debugging");

function calculateSum(arr){
    debugger;
    let sum =0;
    for(let i=0; i<arr.length; i++){
        sum += arr[i];
    }
    return sum;
    
}

const numbers =[1,2,3,4,5];
const total = calculateSum(numbers);
console.log(total);

function calculateAverage(param){
    let average = 0;
    for(let i=0; i<param.length; i++){
        average += param[i];
    }
    return average/param.length;
    }

    const number1 = [2,3,5,6,7];
    const total1 = calculateAverage(number1);
    console.log(total1);

    