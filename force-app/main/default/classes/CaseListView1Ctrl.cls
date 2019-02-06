global with sharing class CaseListView1Ctrl {    
    	//Get related Cases
		@AuraEnabled
		public static String getRelatedCases(String recordId){
			try {
                RecordType rt = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Cultivist_Events' LIMIT 1];
                
                List<Case> caseList = [SELECT CaseNumber, AccountId, Subject, RecordTypeId, Status, Priority, Campaign__c, Service_Date__c FROM Case WHERE AccountId = :recordId AND Status != 'Closed' AND RecordTypeId = :rt.Id];                
                List<RelatedCaseRecordTypeWrapper> bindedList = new List<RelatedCaseRecordTypeWrapper>();              
                /*Wrapper is not necessary for this component since it's only one record type, but the other ones need it so I left it in.*/
                
                for(Case c: caseList){
                    RelatedCaseRecordTypeWrapper rcrtw = new RelatedCaseRecordTypeWrapper();
                                        
                    rcrtw.relatedCase = c;
                    rcrtw.caseRecordType = rt;
                    
                    if(c.Campaign__c != null){
                    	Campaign camp = [SELECT Id, Name FROM Campaign WHERE Id=:c.Campaign__c LIMIT 1];
                    	rcrtw.caseCampaign = camp;
                    }
					bindedList.add(rcrtw);
                }
                
                /*This wrapper is a remnant of previous code. Not really needed.*/
                RelatedCaseListViewWrapper rclvw = new RelatedCaseListViewWrapper();
                rclvw.bindedList = bindedList;
                
                return JSON.serialize(rclvw);
			} catch (DmlException e) {
                system.debug('==================== DmlException : CaseListView1Ctrl.getRelatedCases' + e + ' ; ' + e.getMessage() + ' ; ' + e.getLineNumber());
			} catch (Exception e) {
                system.debug('==================== Exception : CaseListView1Ctrl.getRelatedCases' + e + ' ; ' + e.getMessage() + ' ; ' + e.getLineNumber());
			}
			return null;
        }     
}