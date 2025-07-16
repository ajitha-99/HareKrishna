public with sharing class caseController {

    @AuraEnabled
    public static void confirmCases(List<Id> caseIds) {
        if (caseIds == null || caseIds.isEmpty()) {
            throw new AuraHandledException('Case Id list is required.');
        }

        System.debug('Received caseIds: ' + caseIds);

        List<Case> casesToUpdate = new List<Case>();
        List<Case> cases = [SELECT Id, Status FROM Case WHERE Id IN :caseIds];
        System.debug('Fetched Cases: ' + cases);

        for (Case c : cases) {
            System.debug('Original Status for Case ' + c.Id + ': ' + c.Status);
            if (c.Status == 'Customer Confirmed') {
                c.Status = 'Closed';
                System.debug('Status set to Closed for Case: ' + c.Id);
            } else {
                c.Status = 'Customer Confirmed';
                System.debug('Status set to Customer Confirmed for Case: ' + c.Id);
            }
            casesToUpdate.add(c);
        }

        try {
            if (!casesToUpdate.isEmpty()) {
                update casesToUpdate;
                System.debug('Cases updated: ' + casesToUpdate);
            }
        } catch (Exception e) {
            System.debug('DML Error: ' + e.getMessage());
            throw new AuraHandledException('Failed to update Case: ' + e.getMessage());
        }
    }
}