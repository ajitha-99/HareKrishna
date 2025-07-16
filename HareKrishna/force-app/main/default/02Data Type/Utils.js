// export and import 
//the export and import are the keywords used for exporting and importing one or more members in a module
//export before declaration
//export default
//export
//import needs curly braces for name dexports and doesn't need them for the default one.
//we can put alias name while putting the import

//export during declaration

export let weekdays = ["Mon","Tue","Wed", "Thu", "Fri"];

export const DATE_OF_BIRTH_YEAR = 1947;

export function sayHi(message){
    alert(message);
}

//Export after declaration

function doAdd(number1,number2){
    alert(number1 + number2);
}
//default
export default function doMul(number1, number2){
    alert(number1*number2);
}

export { doAdd };