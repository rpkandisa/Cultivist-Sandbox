@isTest
public class FinishControllerTest {

    @isTest
    static void payTest(){
       
        bt_stripe__Payment_Gateway__c PG = new bt_stripe__Payment_Gateway__c();
        PG.bt_stripe__Stripe_User_Id__c = 'acct_1C8lqNKnSeakPpP9';
        insert PG;
       	
        bt_stripe__Payment_Method__c paymentMetod = new bt_stripe__Payment_Method__c ();
        paymentMetod.bt_stripe__Billing_Country__c = 'Ukraine';
        paymentMetod.bt_stripe__Payment_Gateway__c = PG.id;
        paymentMetod.bt_stripe__Payment_Method_Status__c = 'Valid';
        paymentMetod.bt_stripe__Card_Holder_Name__c = 'name';
        paymentMetod.bt_stripe__Card_Number__c = '4242424242424242';
        paymentMetod.bt_stripe__Card_Expiration_Month__c = '5';
        paymentMetod.bt_stripe__CVV__c = '555';
        paymentMetod.bt_stripe__Billing_Postal_Code__c = '1234';
        insert paymentMetod;
		paymentMetod.bt_stripe__Payment_Method_Status__c = 'Valid';
        upsert paymentMetod;
        Lead lead = new Lead();
        lead.LastName = 'lastName';
        lead.FirstName = 'first name';
        lead.Country = 'UK';
        lead.Street = 'street';
        lead.PostalCode = 'postalCode';
        lead.Email = 'grushai.sergii@gmail.com';
        lead.Phone = '32151235';
        lead.City = 'City';
        insert lead;
        
        

        FinishController FCR  = new FinishController();
        FCR.doredirect();
        String script = FCR.script;
        FCR.finish = true;
        FCR.action(); 
        
        PageReference pageMandarin = new PageReference(Url.getSalesforceBaseUrl().toExternalForm()+'?mandarin=true');
        Test.setCurrentPage(pageMandarin);
        boolean m = FCR.isMandarin;
        
        PageReference page = new PageReference(Url.getSalesforceBaseUrl().toExternalForm()+'?paymentMetodId='+paymentMetod.id+'&LeadId='+lead.id);
		Test.setCurrentPage(page);
        
		FCR.doredirect();
        FCR.returnError(false);
        FCR.returnError(true);
        FCR.error = 'test';
        FCR.returnError(true);
        FCR.action(); 
        FCR.action(); 
        FCR.convertLead();
        
        PageReference pageerr = new PageReference(Url.getSalesforceBaseUrl().toExternalForm()+'?paymentMetodId='+paymentMetod.id+'ds'+'&LeadId='+lead.id);
		Test.setCurrentPage(pageerr);
        FCR.doredirect();
        
        FCR.action();
		
        PageReference pageerror = new PageReference(Url.getSalesforceBaseUrl().toExternalForm()+'?doubleTransact=true');
		Test.setCurrentPage(pageerror);
        FCR.isMandarin = true;
        FCR.doredirect();
        FCR.count = 10;
        FCR.action();
        
        
        script = FCR.script;
    }
}