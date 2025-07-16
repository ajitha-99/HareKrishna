import { LightningElement, track } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunityKanbanController.getOpportunities';
import updateOpportunityStage from '@salesforce/apex/OpportunityKanbanController.updateOpportunityStage';

export default class OpportunityKanbanView extends LightningElement {
    @track groupedOpportunitiesList = [];
  columns = ['Prospecting', 'Qualification', 'Proposal', 'Negotiation'];
  draggedId;

  connectedCallback() {
    this.loadOpportunities();
  }

  loadOpportunities() {
    getOpportunities().then(data => {
      const grouped = this.columns.map(stage => ({
        stage,
        records: data.filter(o => o.StageName === stage)
      }));
      this.groupedOpportunitiesList = grouped;
    });
  }

  handleDragStart(event) {
    this.draggedId = event.target.dataset.id;
  }

  allowDrop(event) {
    event.preventDefault();
  }

  handleDrop(event) {
    const newStage = event.currentTarget.dataset.stage;
    updateOpportunityStage({ oppId: this.draggedId, stage: newStage })
      .then(() => this.loadOpportunities());
  }
}