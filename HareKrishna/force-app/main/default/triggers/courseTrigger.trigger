//when the course is deleted automatically all related course applications should be deleted
//when the course is undeleted automatically all related course applications should be undeleted
//before delete,after undelete

trigger courseTrigger on Course__c (before delete, after undelete) {
	
   //trigger.old ---> List<course__c>
    if(trigger.isDelete){
    List<Course_Application__c> courseapp4del =[select Id from Course_Application__c
                                               where Course__c in : trigger.oldmap.keyset()];
    if(courseapp4del != null && courseapp4del.size()>0){
        delete courseapp4del;
    }
}
    else if (trigger.isundelete){
        
      List<Course_Application__c> courseapp4undel =[select Id from Course_Application__c
                  where Course__c in : trigger.new and isDeleted = true  All Rows];
    if(courseapp4undel != null && courseapp4undel.size()>0){
        undelete courseapp4undel;
    }  
        
    }
    
    
    
    
}