global class CourseApi94{

webservice static string courseName(string courseName){
     string msg='';
     
     course__c course = new course__c(
             Name__c = courseName );
             
             try{
             
             insert course;
             msg= 'Course has been inserted successfully.Record Id :' + course.Id;
             }
             
             catch(Exception e){
           msg =  'course is not inserted : ' + e.getMessage() + 'in line number: ' + e.getLineNumber();
           }
     
     return msg;  
    
    
     } 

}