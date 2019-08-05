public with sharing class ScratchOrgDetails {
    
    @AuraEnabled(cacheable=true)
    public static string getScratchOrgDetails() {
        string details;
        for(Scratch_Org_Creds__c oDetails : [Select id,Org_Details__c,Req_ID__c from Scratch_Org_Creds__c where name=:'ScratchOrgDetails' limit 1]){
            details = oDetails.Org_Details__c;
            break;
        }
        return details;
    }

    @AuraEnabled(cacheable=true)
    public static List<ScratchOrgDetails.sObjects> getOrgCountDetails() {
        string sOrgCount;
        for(Scratch_Org_Creds__c oDetails : [Select id,Org_Details__c,Data__c from Scratch_Org_Creds__c where name=:'ScratchOrgDetails' limit 1]){
            sOrgCount = oDetails.Data__c;
            break;
        }

        ScratchOrgDetails details =  (ScratchOrgDetails) System.JSON.deserialize(sOrgCount, ScratchOrgDetails.class);
        return details.sObjects;
    }

    // sorting is not working, need to work on this
    @AuraEnabled
    public List<SObjects> sObjects;

	public class SObjects implements Comparable{
        @AuraEnabled
		public Integer count;
        @AuraEnabled
		public String name;

        Public Integer compareTo(Object objToCompare) {
            return name.compareTo(((SObjects)objToCompare).name);            
	    }
	}

	
	

   
}