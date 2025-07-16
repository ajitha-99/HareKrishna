public with sharing class AccountsExtensionCtrl {

    Id accId;
    List<ContactWrapper> conWrapLst;

    // variables which can be referred from the visualforce page
    public string subject {get;set;}
    public string emailBody {get;set;}

    public AccountsExtensionCtrl(ApexPages.StandardController controller) {

        accId = controller.getId();
    }

    Public  List<ContactWrapper> getContacts() { 
     conWrapLst = new List<ContactWrapper>();
    for (contact con:[select Id,FirstName,LastName,Email,MobilePhone from Contact
                         where AccountId =: accId]){

        ContactWrapper conwrap = new ContactWrapper();
        conwrap.isChecked = false;
        conwrap.con = con;
        conWrapLst.add(conwrap);
    }
        return conWrapLst;

    }

 // update and save the fields class
 
 public void saveCons() {

    List<contact> contacts = new List<contact>();

     for(ContactWrapper conwrap : conWrapLst){
         if(conwrap.isChecked){
             contacts.add(conwrap.con);
         }
     }
     if (contacts.size()>0) {
         update contacts;
     }

 }

 // to send email to the selected contacts
public void sendEmail(){
    if(string.isBlank(subject) || string.isBlank(emailBody)){
       ApexPages.Message message = new ApexPages.Message(
           ApexPages.Severity.Error,'please enter both Subject and Body'
       );
       ApexPages.addMessage(message);
    }
    else{
        List<string> toAddresses = new List<string>();
        for(ContactWrapper conwrap : conWrapLst){
          if(conwrap.isChecked){
            toAddresses.add(conwrap.con.Email);
          }  
        }
        if(toAddresses.size() > 0){
            //Logic to send email
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(toAddresses);
            mail.setSubject(subject);
            mail.setplainTextBody(emailBody);
         try {
             // Triggering email
             Messaging.sendEmail(new List< Messaging.SingleEmailMessage>{mail});
             ApexPages.Message message = new ApexPages.Message(
           ApexPages.Severity.Confirm ,'Email has been sent successfully.');
       ApexPages.addMessage(message); 
         } 
            catch (EmailException e){
                ApexPages.Message message = new ApexPages.Message(
           ApexPages.Severity.Error, e.getMessage()
       );
       ApexPages.addMessage(message); 
            }

        }
        else{
            ApexPages.Message message = new ApexPages.Message(
           ApexPages.Severity.Error,'please select atleast one contact'
       );
       ApexPages.addMessage(message); 
        }
    }

}



//Contact Wrapper Class
    Public class ContactWrapper{
        Public Boolean isChecked {get;set;}
        Public contact con {get;set;}
    }
}