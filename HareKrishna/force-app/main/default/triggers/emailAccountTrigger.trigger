trigger emailAccountTrigger on Account (before delete) {
if(trigger.isbefore && Trigger.isdelete){
    set<id> accIds = new set<id>();
    for (account acc : Trigger.old){
        accIds.add(acc.Id); 

}

 Map<Id,Account> accMap = new Map<Id,Account>([select id,Name,Email__c from Account where id in:accIds]);

 for(account accs :Trigger.old){
     if(accs != null){
         account acccs= accmap.get(accs.Id);
         string accEmail = acccs.Email__c;

         Messaging.singleEmailMessage mail = new Messaging.singleEmailMessage();
         //Messaging.massEmailMessage mail = new Messaging.massEmailMessage();
         string[]ToAddresses = new string[]{'ajithag9999@gmail.com'};
         string[]CcAddresses = new string[]{'gdhana99@gmail.com'};

         mail.setToAddresses(ToAddresses);
         mail.setCcAddresses(CcAddresses);
         mail.setPlainTextBody('your account:' + acccs.AccountNumber + 'is going to be deleted.');
         Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        // Messaging.sendEmail(new Messaging.massEmailMessage[]{mail});
     } 
     //Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
 }
}



}