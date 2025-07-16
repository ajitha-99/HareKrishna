import { LightningElement } from 'lwc';

export default class InputEcho extends LightningElement {
    userInput = '';

    handleInputChange(event) {
        this.userInput = event.target.value;
    }
}