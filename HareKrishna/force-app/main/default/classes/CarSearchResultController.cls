public with sharing class CarSearchResultController {

    @AuraEnabled(cacheable=true)
    public static List<Car__c> getCars(string carTypeId){

        if(string.isEmpty(carTypeId)){
            return[select Id,Name,Picture__c,Contact__r.Name,Geolocation__latitude__s,Geolocation__longitude__s
            from Car__c
            where Available_For_Rent__c=true];
        }
        else{
            return[select Id,Name,Picture__c,Contact__r.Name,Geolocation__latitude__s,Geolocation__longitude__s
            from Car__c
            where Available_For_Rent__c=true
            AND Car_Type__c =: carTypeId];
        }
    }
}