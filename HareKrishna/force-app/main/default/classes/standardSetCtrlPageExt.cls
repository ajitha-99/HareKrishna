public with sharing class standardSetCtrlPageExt {

    public standardSetCtrlPageExt(Apexpages.standardSetController con) {

        con.setPagesize(Integer.valueOf(Org_Wide_Settings__c.getInstance().Page_Size__c));

    }
}