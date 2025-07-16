// on account creation automatically create a child account
// maximum trigger depth exceeded --- it is called recursive trigger to avoid that we have to create another
// class and call it in the trigger
trigger AccountTrigger on Account (after insert) {
    if(!AccountTriggerHandler.isRecursive ){
        AccountTriggerHandler.isRecursive  = true;
    List<Account> childAccs = new List<Account>();
    
    for(account acc : trigger.new){
        
        Account childacc = new account(
        	Name     = acc.Name + '-Default',
        	ParentId = acc.Id);
                                       
    childAccs.add(childacc);  
    }
    insert childAccs;
    }
}