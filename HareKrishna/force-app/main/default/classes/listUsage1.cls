public class listUsage1 {
    
    public static Integer count=0;
    
    Public static void listuse1() {	
        count++;
     system.debug('listcount:' + listUsage1.count);   
        List<string>namesLst = new list<string>{
            'Roja','Fathima','Raziya'};  
        namesLst.add('Eswari');
        namesLst.add('Ajitha');
        namesLst.add('Karthik');
        namesLst.add('Ajitha');
             
    //replace the value based on index
   
        namesLst.set(1,'Vikranth');
        namesLst[2] = 'soumyadeep';
        
    // get the value based on index
    
       system.debug('3rd value:' + namesLst.get(3));
         system.debug('4th value:' + namesLst[4]);
        
   // remove a value
          
        namesLst.remove(2);
        
    // sort a value
        namesLst.sort();    
        
         system.debug('names in asc:' + namesLst +'with size:' + namesLst.size());
    
     // sort in desc
        
        list<string> namesDesLst = new list<string>();
        
        for(Integer i= namesLst.size()-1; i>=0; i--){
            
            //namesDesLst.add(namesLst.get(i));
           namesDesLst.add(namesLst[i]);
        }    
        system.debug('names in des:' + namesDesLst +'with size:' + namesDesLst.size());     
     
        //adding multiple values//
        
       list<string> namesLstNew = new list<string>();
        
        namesLstNew.addAll(namesLst);
        
        system.debug('newnameslist:'+ namesLstNew + 'with size:' + namesLstNew.size());
        
        
     // clone the values of a list
     
        List<string> namesLst2 = namesLstNew.clone();
        system.debug('namesLst2:' + namesLst2 +'with size:' + namesLst2.size());
        
     // clear all the values
     
      namesLst2.clear();
        
          system.debug('namesLst2 is empty:'  + namesLst2.isEmpty());  
        
     //non primitive data types
     // DML Operations
     // insert
     // 
     // Account acc = new Account(); --inserting one row
     
        List<Account> accounts = new List <Account> (); //-- inserting multiple rows
     
        Account acc2 = new Account();
        acc2.name='Tesla 2';
        acc2.rating='cold';
        accounts.add(acc2);
        
        Account acc3=new Account();
        acc3.name='Tesla 3';
        acc3.rating='Hot';
         accounts.add(acc3);
        insert accounts;
        
        // for custom objects
        List<Applicant__c> applicants = [select id,Name from applicant__c where name='Applicant0001'];
        if (applicants !=null && applicants.size()>0){
            
//another way of inserting records
		
		Course__c  course = new Course__c(Name__c='Test'+ system.now(),
                                          Faculty__c='Business',
                                         Faculty_course_Area__c='IT');
        
            savepoint sp= Database.setSavePoint();
            insert course;
            
    List< course_Application__c> courseApps = new List<course_Application__c>();  
            
    // another way of inserting records        
        course_Application__c ca = new course_Application__c();
            ca.Applicant__c = applicants[0].id; 
            ca.course__c = Course.Id;
        courseApps.add(ca); 
            
     // one more way of inserting records       
       course_Application__c ca2 = new course_Application__c(
           Applicant__c =applicants[0].id ,course__c = Course.Id,
           Status__c='Under Conditional Approval');
         courseApps.add(ca2);  
     //one more way of inserting
            
       course_Application__c ca3 = new course_Application__c();
       ca3.put('Applicant__c', applicants[0].id);
       ca3.put('course__c',  Course.Id);
        courseApps.add(ca3);  
            
            if(courseApps.size()>0){
               try{
               insert courseApps;
                }
                catch(Exception e){
                    system.debug('CourseApps insert:'+ e.getMessage() + 'in line number:'
                                + e.getLineNumber());
                    Database.rollback(sp);                     
                        }  
                 
              //Allow partial operations
              
 /*   Database.SaveResult[] svRslt = Database.insert(courseApps,false); //make sure to use false as a second parameter
            
   // handle all the possible exceptios when the dml operation is performed
               
              for (Database.SaveResult[] sr:svRslt){
                   if(sr.isSuccess()){
                        system.debug('courseapplicationid:'+ sr.getId());
                    }	
                    
                else{
                    for (Database.Error err :sr.getErrors()){
                     system.debug('Exception:'+err.getmessage() +'due to fields:' + err.getFields());
                    }
                    } */ 
                    
                }	    
                
                
                }
            
            
     //update records
     	
        List<course_Application__c> courseupdate = [select Id,Decision_Conditions__c
         from course_Application__c where Decision_Conditions__c=null];
        if(courseupdate != null && courseupdate.size()>0)
        for(course_Application__c cupd : courseupdate){
            cupd.Decision_Conditions__c ='NA';
        }
        update courseupdate;
        
       //delete records
       
       List<course_Application__c> coursedelete = [select Id from course_Application__c where CreatedDate =TODAY];
        if(coursedelete != null && coursedelete.size()>0){
            delete coursedelete;
        }
       // undelete records
        List<course_Application__c> courseundelete = [select Id from course_Application__c
                                                    where CreatedDate =TODAY and isdeleted=true
                                                     all rows];
        if(courseundelete != null && courseundelete.size()>0){
            undelete courseundelete;
        }
           // SOSL Query 
        List<List<Sobject>> lstOfLst = [FIND 'test' IN ALL FIELDS RETURNING Account(Id, Name), Contact(Id, Name), Course__c, Applicant__c];

        List<Contact> cons = (List<Contact>)lstOfLst[1];
        System.debug('cons: '+cons);     
            }      
            
    }