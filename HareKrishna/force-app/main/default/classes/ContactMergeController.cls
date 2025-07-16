public with sharing class ContactMergeController {
    @AuraEnabled(cacheable=true)
    public static List<Contact>getDuplicateContacts(String email){
        return[select Id,Name,Email from Contact where Email =:email];    
    }

    @AuraEnabled
    public static void mergeContacts(Id masterId, List<Id> duplicateIds){

        List<Contact> duplicates = [select Id from contact where Id IN :duplicateIds and Id!= :masterId];
        delete duplicates;

    } 
    }