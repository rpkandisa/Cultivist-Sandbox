@isTest
(seealldata=true)
public class TestCaseListViews {
    public static testmethod void testCaseListViews(){
        test.startTest();     
   			Account a = new Account();
        	a.Name = 'Test Account';
        	insert a;
        
        	Campaign camp = new Campaign();
        	camp.Name = 'Test Campaign';
        	insert camp;
        
            RecordType rt = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Cultivist_Events' LIMIT 1];
        
        	Case c = new Case();
        	c.AccountId = a.Id;  
        	c.RecordTypeId = rt.Id;  
        	c.Campaign__c = camp.Id;
        	insert c;
            
            RecordType rt2 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Non_Cultivist_Events' LIMIT 1];

        	Case c2 = new Case();
        	c2.AccountId = a.Id;
        	c2.RecordTypeId = rt2.Id;     
        	insert c2;
        
            RecordType rt3 = [SELECT Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Replacement_Cards' LIMIT 1];

        	Case c3 = new Case();
        	c3.AccountId = a.Id;
        	c3.RecordTypeId = rt3.Id;     
        	insert c3;
        
            CaseListView1Ctrl.getRelatedCases(a.Id);
            CaseListView2Ctrl.getRelatedCases(a.Id);
            CaseListView3Ctrl.getRelatedCases(a.Id);       
        test.stopTest();
    }
}