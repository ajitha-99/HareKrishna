@isTest //(seeAllData=true) // to show the data in the database
//avoid using seealldata=true

 class TestCaseTrigger {
    static testMethod void casemethodTest(){
       // delete [select Id from case limit 1];//never depend on the existing data present in the database
    // we have to prepare our own test data
        Case cs = TestDataUtility.newCase(false);
        cs.Status = 'Closed';
        insert cs;

        //Triggering point

        Test.startTest();
            try{
                delete cs;
            }
            catch(Exception e){
                System.assert(e.getMessage().contains(Label.Case_closed_err_msg));
            }        
            Test.stopTest();
        }
        static testMethod Void caseTriggerBulkUnitTest(){
            List<Case> csLst = TestDataUtility.newCases(false,200);
            for(Integer i=0; i<10; i++){
                csLst[i].Status = 'Closed';
            }
            insert csLst;

        //triggering the logic
        Test.startTest();
        try{
            delete csLst;
        }
        catch(Exception e){
            System.assert(e.getMessage().contains(Label.Case_closed_err_msg));
        }        
        Test.stopTest();
        }
    
    }