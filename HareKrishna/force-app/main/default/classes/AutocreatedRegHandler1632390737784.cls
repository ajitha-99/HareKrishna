//TODO:This autogenerated class includes the basics for a Registration
//Handler class. You will need to customize it to ensure it meets your needs and
//the data provided by the third party.

global class AutocreatedRegHandler1632390737784 implements Auth.RegistrationHandler{


global User createUser(Id portalId, Auth.UserData data){
   return  [SELECT ID FROM User Where Other_Salesforce_Org_User__c= : data.Username];
   
}

global void updateUser(Id userId, Id portalId, Auth.UserData data){

}
}