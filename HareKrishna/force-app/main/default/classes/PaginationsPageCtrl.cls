public with sharing class PaginationsPageCtrl {

    public List<Account> accounts {get;set;}
    public List<contact> contacts {get;set;}
    public List<Opportunity> opportunities {get;set;} 


    public List<String> accFields {get;set;}
    public List<String> conFields {get;set;}
    public List<String> oppFields {get;set;}  

    public PaginationsPageCtrl() {

        accounts =  new List<Account>(
         [select Id,Name,Rating,Industry from Account Limit: Limits.getlimitQueryRows()]

        );

        contacts =  new List<Contact>(
         [select Id,FirstName,LastName,Email,Mobilephone from Contact Limit: Limits.getlimitQueryRows()]

        );
        opportunities =  new List<Opportunity>(
         [select Id,Name,StageName,CloseDate,Amount from Opportunity Limit: Limits.getlimitQueryRows()]
        );

        accFields = new List<String>{
            'Name','Rating','Industry'
        };
        conFields = new List<String>{
            'FirstName','LastName','Email','MobilePhone'
        };
        oppFields = new List<String>{
            'Name','StageName','CloseDate','Amount'
        };
    }
}