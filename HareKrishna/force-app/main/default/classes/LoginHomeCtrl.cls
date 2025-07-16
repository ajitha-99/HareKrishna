public with sharing class LoginHomeCtrl {
 
   public  string username{get;set;}
   public  string password{get;set;}
    
    public PageReference validateLogin(){
        
        PageReference pr;
        
        if(string.isblank(username)|| string.isblank(Password)){
            ApexPages.Message message=new apexpages.message(apexpages.severity.Error,'please enter both username and password');
            apexpages.addmessage(message);
        }
        
        else{
         List<Registration__c> registrations = [select Id,Email__c,Password__c from Registration__c 
                                                where Email__c =: Username];
        
        if(registrations == null || registrations.size() == 0){
        ApexPages.Message message=new apexpages.message(apexpages.severity.Error,'Username doesn\'t exists.');
            apexpages.addmessage(message);     
        }
            else if(registrations[0].Password__c != Password){
        ApexPages.Message message=new apexpages.message(apexpages.severity.Error,'Invalid Password.');
            apexpages.addmessage(message);          
            }
   //All validations are succeeded         
            else{
             pr = page.WelcomePage;   
            }  
       }
        
        return pr;
    }
    
}