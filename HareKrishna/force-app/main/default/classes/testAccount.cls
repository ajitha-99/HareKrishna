@istest

class testAccount {

    static testmethod void accUnitTest() {
        bankAccount acc = new bankAccount ();
        System.assertEquals(5000,acc.balance);
        acc.deposit(45000);
        acc.withdraw(10000);
        acc.withdraw(150000);
       



        
        System.assertEquals(50000,acc.deposit(45000));
        
        System.assertEquals(65000,acc.deposit(15000));

          
     

       /* System.assertEquals(45000,acc.deposit(45000));

       

        System.assertEquals(65000,acc.deposit);

        System.assertEquals(15000,acc.deposit);*/

      
    }     
}