import { LightningElement, track } from 'lwc';
import getPaginatedContacts from '@salesforce/apex/ContactPaginationController.getPaginatedContacts';
export default class InfiniteScrollPagination extends LightningElement {
 @track contacts = [];
  @track pageSize = 10;
  @track pageNumber = 1;
  @track isLoading = false;
  @track isLastPage = false;

  connectedCallback() {
    this.loadContacts();
  }

  loadContacts() {
    if (this.isLoading || this.isLastPage) return;
    this.isLoading = true;

    getPaginatedContacts({ pageSize: this.pageSize, pageNumber: this.pageNumber })
      .then(result => {
        if (result.length < this.pageSize) {
          this.isLastPage = true;
        }
        this.contacts = [...this.contacts, ...result];
        this.pageNumber++;
        this.isLoading = false;
      })
      .catch(error => {
        console.error('Error loading contacts:', error);
        this.isLoading = false;
      });
  }

  handleScroll(event) {
    const scrollBottom = event.target.scrollTop + event.target.clientHeight;
    if (scrollBottom >= event.target.scrollHeight - 5) {
      this.loadContacts();
    }
  }
}