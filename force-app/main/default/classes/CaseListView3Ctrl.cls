global with sharing class CaseListView3Ctrl {    
    	//Get related Cases
		@AuraEnabled
		public static String getRelatedCases(String recordId){
			try {
                RecordType rt = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Replacement_Cards' LIMIT 1];
                RecordType rt2 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Member_on_boarding_and_check_in' LIMIT 1];
                RecordType rt3 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Membership_Renewals' LIMIT 1];
                
                List<Case> caseList = [SELECT CaseNumber, AccountId, Subject, RecordTypeId, Status, Priority, CreatedDate FROM Case WHERE AccountId = :recordId AND Status != 'Closed' 
                                       AND (RecordTypeId = :rt.Id OR
                                           RecordTypeId = :rt2.Id OR
                                           RecordTypeId = :rt3.Id)];   
                
                List<RelatedCaseRecordTypeWrapper> bindedList = new List<RelatedCaseRecordTypeWrapper>();              
                
                for(Case c: caseList){
                    RelatedCaseRecordTypeWrapper rcrtw = new RelatedCaseRecordTypeWrapper();
                    
                	RecordType rtc = [SELECT Name, DeveloperName FROM RecordType WHERE Id = :c.RecordTypeId LIMIT 1];
                    
                    rcrtw.relatedCase = c;
                    rcrtw.caseRecordType = rtc;
					bindedList.add(rcrtw);
                }
                
                /*This wrapper is a remnant of previous code. Not really needed.*/
                RelatedCaseListViewWrapper rclvw = new RelatedCaseListViewWrapper();
                rclvw.bindedList = bindedList;
                
                return JSON.serialize(rclvw);
			} catch (DmlException e) {
                system.debug('==================== DmlException : CaseListView3Ctrl.getRelatedCases' + e + ' ; ' + e.getMessage() + ' ; ' + e.getLineNumber());
			} catch (Exception e) {
                system.debug('==================== Exception : CaseListView3Ctrl.getRelatedCases' + e + ' ; ' + e.getMessage() + ' ; ' + e.getLineNumber());
			}
			return null;
        }     
}