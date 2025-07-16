public with sharing class setUsage {
    
    public static void setUse(){
      /*set is unordered.
        it is unique .*/
        
       set <string> nameset = new set<string>{
            'Roja','Fathima','Raziya'};
        if(!Utility.issetstrdup(nameset,'Eswari'))       
        nameset.add('Eswari');
        if(!Utility.issetstrdup(nameset,'Ajitha'))
        nameset.add('Ajitha');
        if(!Utility.issetstrdup(nameset,'Karthik'))
        nameset.add('Karthik');
         if(!Utility.issetstrdup(nameset,'ajitha'))
        nameset.add('Ajitha');
        
      system.debug ('name set:' +nameset +'with size:' + nameset.size());
        
    // to remove a value
    
        nameset.remove('Eswari');
     system.debug ('name set:' +nameset +'with size:' + nameset.size());   
        
   // to verify using contains
   
    system.debug ('verify a value:' + nameset.contains('Imran'));         
    system.debug ('verify a value:' + nameset.contains('Karthik'));    
        
       // set<Account> accounts = [select Id,Name from Account Limit 5];direct assignment is not possible
       set<Account> accounts = new set<Account>([select Id,Name from Account Limit 5]);
        accounts.addAll( [select Id,Name from Account Limit 5]);
        
    }

}