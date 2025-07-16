public class userTriggerHandler {
	@future
    
    public static void updapplicants(Map<Id,Id>inActiveusrIdsmngrmap){
         system.debug('inActiveusrIdsmngrmap:' + inActiveusrIdsmngrmap);
         system.debug('inActiveusrIdsmngrmap keyset:' + inActiveusrIdsmngrmap.keyset());
             
        List<Applicant__c> applicants = [select Id,OwnerId from Applicant__c where OwnerId in:inActiveusrIdsmngrmap.keyset()];
       
            if(applicants != null && applicants.size()>0){
                for(Applicant__c applicant : applicants){
  system.debug('inActiveusrIdsmngrmap keyset:' + inActiveusrIdsmngrmap.get(applicant.OwnerId));
                     applicant.OwnerId=inActiveusrIdsmngrmap.get(applicant.OwnerId);
       
                
            }
              update applicants;  
            }  
        
        
        
        
    }
    
    
    
}