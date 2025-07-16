import { LightningElement, track } from 'lwc';
import createCase from '@salesforce/apex/CaseWizardController.createCase';  
export default class CaseWizard extends LightningElement {
  @track subject;
  @track description;
  @track status;

  handleSubjectChange(event) {
    this.subject =(event.target.value);
  }

  handleDescriptionChange(event){
    this.description = (event.target.value);
  }

  handleStatusChange(event){
    this.Status = (event.target.value);
  }
    submitCase(){
      if (!this.subject && !this.description && !this.status) {
    alert('Please fill in at least one field before submitting the case.');
    return;
  }
        createCase({
            subject : this.subject,
            description :this.description,
            status : this.status,
            customerName :'Dummy Name'
        }).then(result=>{
            alert('case created with id: ' + result);
        }).catch(error=>{
            console.error(error)
        });
    }
}