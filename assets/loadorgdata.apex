List<string> SObjectList = new List<string>();
String standardobjects = 'Contract,Order,Document,Campaign,Account,Contact,Lead,Opportunity,Product2,Asset,Case,Solution';

for(Schema.SObjectType o : Schema.getGlobalDescribe().Values()){
   Schema.DescribeSObjectResult objResult = o.getDescribe();
    if(objResult.getKeyPrefix()!=null && objResult.isCustomSetting()==false &&
       (objResult.isCustom() || standardobjects.contains(objResult.getName()))){    
           SObjectList.add(objResult.getName());
    }

}
HttpRequest req = new HttpRequest();
req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
req.setHeader('Content-Type', 'application/json');
req.setEndpoint(Url.getOrgDomainUrl().toExternalForm()+'/services/data/v40.0/limits/recordCount?sObjects='+String.join(SObjectList, ','));
req.setMethod('GET'); 
Http h = new Http();
HttpResponse res = h.send(req);
system.debug('response'+res.getBody());      

Scratch_Org_Creds__c test = new Scratch_Org_Creds__c();
test.data__c = res.getBody();
test.name = 'ScratchOrgDetails';
upsert test Scratch_Org_Creds__c.Fields.Name;