// Contacts should be after the account is created so we are using after insert
trigger AccountContactTrigger on Account (after insert) {
    // Declaring the context variables;
    // Code should run only after insert;
    if(trigger.isafter && trigger.isinsert){
        //creating list of contacts
        List<Contact> contacts = new list<Contact>();
    //iterating accounts
    
    for(Account acc: Trigger.new){
        //  add contacts which needs to be added in the list of contacts
        contact newContact = new Contact(LastName=acc.Name+' Con', AccountId=acc.Id);
        contacts.add(newContact);
    }
    
    insert contacts;
    } 

}