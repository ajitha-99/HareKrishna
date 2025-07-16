public class ContactTriggerHandler {
  /*  public static void rollup_v1(){
       set<Id> accId = getAccids(); 
       
    if (accId.size()>0){
        List<contact> Contacts  = [select Id,AccountId from contact where AccountId in:accId
                                 and Mailingcountry='USA'];
             Map <Id,Integer> accidConMap = new Map <Id,Integer>();
        for(contact con : Contacts){
            if(accidConMap.containskey(con.AccountId)){
             integer count= accidConMap.get(con.AccountId) +1;
            accidConMap.put(con.AccountId,count);
        }
        else {
            accidConMap.put(con.AccountId,1);
        }
        } 
        List <Account> Accounts = new List<Account>();
            for(Id accIds : accId){
           Account acc = new Account(Id=accIds,Number_of_USA_Contacts__c=accidConMap.get(accIds)) ;
             Accounts.add(acc);
            }
         if (accounts.size()>0)
        update accounts;
    }
       }
    
  // Approach 2 : using subquery to achieve
  
   // public static void rollup_v2(){
        
     //  set<Id> accId = getAccids(); 
        
    //List<Account> accounts = [select Id,Number_of_USA_Contacts__c,(select Id from contacts where MailingCountry='USA')
       //                      from Account where Id in : accId];
      //  if(accounts!=null && accounts.size()>0){
         //   for (Account acc : accounts){
           //     acc.Number_of_USA_Contacts__c = acc.Contacts.size();
 
          // }
           // update accounts;
            
            
      //  }
                          
        
  //  }
    
  // Method to return accids to update account records
  
    public static set<id> getAccids(){
        List<contact> triggerNew = (List<contact>) trigger.new;
        List<contact> triggerOld = (List<contact>) trigger.old;
        
        set<Id> accId = new set<Id>();
        for(contact con : trigger.isDelete? triggerOld : triggerNew){
            if(con.AccountId != null)
                accId.add(con.AccountId);
        
          // To fix the issue, when the contact AccountId field is udpated
           // if(trigger.isUpdate && con.AccountId != triggerOldMap.get(con.Id).AccountId) {
            //    accIds.add(triggerOldMap.get(con.Id).AccountId);
           // }
         }
        return getAccids();
    }*/
 // Using aggregate query
    public static void rollup_v3() {
        Set<Id> accIds = getAccIds();
        rollupLogic(accIds);
    }
      // Reusable logic for both trigger and batch apex class 
    public static void rollupLogic(Set<Id> accIds) {
        List<AggregateResult> aggResult = [SELECT count(Id), AccountId FROM Contact WHERE AccountId in: accIds AND MailingCountry = 'USA' GROUP BY AccountId];

        List<Account> accounts = new List<Account>();

        if(aggResult != null && aggResult.size() > 0) {
            for(AggregateResult aggr : aggResult) {
                Id accId = (Id)aggr.get('AccountId');
                Account acc = new Account(
                    Id =  accId,
                    Number_of_USA_Contacts__c = (Integer)aggr.get('expr0')
                );
                accounts.add(acc);
                accIds.remove(accId);
            }
        }
        // To fix if the last USA contact is deleted or updated to the other country
        if(accIds.size() > 0) {
            for(Id accId : accIds) {
                Account acc = new Account(
                    Id =  accId,
                    Number_of_USA_Contacts__c = 0
                );
                accounts.add(acc);
            }
        }
        if(accounts.size() > 0) {
            update accounts;
        }
    }

    // Method to return the account ids to update account records
    public static Set<Id> getAccIds() {
         // trigger.new --> List<Sobject>
         List<Contact> triggerNew = (List<Contact>)trigger.new;
         List<Contact> triggerOld = (List<Contact>)trigger.old;
         Map<Id,Contact> triggerOldMap = (Map<Id,Contact>)trigger.oldMap;
 
         // Accounts to update with rollup
         Set<Id> accIds = new Set<Id>();
 
         for(Contact con : trigger.isDelete ? triggerOld : triggerNew) {
            if(con.AccountId != null)
                accIds.add(con.AccountId);

            // To fix the issue, when the contact AccountId field is udpated
            if(trigger.isUpdate && con.AccountId != triggerOldMap.get(con.Id).AccountId) {
                accIds.add(triggerOldMap.get(con.Id).AccountId);
            }
         }
         return accIds;
    }

}