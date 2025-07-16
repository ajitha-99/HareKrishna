import { LightningElement, api, wire, track } from 'lwc';
import getCars from '@salesforce/apex/CarSearchResultController.getCars';
import cars from '@salesforce/resourceUrl/cars';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CarSearchResult extends LightningElement {

    @api carTypeId;
    @api selectedCarId;

    @track
    _cars;
    get cars() {
        console.log(cars);
        return this._cars;

    }

    set cars(value) {
        this._cars = value;
        console.log(value);
    }

    @wire(getCars, { carTypeId: '$carTypeId' })

    wiredCars({ data, error }) {
        if (data) {
            this.cars = data;
            console.log(cars);
        } else if (error) {
            this.showToast('ERROR', error.body.message, 'error');
        }

    }

    showToast(title, message, variant) {
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });

        this.dispatchEvent(evt);
    }

    carSelectHandler(event) {
        const carId = event.detail;
        this.selectedCarId = carId;

    }

    get carsFound() {
        if (this.cars) {
            return true;
        }
        return false;
    }
}