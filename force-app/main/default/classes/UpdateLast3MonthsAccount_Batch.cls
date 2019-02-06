global class UpdateLast3MonthsAccount_Batch implements Database.Batchable<sObject>, Database.Stateful {
    global map<ID,list<Case>> mapCases = new map<Id,list<Case>>();
    global Database.QueryLocator start(Database.BatchableContext BC){
        list<case> tempCase;
        Date NinetyDaysAgo = Date.Today() - 90;
        for(case objCase:[SELECT Id, 
                          CreatedDate, 
                          AccountId 
                          FROM 
                          Case WHERE 
                          (RecordType.DeveloperName = 'Art_Fair_Basel_Fiac_Frieze' OR 
                          RecordType.DeveloperName = 'Art_Fair_smaller_regional' OR 
                          RecordType.DeveloperName = 'Guide_Cultivist_Paid' OR 
                          RecordType.DeveloperName = 'Guide_Member_Paid' OR 
                          RecordType.DeveloperName = 'General' OR
                          RecordType.DeveloperName = 'Feedback_and_Issues' OR
                          RecordType.DeveloperName = 'Itinerary_Basic' OR 
                          RecordType.DeveloperName = 'Itinerary_Involved' OR 
                          RecordType.DeveloperName = 'Redemption' OR
                          RecordType.DeveloperName = 'Onboarding_with_Member_Liaison' OR
                          RecordType.DeveloperName = 'Special_Request_Involved' OR 
                          RecordType.DeveloperName = 'Special_Request_Small' OR 
                          RecordType.DeveloperName = 'Tickets_for_Museums_Cultivist_Paid' OR 
                          RecordType.DeveloperName = 'Tickets_for_Museums_Member_Paid' OR (
                          RecordType.DeveloperName = 'Cultivist_Events' AND Status_before_Case_Closed__c='Attended')) AND
                          CreatedDate>=:NinetyDaysAgo ORDER BY CreatedDate DESC]){
                              tempCase= new list<case>();
                              if(mapCases.containsKey(objCase.AccountId)){
                                  tempCase=mapCases.get(objCase.AccountId);
                              }
                              tempCase.add(objCase);
                              mapCases.put(objCase.AccountId,tempCase);
                          }
        
        return Database.getQueryLocator([SELECT Id, Last_Action_Date__c, Number_of_Actions_Last_90_Days__c FROM Account WHERE Id IN:mapCases.keySet()]);
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope) {
        list<Account> lstAccount= new list<Account>();
        for (Account objAccount : scope) {
            lstAccount.add(new Account(id=objAccount.Id, Last_Action_Date__c=mapCases.get(objAccount.Id)[0].CreatedDate.date(), Number_of_Actions_Last_90_Days__c=mapCases.get(objAccount.Id).size()));
        }
        if(!lstAccount.isEmpty())
            update lstAccount;
    }
    global void finish(Database.BatchableContext bc) {
    }
}