public with sharing class CaseWizardController {
    @AuraEnabled

    public static Id createCase(string subject, string description, string customerName, String status){
        case newCase = new case(Subject = subject, Description = description, Status = status);
        insert newCase;
        return newCase.Id;


    }
}