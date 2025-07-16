import { LightningElement, track } from 'lwc';
import getDuplicateContacts from '@salesforce/apex/ContactController.getContacts';
import mergeContacts from '@salesforce/apex/ContactMergeController.mergeContacts';

export default class ContactMerge extends LightningElement {
  @track duplicates = [];
  @track selectedIds = [];

  columns = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName' },
    { label: 'Email', fieldName: 'Email' }
  ];

  connectedCallback() {
    getDuplicateContacts()
      .then(result => {
        this.duplicates = result;
      })
      .catch(error => {
        console.error('Error loading contacts:', error);
      });
  }

  handleRowSelection(event) {
    this.selectedIds = event.detail.selectedRows.map(row => row.Id);
  }

  mergeSelected() {
    if (this.selectedIds.length < 2) {
      alert('Select at least two contacts.');
      return;
    }

    let master = this.selectedIds[0];
    mergeContacts({ masterId: master, duplicateIds: this.selectedIds })
      .then(() => {
        alert('Contacts merged successfully');
        this.selectedIds = [];
        return getDuplicateContacts();
      })
      .then(result => {
        this.duplicates = result;
      })
      .catch(error => {
        console.error('Merge error:', error);
      });
  }
}