import { LightningElement, track } from 'lwc';

export default class SimpleCalculatorLwc extends LightningElement {
    @track currentResult;

    @track firstNumber;
    @track secondNumber;

    numberChangeHandler(event) {
        const inputBoxName = event.target.name;
        if (inputBoxName === 'firstNumber') {
            this.firstNumber = event.target.value;
        } else if (inputBoxName === 'secondNumber') {
            this.secondNumber = event.target.value;
        }
    }

    addHandler() {
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);
        console.log(this.firstNumber);
        console.log(this.secondNumber);
        // this.currentResult = 'Result of ' + firstN + ' + ' + secondN + 'is' + (firstN + secondN);
        //  (use either above or below code)
        this.currentResult = `Result of ${firstN}+${secondN} is ${firstN+secondN}`;

    }

    subHandler() {
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);
        // this.currentResult = 'Result of ' - firstN - ' + ' - secondN - ' is' + (firstN - secondN);
        //  (use either above or below code)
        this.currentResult = `Result of ${firstN}-${secondN} is ${firstN-secondN}`;
    }
    multiplyHandler() {
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);
        // this.currentResult = 'Result of ' * firstN * ' + ' * secondN * 'is' + (firstN * secondN);
        //  (use either above or below code)
        this.currentResult = `Result of ${firstN}x${secondN} is ${firstN*secondN}`;
    }
    divisionHandler() {
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);
        // this.currentResult = 'Result of ' / firstN / '+' / secondN / 'is' + (firstN / secondN);
        //  (use either above or below code)
        this.currentResult = `Result of ${firstN}/${secondN} is ${firstN/secondN}`;
    }
}