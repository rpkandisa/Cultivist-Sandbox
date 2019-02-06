trigger UpdateLast3MonthsAccount on Case (before INSERT, before UPDATE, before DELETE) {

    List<Account> Accounts = new List<Account>();
    List<Case> RedemptionCases = new List<Case>();
    List<String> AccountIds = new List<String>();
    
        Date NinetyDaysAgo = Date.Today() - 90;
        RedemptionCases = [SELECT Id, CreatedDate, AccountId FROM Case WHERE RecordType.Name != 'Contact Us' AND RecordType.Name != 'General Case' AND RecordType.Name != 'Job Inquiry' AND RecordType.Name != 'Press Inquiry'
        AND RecordType.Name != 'Non-Cultivist Events Inquiry' AND RecordType.Name != 'Member on-boarding and check-in' AND RecordType.Name != 'Cultivist Events'  AND RecordType.Name != 'Cultivist Art Trip'];
        if (RedemptionCases.size() > 0) {
            for (Case RC : RedemptioNCases) {
                AccountIds.add(RC.AccountId);
            }
        }
        Accounts = [SELECT Id, Last_Action_Date__c, Number_of_Actions_Last_90_Days__c FROM Account WHERE Id IN :AccountIds];
    
    if (Accounts.size() > 0 && RedemptionCases.size() > 0) {
        for (Account A : Accounts) {
            Date LAD = NULL;
            Integer NOALN = 0;
            for (Case C : RedemptionCases) {
                if (A.Id == C.AccountId) {
                    if (C.CreatedDate > NinetyDaysAgo){
                    NOALN++;
                    }
                    if (LAD == NULL) {
                        LAD = C.CreatedDate.Date();
                    }
                    else if (C.CreatedDate.Date() > LAD) {
                        LAD = C.CreatedDate.Date();
                    }
                }
            }
            A.Last_Action_Date__c = LAD;
            A.Number_of_Actions_Last_90_Days__c = NOALN;
        }
    }
    if (Accounts.size() > 0  && RedemptionCases.size() > 0) {
        update Accounts;
    }

}