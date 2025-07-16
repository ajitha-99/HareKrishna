// To create rollup summary for no.of usa contacts
trigger contactTrigger on Contact (after insert,after update,after delete,after undelete) {
   
    //trigger.new --> List<contact>---- insert,update,undelete
    //trigger.old ---> list<contact> ---- delete,update
    
    contactTriggerHandler.rollup_v3();
   // contactTriggerHandler.rollup_v2();
    
}