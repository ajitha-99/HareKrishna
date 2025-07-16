// if the owner of the account is changed then it's related contact owner should be updated
trigger contactUpdateTrigger on Account(after update){
    if(trigger.isupdate && trigger.isafter){
        List<id> accountids = new list<id>();
        for(account acc:trigger.new){
            if(acc.id != trigger.oldmap.get(acc.id).Ownerid){
                accountids.add(acc.id);
            }
        }
      // updating contacts with new owner and checking if one account owner is updated
        if(accountids.size() !=0){
            List<contact> contacts = [select Id,OwnerId,AccountId from Contact where accountid in:accountids];
            for(contact con:contacts){
                con.ownerid = trigger.newmap.get(con.accountid).ownerid;
                
            }
            
            Update contacts;
            
        }
      
    }
}