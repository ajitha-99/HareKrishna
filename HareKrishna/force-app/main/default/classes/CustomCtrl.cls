public with sharing class CustomCtrl {

    Public Apexpages.standardSetController con{
        get{
            if(con == null){
                con = new Apexpages.standardSetController(
                    [select Id,Name, Rating,Industry from Account Limit : Limits.getLimitQueryRows()]
                );
                con.setPagesize(Integer.valueOf(Org_Wide_Settings__c.getInstance().Page_Size__c));

            }
            return con;
        }
        
        set;
    
    
    }

    public List<Account> getAccounts() {
      return (List<Account>)con.getRecords();
    }
}