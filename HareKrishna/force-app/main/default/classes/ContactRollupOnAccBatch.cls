public class ContactRollupOnAccBatch implements database.Batchable<Sobject> {
    //iterable max.50k records are supported
    //database query locator max.50million records are supported
    
    
    public database.querylocator  start(database.Batchablecontext bc){
        String query = 'SELECT Id, Number_Of_USA_Contacts__c FROM Account';
        return Database.getQueryLocator(query);
    }
	
    public void execute(database.Batchablecontext bc, list<Sobject> Sobjects){
        Set<Id> accIds = new Set<Id>();
        for(Sobject sobj : sobjects) {
            accIds.add(sobj.Id);
        }
        ContactTriggerHandler.rollupLogic(accIds);  
    }
    
    public  void finish(database.Batchablecontext bc){
        // To get the current completed job information
        AsyncApexJob asyncJob = [SELECT Id, JobItemsProcessed, NumberOfErrors, Status, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: bc.getJobId()];

        // Send Email 
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new List<String>{asyncJob.CreatedBy.Email});
        mail.setSubject('ContactRollupOnAccBatch Status: ' + asyncJob.Status);
        mail.setPlainTextBody('TotalJobItems: ' + asyncJob.TotalJobItems + '. NumberOfErrors: ' + asyncJob.NumberOfErrors);

        // Triggering the email
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail});

        // To schedule seconds/minutes/hours basis
        // Datetime sysTime = System.now();
        // sysTime = sysTime.addminutes(5);
        // String chron_exp = '' + sysTime.second() + ' ' + sysTime.minute() + ' ' +
        // sysTime.hour() + ' ' + sysTime.day() + ' ' + sysTime.month() + ' ? ' + sysTime.year();   
        // System.schedule('ContactRollupOnAccBatch' + System.now(), chron_exp, new ContactRollupOnAccBatch());
    }

    // Methods for the schedulable interface
    public void execute(SchedulableContext sc) {
        ContactRollupOnAccBatch conRollup = new ContactRollupOnAccBatch();
        Database.executeBatch(conRollup); // Default Batch Size: 200

        //Database.executeBatch(conRollup, 2000); // Max. Batch Size: 2000
    }
    }