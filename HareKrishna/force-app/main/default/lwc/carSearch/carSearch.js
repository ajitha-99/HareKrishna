import { LightningElement, track } from 'lwc';

export default class CarSearch extends LightningElement {
    @track carTypeId;

    cartypeselectionhandler(event) {
        this.carTypeId = event.detail;

    }
}