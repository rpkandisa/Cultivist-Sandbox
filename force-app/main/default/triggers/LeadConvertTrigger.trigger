trigger LeadConvertTrigger on Lead (after update) {

/*    Set<Id> accids = new Set<Id>();
    for(Lead lead:Trigger.new){
        if(lead.IsConverted&&
           !Trigger.OldMap.get(lead.id).IsConverted&&
           lead.ConvertedAccountId!=null){
            accids.add(lead.ConvertedAccountId);
        }
    }
    
    Map<Id, Account> accMap = new Map<Id, Account>([SELECT Id, BillingCity, BillingState, BillingPostalCode, BillingCountry, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry FROM Account where id in :accids]);
	
    for(Lead lead:Trigger.new){
        if(lead.ConvertedAccountId!=null&&
           accMap.containsKey(lead.ConvertedAccountId)){
           Account acc = accMap.get(lead.ConvertedAccountId);
               acc.BillingCity = lead.City;
               acc.BillingCountry = lead.Country;
               acc.BillingState = lead.State;
               acc.BillingStreet = lead.Street;
               acc.BillingPostalCode = lead.PostalCode;
               
               acc.PersonMailingCity = lead.Secondary_Mailing_City__c;
               acc.PersonMailingCountry = lead.Secondary_Mailing_Country__c;
               acc.PersonMailingState = lead.Secondary_Mailing_State_Province__c;
               acc.PersonMailingStreet = lead.street_second_line__c ;
               acc.PersonMailingPostalCode = lead.Secondary_Mailing_Zip_Postal_Code__c;
        }  
    }
    update accMap.values();*/
}