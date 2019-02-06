trigger ManageCase on Case (after insert,after update) {
    List<Case> caseList=new List<Case>();
    List<Case> caseRList= new List<Case>();

    for(Case c: trigger.new){
        if(trigger.isupdate){
            if(c.Campaign__c!=null && c.Campaign_Member_Opt_Out__c == FALSE &&(Trigger.oldmap.get(c.Id).Campaign__c!=c.Campaign__c) && c.ContactId!=null){
                caseList.add(c);
            }
            if(c.Campaign__c!=null && c.Campaign_Member_Opt_Out__c == True && c.ContactId!=null) {
                caseRList.add(c);
            }
        }
        if(trigger.isInsert){
            if(c.Campaign__c!=null && c.ContactId!=null){
                caseList.add(c);
            }
        }
    }
    if(!caseList.isEmpty()){
        CaseTriggerHandler.addCaseTeamMemeber(caseList);
    }
    if(!caseRList.isEmpty()) {
        CaseTriggerHandler.removeCaseMember(caseRList);   
    }

    if(trigger.isAfter && trigger.isUpdate){
        CaseTriggerAPIHandler.APICallout(trigger.new, trigger.oldMap, trigger.isInsert); // this trigger only run for after inser/update
    }
}