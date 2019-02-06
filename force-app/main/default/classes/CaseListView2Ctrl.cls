global with sharing class CaseListView2Ctrl {    
    	//Get related Cases
		@AuraEnabled
		public static String getRelatedCases(String recordId){
			try {
                RecordType rt = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Art_Fair_Basel_Fiac_Frieze' LIMIT 1];
                RecordType rt2 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Art_Fair_smaller_regional' LIMIT 1];
                RecordType rt3 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Cultivist_Art_Trip' LIMIT 1];
                RecordType rt4 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Guide_Cultivist_Paid' LIMIT 1];
                RecordType rt5 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Guide_Member_Paid' LIMIT 1];
                RecordType rt6 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Itinerary_Basic' LIMIT 1];
                RecordType rt7 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Itinerary_Involved' LIMIT 1];
                RecordType rt8 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Non_Cultivist_Events' LIMIT 1];
                RecordType rt9 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Special_Request_Involved' LIMIT 1];
                RecordType rt10 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Special_Request_Small' LIMIT 1];
                RecordType rt11 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Tickets_for_Museums_Cultivist_Paid' LIMIT 1];
                RecordType rt12 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Tickets_for_Museums_Member_Paid' LIMIT 1];

                
                List<Case> caseList = [SELECT CaseNumber, AccountId, Subject, RecordTypeId, Status, Priority, CreatedDate FROM Case WHERE AccountId = :recordId AND Status != 'Closed' 
                                       AND (RecordTypeId = :rt.Id OR
                                           RecordTypeId = :rt2.Id OR
                                           RecordTypeId = :rt3.Id OR
                                           RecordTypeId = :rt4.Id OR
                                           RecordTypeId = :rt5.Id OR
                                           RecordTypeId = :rt6.Id OR
                                           RecordTypeId = :rt7.Id OR
                                           RecordTypeId = :rt8.Id OR
                                           RecordTypeId = :rt9.Id OR
                                           RecordTypeId = :rt10.Id OR
                                           RecordTypeId = :rt11.Id OR
                                           RecordTypeId = :rt12.Id )];   
                
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
                system.debug('==================== DmlException : CaseListView2Ctrl.getRelatedCases' + e + ' ; ' + e.getMessage() + ' ; ' + e.getLineNumber());
			} catch (Exception e) {
                system.debug('==================== Exception : CaseListView2Ctrl.getRelatedCases' + e + ' ; ' + e.getMessage() + ' ; ' + e.getLineNumber());
			}
			return null;
        }     
}