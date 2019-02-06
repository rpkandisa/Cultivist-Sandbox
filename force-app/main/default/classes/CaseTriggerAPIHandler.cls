public with sharing class CaseTriggerAPIHandler {
    
    public static void APICallout(List<Case> lst, Map<Id,Case> Oldmap, Boolean isInsert){
        
        Map<string,Set<string>> mapconfig = new Map<string,Set<string>>();
        for(Cultivist_Config__mdt c : [select id ,Record_Type__c,Record_Type_Status__c from Cultivist_Config__mdt where Type__c='Case Record Type' order by Record_Type__c asc]){
            if(mapconfig.containsKey(c.Record_Type__c)){
                mapconfig.get(c.Record_Type__c).add(c.Record_Type_Status__c.toLowerCase());
            }else{
                mapconfig.put(c.Record_Type__c, new Set<string> { c.Record_Type_Status__c.toLowerCase() });
            }
        }

        Set<Id> caseIds = new Set<Id>();
        for (Case obj : [select id,RecordTypeId,RecordType.Name,Status from case where id in: lst]) {
           if((isInsert || (!isInsert && Oldmap.containsKey(obj.Id) && (Oldmap.get(obj.Id).RecordTypeId != obj.RecordTypeId || Oldmap.get(obj.Id).Status != obj.Status)))){               
                if(mapconfig.containsKey(obj.RecordType.Name) && mapconfig.get(obj.RecordType.Name).Contains(obj.Status.toLowerCase())){
                    caseIds.add(obj.Id);
                }
           }
        }

        if(caseIds.size()>0) fnBookingCallout(caseIds);
    }

    @future(callout=true)
    private static void fnBookingCallout(set<Id> caseId){
        for (Case obj : [select id,Service_Date__c,CaseNumber,Campaign__c,CreatedDate,Total_Guest_Count__c,Status,RecordType.Name from Case where Id in: caseId]) {
           cultivistAPI.booking(obj);
        }
    }
}