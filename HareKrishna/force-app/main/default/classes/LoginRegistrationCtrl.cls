public class LoginRegistrationCtrl {
	
 //define a variable to store confirm password
 // to view the variable in visualforce use set and get. set means input and get means output.
   
    public string confirmpwd{set;get;}
    Registration__c reg;
    
    public  LoginRegistrationCtrl(ApexPages.StandardController controller){
       reg= (Registration__c)controller.getRecord();
    }

    public String getCityMsg(){
        if (reg.City__c =='Bangalore')
          return 'Bangalore is IT hub.';
        return null;
    }
 // after calling one of the apex method and navigate to the page use return type pagereference method   
    Public PageReference save(){
        PageReference pr;
        if(string.isblank(reg.Password__c) || string.isblank(confirmpwd)){
 // it accepts two parameters severity of message either warning,success,error message like that         
 ApexPages.message msg = new apexpages.message(apexpages.severity.ERROR,'Please enter password and confirm password.'); 
        apexpages.addMessage(msg);                                             
            

      } 
        else if(reg.Password__c != confirmpwd){
    ApexPages.message msg = new apexpages.message(apexpages.severity.ERROR,'Please enter password and confirm password as same.'); 
        apexpages.addMessage(msg);         
        }  
// dml operation might fail due to some exceptions so use try and catch        
        else{
            try{
 // if everything is success it should navigate to one of the success page login registration successfully               
              insert reg; 
        //    pr = new PageReference('/apex/LoginRegistrationSuccess');
            pr = page.LoginRegistrationSuccess;    
            }
            catch(Exception e){
      ApexPages.message msg = new apexpages.message(apexpages.severity.ERROR,e.getmessage()); 
        apexpages.addMessage(msg);               
            }
        }
      return pr;//default value is null if you dont provide any url/page.Null means it stays at the same page.  
    }
}