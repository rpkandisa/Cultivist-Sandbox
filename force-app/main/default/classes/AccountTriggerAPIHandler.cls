public with sharing class AccountTriggerAPIHandler {
    public static void APICallout(List<Account> lst, Map<Id,Account> Oldmap, Boolean isInsert){
        
        Map<string,Set<string>> mapconfig = new Map<string,Set<string>>();
        for(Cultivist_Config__mdt c : [select id ,Record_Type__c,Record_Type_Status__c from Cultivist_Config__mdt where Type__c='Account Type' order by Record_Type__c asc]){
            if(mapconfig.containsKey(c.Record_Type__c)){
                mapconfig.get(c.Record_Type__c).add(c.Record_Type_Status__c.toLowerCase());
            }else{
                mapconfig.put(c.Record_Type__c, new Set<string> { c.Record_Type_Status__c.toLowerCase() });
            }
        }

        Set<Id> accountIds = new Set<Id>();
        for (Account obj : lst) {
       

            if(isInsert || (!isInsert && Oldmap.containsKey(obj.Id) && (Oldmap.get(obj.Id).Status__c != obj.Status__c 
            || Oldmap.get(obj.Id).Member_ID__c != obj.Member_ID__c 
            || Oldmap.get(obj.Id).Membership_Type__c != obj.Membership_Type__c 
            || Oldmap.get(obj.Id).Membership_Expiry_date__c != obj.Membership_Expiry_date__c
            || Oldmap.get(obj.Id).Card_Valid_Through_Date__c != obj.Card_Valid_Through_Date__c
            || Oldmap.get(obj.Id).Secondary_Mailing_Street__c != obj.Secondary_Mailing_Street__c
            || Oldmap.get(obj.Id).PersonMailingStreet != obj.PersonMailingStreet
            || Oldmap.get(obj.Id).PersonMailingPostalCode != obj.PersonMailingPostalCode
            || Oldmap.get(obj.Id).PersonMailingState != obj.PersonMailingState
            || Oldmap.get(obj.Id).PersonMailingCountry != obj.PersonMailingCountry
            || Oldmap.get(obj.Id).Profile_Picture__c != obj.Profile_Picture__c
            || Oldmap.get(obj.Id).Dedicated_Member_Liaison_Name__c != obj.Dedicated_Member_Liaison_Name__c
            || Oldmap.get(obj.Id).Dedicated_Member_Liaison_Phone__c != obj.Dedicated_Member_Liaison_Phone__c
            || Oldmap.get(obj.Id).Dedicated_Member_Liaison_Email__c != obj.Dedicated_Member_Liaison_Email__c
            || Oldmap.get(obj.Id).My_Dedicated_Member_Liaison_Address__c != obj.My_Dedicated_Member_Liaison_Address__c
            || Oldmap.get(obj.Id).FirstName != obj.FirstName
            || Oldmap.get(obj.Id).LastName != obj.LastName
            || Oldmap.get(obj.Id).Member_Since__c != obj.Member_Since__c
            || Oldmap.get(obj.Id).Phone != obj.Phone
            || Oldmap.get(obj.Id).PersonEmail != obj.PersonEmail
            || Oldmap.get(obj.Id).PersonMailingCity != obj.PersonMailingCity
            || Oldmap.get(obj.Id).BillingStreet != obj.BillingStreet
            || Oldmap.get(obj.Id).BillingCity != obj.BillingCity
            || Oldmap.get(obj.Id).BillingState != obj.BillingState
            || Oldmap.get(obj.Id).BillingPostalCode != obj.BillingPostalCode
            || Oldmap.get(obj.Id).BillingCountry != obj.BillingCountry))){
                accountIds.add(obj.Id);
            }
        }

        System.debug('accountIds@@@ ' + accountIds);

        if(accountIds.size()>0) fnUserCallout(accountIds);
    }

    @future(callout=true)
    private static void fnUserCallout(set<Id> accountIds){
        for (Account obj : [select id,Name,PersonEmail,Profile_Picture__c,Phone,Membership_Type__c,Member_Since__c,Membership_Expiry_date__c,Card_Valid_Through_Date__c,PersonMailingStreet,PersonMailingCity,PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,Owner.Name,Owner.Email,Owner.Phone,Owner.FullPhotoUrl from Account where Id in: accountIds]) {
           cultivistAPI.user(obj);
        }
    }
}