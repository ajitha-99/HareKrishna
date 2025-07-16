//Automatically update the division field value on the user based on the role.
//client will be providing the mapping file in excel

//which object ? user,UserRoleId
//which dml ? insert,update
//before or after ? before insert before update
//RoleDivisionMapping__c.getAll()--> Map <string>,RoleDivisionMapping__c(key,value)
//RoleDivisionMapping__c.getAll().get('CEO')--> RoleDivisionMapping__c
//RoleDivisionMapping__c.getAll().get('CEO').Division__c

trigger UserTrigger on User (before insert,before update,after update) {
    if(trigger.isBefore){
    set<Id> roleIds = new set<Id>();
    for(user usr:trigger.new){
         if (usr.UserRoleId != null)
        roleIds.add(usr.UserRoleId);
// to make division as null if the role is not selected.
        else  
             usr.Division= null;
    }
  
        if(roleIds.size() > 0) {
            // List<UserRole> roles = [SELECT Id, Name FROM UserRole WHERE Id in: roleIds];    
            
Map<Id,userRole> rolemap = new map <Id,userRole>(
[select Id,Name from UserRole where Id in:roleIds]);
    for(user usr:trigger.new){
      string rolename =  rolemap.get(usr.UserRoleId).Name;
        
   //To avoid issue when the role is not present in the list custom settings.
        
        if (ROleDivisionMapping__c.getAll().containskey(rolename))
       usr.Division = ROleDivisionMapping__c.getAll().get(rolename).Division__c; 
        else
            usr.Division= null;
        }
}
    }                                                         
//upon deactivating user trigger should fire and update to the immediate manager
   
    else{
        Map<Id,Id> inActiveusrIdsmngrmap = new Map<Id,Id>();
        for(user usr : trigger.new){
            if (!usr.IsActive && usr.IsActive != trigger.oldMap.get(usr.Id).IsActive){
               
                inActiveusrIdsmngrmap.put(usr.Id,usr.ManagerId);
                
	            }
      }
        if (inActiveusrIdsmngrmap.size()>0){
                  userTriggerHandler.updapplicants(inActiveusrIdsmngrmap);
        } 
        
        
        
    }
    
                                 
}