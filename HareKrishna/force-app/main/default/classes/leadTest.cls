@isTest
public with sharing class leadTest {
    public static testMethod void leadTest() {
        lead l = new lead();
        l.FirstName = 'Azitha';
        l.LastName = 'G';
        insert l;

    }
}