public class listUsage {

    /*
        * By default all the variables / methods are non static. 
        * Use static keyword to define variables / methods as static.
        * Use class name to call the static variable / method.
        * The scope of the static variable is through out the transaction.
        * Transaction: Starting of the program execution to the ending of the program execution 
    */

    public static Integer count = 0;

    public static void listUse() {
        count++;

        /*
            * List is ordered by assign a index for the value.
            * It allows duplicates.
            * No limit for the max. number of values as soon as heap size limit not exceeded.
              Heap size limit for synchronous: 6 MB | Heap size limit for asynchronous: 12 MB
            * Syntax: List<DataType> listName = new List<DataType>();
        */

        /** Primtive Types *****/

        // List<String> namesLst = new List<String>();
        List<String> namesLst = new List<String>{
            'Roja', 'Raziya', 'Sesh'
        };
        namesLst.add('Eswari');
        namesLst.add('Manjesh');
        namesLst.add('Ajitha');
        namesLst.add('Manjesh');

        // Replace a value based on index
        namesLst.set(1, 'Vikranth');
        namesLst[2] = 'Soumyadeep';

        // Get the value based on the index
        System.debug('3rd index val: ' + namesLst.get(3));
        System.debug('4th index val: ' + namesLst[4]);

        // Remove the value based on the index 
        namesLst.remove(5);

        System.debug('namesLst: ' + namesLst + ' with size: ' + namesLst.size());

        // Sort the values in asc 
        namesLst.sort(); // Default sorting order is asc
        System.debug('namesLst sorted in asc: ' + namesLst + ' with size: ' + namesLst.size());

        // Sort the values in desc 
        List<String> namesDesLst = new List<String>();
        for(Integer i = namesLst.size() - 1; i >= 0; i--) {
            namesDesLst.add(namesLst[i]);
        }
        System.debug('namesDesLst: ' + namesDesLst + ' with size: ' + namesDesLst.size());

        // Adding multiple vals 
        List<String> newNamesLst = new List<String>();
        newNamesLst.addAll(namesLst);
        System.debug('newNamesLst: ' + newNamesLst + ' with size: ' + newNamesLst.size());

        // Clone the values of a list 
        List<String> namesLst2 = newNamesLst.clone();
        System.debug('namesLst2: ' + namesLst2 + ' with size: ' + namesLst2.size());

        // Clear all the elements in a list
        namesLst2.clear();
        System.debug('namesLst2 is Empty? ' + namesLst2.isEmpty());

        // Arrays 
        Integer[] numArray = new Integer[3];
        numArray[0] = 100;
        numArray[1] = 200;
        numArray[2] = 300;
        numArray.add(100); // Array becomes elastic when we use add method
        System.debug('numArray: ' + numArray + ' with size: ' + numArray.size());

        /** Database Commands *****/

        /*** SOQL - Salesforce Object Query Language *
            * Purpose: To retrieve the info from an object and the related objects.
            * Max. number of SOQL Queries per transaction: 100 (Exception: Too many SOQL Queries: 101)
            * Max. SOQL Query rows per transaction: 50k (Exception: Too many SOQL Query Rows: 50001)
            ---*** Querys Syntax ***---
            -- Tools ---
                1. Developer Console
                2. VS Code
                3. Salesforce Inspector (Chrome Extension)
                4. https://workbench.developerforce.com/
            -- List<Sobject> ---
            SELECT Id, Name, Industry, Rating FROM Account
            SELECT FirstName, LastName, Email, MobilePhone, Salutation, BirthDate FROM Contact
            - WHERE --
            SELECT FirstName, LastName, Email, MobilePhone, Salutation, BirthDate FROM Contact WHERE (Email != null AND MobilePhone != null) OR (FirstName like 'S%' OR (NOT LastName like 'R%'))
            - ORDER BY --
            SELECT FirstName, LastName, Email, MobilePhone, Salutation, BirthDate FROM Contact ORDER BY FirstName NULLS LAST, LastName DESC
            - LIMIT --
            SELECT FirstName, LastName, Email, MobilePhone, Salutation, BirthDate FROM Contact ORDER BY FirstName NULLS LAST, LastName DESC LIMIT 10
            - OFFSET --
            SELECT FirstName, LastName, Email, MobilePhone, Salutation, BirthDate FROM Contact ORDER BY FirstName NULLS LAST, LastName DESC LIMIT 5 OFFSET 10
            - DATE --
            SELECT FirstName, LastName, Email, MobilePhone, Salutation, BirthDate, CreatedDate FROM Contact WHERE CreatedDate = TODAY
            SELECT FirstName, LastName, Email, MobilePhone, Salutation, BirthDate, CreatedDate FROM Contact WHERE CreatedDate = LAST_N_DAYS : 90
            SELECT FirstName, LastName, Email, MobilePhone, Salutation, BirthDate, CreatedDate FROM Contact WHERE BirthDate = 1969-06-13
            SELECT FirstName, LastName, Email, MobilePhone, Salutation, BirthDate, CreatedDate FROM Contact WHERE CALENDAR_YEAR(Birthdate) > 1960 AND CALENDAR_MONTH(Birthdate) >= 6
            - Relationship Queries --
            * Standard Relationship Field: To retrieve parent object fields when you query on a child -
                SELECT Name, StageName, AccountId, Account.Name, Account.Industry, Account.Rating FROM Opportunity
            * Standard Relationship Field: To retrive the child object records when you query on parent object
                SELECT Id, Name, (SELECT Id, Name FROM Contacts), (SELECT Id, Name FROM Opportunities) FROM Account
            * Custom Relationship Field: To retrieve parent object fields when you query on a child object
                SELECT Id, Name, Course__c, Course__r.Name__c, Course__r.Faculty__c, Applicant__c, Applicant__r.Age__c FROM Course_Application__c
            * Custom Relationship Field: To retrive the child object records when you query on parent object
                SELECT Id, Name, (SELECT Id, Name FROM Course_Applications__r) FROM Course__c
            
            -- Integer ---
            
            SELECT count() FROM Contact 

            -- List<AggregateResult> GROUP BY - Aggregate Queries ---
            SELECT COUNT(Id), SUM(Amount), AVG(Amount), MAX(Amount), MIN(Amount), StageName FROM Opportunity WHERE StageName in ('Negotiation/Review', 'Closed Won') GROUP BY StageName HAVING COUNT(Id) > 1 ORDER BY StageName DESC
        */

        /*** SOSL - Salesforce Object Search Language *
            * Purpose: To search for a value across the multiple objects which might be related or might not be related.
            * Max. number of SOSL Queries per transaction: 20 (Exception: Too many SOSL Queries: 21)
 
            * Max. SOSL Query rows per transaction: 2k (Exception: Too many SOSL Query Rows: 2001)
            --- List<List<Sobject>> --
            FIND {test} IN ALL FIELDS RETURNING Account(Id, Name, Industry), Contact(Id, FirstName, LastName), Applicant__c(Id, Name, Email__c), Course__c(Id, Name__c, Description__c)
        */

        /*** DML - Data Manipulation Language *
            * Purpose: To alter the data in the database
                * Operations -
                    1. insert acc;
                    2. update accLst;
                    3. delete 
                    4. undelete 
                    5. upsert --> insert / update 
                    6. merge --> update / delete (Only supported on Lead, Account and Contact)
            * Max. number of DML Statements per transaction: 150 (Exception: Too many DML Stmts: 151)
            * Max. DML rows per transaction: 10k (Exception: Too many DML Rows: 10001)
            ---
            Account acc = new Account(); --> One Row 
            List<Account> accLst = new List<Account>(); --> multiple rows
        */

        /** Non Primtive Types *****/

        // insert records 
        List<Account> accounts = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Tesla2';
        acc.Rating = 'Cold';
        accounts.add(acc);

        Account acc2 = new Account();
        acc2.Name = 'Tesla3';
        acc2.Rating = 'Cold';
        accounts.add(acc2);

        insert accounts;
        

        // UI --> Business Logic (Apex) --> 
        
        List<Applicant__c> applicants = [SELECT Id, Name FROM Applicant__c WHERE Name = 'Applicant-0001'];

        if(applicants != null && applicants.size() > 0) {
            Course__c course = new Course__c(
                Name__c = 'Test' + System.now(), Faculty__c = 'Business', 
                Faculty_Course_Area__c = 'IT'
            );
            Savepoint sp = Database.setSavepoint();
            insert course;

            List<Course_Application__c> courseApps = new List<Course_Application__c>();

            Course_Application__c ca = new Course_Application__c();
            // ca.Applicant__c = 'a005g00002xFUZkAAO'; // don't hard 
            ca.Applicant__c = applicants[0].Id;
            ca.course__c = course.Id;
            courseApps.add(ca);

            Course_Application__c ca2 = new Course_Application__c(
                Applicant__c = applicants[0].Id, course__c = course.Id,
                Status__c = 'Under Conditional Approval'
            );
            courseApps.add(ca2);

            Course_Application__c ca3 = new Course_Application__c();
            ca3.put('Applicant__c', applicants[0].Id);
            ca3.put('course__c', Course.Id);
            courseApps.add(ca3);

            if(courseApps.size() > 0) {
                // try {
                //     insert courseApps; // All Or None
                // }
                // catch(Exception e) {
                //     // Only the first exceptoin will be holded
                //     System.debug('courseApps insert Exception: ' + e.getMessage() + ' in line number: ' + 
                //     e.getLineNumber());
                //     Database.rollback(sp);
                // }

                // Allow partial operation 
                Database.SaveResult[] svResults = Database.insert(courseApps, false); // Make sure to use false as a 2nd parameter

                // Handle all the possible exception when the DMl operation is performed
                for(Database.SaveResult sr : svResults) {
                    if(sr.isSuccess()) {
                       System.debug('Course Application Id: ' + sr.getId());
                    }
                   else {
                        for(Database.Error err : sr.getErrors()) {
                           System.debug('Exception: ' + err.getMessage() + ' due to fields: ' + err.getFields());
                       }
                    }
                }
            }
        }

        // update records 
        List<Course_Application__c> courseApps4Upd = [SELECT Id, Decision_Conditions__c FROM Course_Application__c WHERE Decision_Conditions__c = null];
        if(courseApps4Upd != null && courseApps4Upd.size() > 0) {
            for(Course_Application__c cApp : courseApps4Upd) {
                cApp.Decision_Conditions__c = 'NA';
            }
            update courseApps4Upd;
        }

        // delete records 
        List<Course_Application__c> courseApps4Del = [SELECT Id FROM Course_Application__c WHERE CreatedDate = TODAY];
        if(courseApps4Del != null && courseApps4Del.size() > 0) {
            delete courseApps4Del;
        }

        // undelete records
        

    }
}