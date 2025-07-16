import { LightningElement, track } from 'lwc';

export default class CoditionalRenderingLwc extends LightningElement {
    @track displayDiv = false;
    @track cityList = ['Jaipur', 'Hyderabad', 'Bangalore', 'Mumbai'];
    showDivHandler(event) {
        this.displayDiv = event.target.checked;
    }
}