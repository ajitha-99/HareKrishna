/*Dont allow deleting the closed cases.Cases
which object ? case
which dml ?delete
before or after ? before delete
*/
trigger CaseTrigger on Case (before delete) {
    
 //trigger.old ---> list<case> on which object we create trigger it will in that format
      
    for(case cs :trigger.old){
        //if(cs.Status == 'Closed')we cannot add or change everytime when we add a pickvalue
         	if(cs.isClosed){
         cs.Status.addError(Label.Case_closed_err_msg);
        
        
        }
    }

}