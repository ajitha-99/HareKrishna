import { LightningElement, track} from 'lwc';

export default class MyFirstWebComponent extends LightningElement {
    @track

    contacts = [
        {
            ID: 1,
            Name: 'Suni',
            Title:'VP of Marketing'},

            {
            ID: 2,
            Name: 'Bill',
            Title:'VP of Sales'},
            
                {
            ID: 3,
            Name: 'Mark',
            Title:'CEO'},
    ];
}