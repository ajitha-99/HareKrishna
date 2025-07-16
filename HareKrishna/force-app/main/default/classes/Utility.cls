// to reuse the logic again and again
// if we see is before a method it will return either true or false
public with sharing class Utility {
    public static Boolean issetstrdup(set<string> strset,string strval){
        Boolean isDuplicate = false;
        for(string setval : strset){
            if(setval.equalsIgnoreCase(strval)){
               isDuplicate =true; 
                break;
              
            }
        }
        return isDuplicate;
        
    }
    //system.debug(schema.getGlobalDescribe().get('Applicant__c').getDescribe().fields.getMap().get('Country__c').
    //getDescribe().getPicklistValues()
    //);

    public static List<Schema.PicklistEntry> getPickVals(String objectApiName,String fieldApiName) {
        return Schema.getGlobalDescribe().get(objectApiName).getDescribe().fields.getMap().get(fieldApiName).
        getDescribe().getPicklistValues();

    }
    public static String getSessionId(String username, String password, String serverUrl) {
        
//you can save the username,password,url in the custom metadata type and pull the information from there

        String requestBody = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:partner.soap.sforce.com">'+
            '<soapenv:Header>'+
            '</soapenv:Header>'+
            '<soapenv:Body>'+
            '<urn:login>'+
            '<urn:username>'+username+'</urn:username>'+
            '<urn:password>'+password+'</urn:password>'+
            '</urn:login>'+
            '</soapenv:Body>'+
            '</soapenv:Envelope>';

            //Request
            HttpRequest req = new HttpRequest();
            req.setMethod('GET');
            req.setHeader('SOAPAction', 'Login');
            req.setHeader('content-type','text/xml');
          //  serverUrl = https://login.salesforce.com/services/Soap/u/52.0 
            req.setEndPoint(serverUrl);
            req.setBody(requestBody);

            Http http = new Http();
            //making Rest Api - Callout
            HttpResponse response = http.send(req);
            system.debug('response: '+response.getBody());
            String sessionId = response.getBody().substringBetween('<sessionId>','</sessionId>');
            system.debug('sessionId: '+sessionId);

        return sessionId;
    }

}