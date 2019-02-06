trigger CaseIncomingEmail on Task (after insert) {

    Integer run = 0;
    List<Case> relatedCases = new List<Case>();
    List<Task> relatedTasks = new List<Task>();
    List<Case> updateCases = new List<Case>();
    List<String> caseIds = new List<String>();
    
    for (Task T : Trigger.new) {
        if (T.WhatId.getSObjectType() == Case.sObjectType) {
            caseIds.add(T.WhatId);
            run = 1;
        }
    }
    
    if (run == 1) {
        
        relatedCases = [SELECT Id, Status FROM Case WHERE Id in :caseIds];
        relatedTasks = [SELECT Id, CreatedDate, Subject, WhatId FROM Task WHERE WhatId in :caseIds AND Subject LIKE 'Email%'];
        
        for (Case C : relatedCases) {
            Integer MoreThan24Hours = 0;
            Long now = DateTime.now().getTime();
            DateTime MostRecentTask;
            for (Task T : Trigger.new) {
                if (T.WhatId == C.Id) {
                    for (Task RC : relatedTasks) {
                        IF (RC.Id != T.Id) {
                            if (RC.WhatId == C.Id) {
                               if (MostRecentTask == NULL) {
                                   MostRecentTask = RC.CreatedDate;
                               }
                               else {
                                   if (MostRecentTask < RC.CreatedDate) {
                                       MostRecentTask = RC.CreatedDate;
                                   }
                               }
                            }
                        }                   
                    }
                }
            }
            if (MostRecentTask != NULL) {
                Long MRT = MostRecentTask.getTime();
                Long hours = (now - MRT)/1000/60/60;
                if (hours > 24) {
                    C.Status = 'New Email Received - Over 24 Hours Inactive';
                    updateCases.add(C);
                }
            }
        }
        
        if (updateCases.size() > 0) {
            update updateCases;
        }
    }

}