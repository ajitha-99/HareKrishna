public with sharing class OpportunityKanbanController {
    
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities(){
        return [Select Id, Name,StageName,CloseDate From Opportunity where IsClosed = false];
    }


  @AuraEnabled

public static void updateOpportunityStage(Id oppId, String stage){
    Opportunity opp = [select Id, StageName from Opportunity where Id =: oppId];
    opp.StageName = stage;
    update opp;

}
}