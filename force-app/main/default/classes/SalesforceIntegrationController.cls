public class SalesforceIntegrationController {
    @future(callout = True)
    public static void getDetails(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:SF_Noob/services/apexrest/Account/');
        req.setHeader('Content-Type','application/json; charset=UTF-8');
        req.setHeader('Accept','application/json');
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse response = http.send(req);
        
        system.debug('response code:'+response.getStatusCode());
        system.debug('response body:'+response.getBody());
        
    }
    @future(callout=True)
    public static void createAccountInTargetOrg(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:SF_Noob/services/apexrest/Account/');
        req.setHeader('content-Type','application/json; charset=UTF-8');
        req.setHeader('Accept','application/json');
        req.setBody('{"accountName":"SFNoob1" }');
        req.setMethod('POST');
        Http http = new Http();
        HttpResponse response = http.send(req);
        
        system.debug('response code:'+response.getStatusCode());
        system.debug('response body:'+response.getBody());
    }

}