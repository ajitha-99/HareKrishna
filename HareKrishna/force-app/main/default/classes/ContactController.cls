public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        // Simulate an error
        throw new AuraHandledException('Intentional error for testing');
    }
}