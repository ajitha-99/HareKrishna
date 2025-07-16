//trigger oppTrigger on SOBJECT (before insert) {
    trigger oppTrigger on Opportunity (after insert, after update) {

        Set<Id> accountIdSet = new Set<Id>();
        for(Opportunity opp:trigger.new) {
            if((Trigger.isInsert && opp.Amount != null) || (Trigger.isUpdate && opp.Amount != Trigger.oldMap.get(opp.Id).Amount)) {
            accountIdSet.add(opp.AccountId);
            }
        }
        
        List<AggregateResult> aggrResults = [SELECT AccountID accId, SUM(Amount) opptySum FROM Opportunity WHERE AccountId IN:accountIdSet 
                                              group BY AccountId];
        List<Account> accountList = new List<Account>();
        for(AggregateResult agr :aggrResults) {
        accountList.add(new Account (Id = (Id)agr.get('accId'), Total_Amount__c = (Decimal)agr.get('opptySum')));
        }
        
        if(accountList.size()>0) {
        upsert accountList;
        }
        }