public with sharing class CarSearchFormController {
   @AuraEnabled(cacheable=true)
   public static List<car_Type__c> getCarTypes(){
      return [select Id,Name from car_Type__c];
   }
}