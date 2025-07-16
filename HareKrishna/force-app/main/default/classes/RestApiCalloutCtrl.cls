public with sharing class RestApiCalloutCtrl {

    Public string accNum{get;set;}

    public Account acc{get;set;}

public RestApiCalloutCtrl() {

        accNum = 'CD355118';
        acc = new Account();
    }

    public void makeCallout(){
        HttpRequest req = new HttpRequest();
            req.setMethod('GET');
           req.setEndPoint('callout:Batch92Connect/services/apexrest/account/'+ accNum);
            

            Http http = new Http();
            //making Rest Api - Callout
            HttpResponse response = http.send(req);
            system.debug('response: '+response.getStatusCode());
            system.debug('response: '+response.getBody());
		
         ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, String.valueOf(response.getStatusCode())
         )
         );
         
         ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, response.getBody()
         )
         );
         acc = (Account)JSON.deserialize(response.getBody(), Account.class);
      
    }
   
}