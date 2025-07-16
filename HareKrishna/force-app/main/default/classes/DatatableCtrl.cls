public class DatatableCtrl {
	@AuraEnabled
    public static List<Opportunity> getOpps(String accId){
        return [select Id, Name,CloseDate,StageName,Amount From Opportunity where AccountId =: accId];
    }
}