import { LightningElement, api } from 'lwc';
import confirmCases from '@salesforce/apex/caseController.confirmCases';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ConfirmCase extends LightningElement {
    @api recordId;

    connectedCallback() {
        console.log('recordId received in component:', this.recordId);
    }

    handleConfirm() {
        if (!this.recordId) {
            console.error('recordId is undefined or null');
            this.showToast('Error', 'Unable to identify case record. Please refresh and try again.', 'error');
            return;
        }

        console.log('Sending recordId to Apex:', this.recordId);
        confirmCases({ caseIds: [this.recordId] })
            .then(() => {
                console.log('Apex call successful');
                this.showToast('Success', 'Your case has been updated successfully.', 'success');
            })
            .catch(error => {
                console.error('Error from Apex:', error);
                this.showToast('Error', error.body.message, 'error');
            });
    }

    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant,
            })
        );
    }
}