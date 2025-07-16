@isTest

public  class TestDataUtility {

    public static case newCase(Boolean isInsert){

        Case cs = new Case(
            Origin = 'Web'
        );

        if(isInsert){
            insert cs;
        }
        return cs;
    }
      public  static List<Case> newCases(Boolean isInsert, Integer numOfRecs){
            List<Case> csLst = new List<Case>();
            for (Integer i=0; i<numOfRecs; i++){
                csLst.add(newCase(false));
            }
          if (isInsert)  {
              insert csLst;
              
          }
          return csLst;
    }
    
    public static List<Account> newAccount(Boolean isInsert,Integer count){
        List<Account> accList = new List<Account>();
        for(integer i =0; i<count; i++){
            Account a = new Account(Name ='Hello'+i, Email__c = 'Test'+i+'@test.com');
            accList.add( a);
        }
        if(isInsert){
        insert accList;
        }
        return accList;
    }
}