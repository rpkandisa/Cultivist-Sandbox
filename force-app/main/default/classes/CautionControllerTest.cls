@isTest
public class CautionControllerTest {

    @isTest
    static void Test(){
        bt_stripe__Payment_Gateway__c PG = new bt_stripe__Payment_Gateway__c();
        PG.bt_stripe__Stripe_User_Id__c = 'acct_1C8lqNKnSeakPpP9';
        
        insert PG;

        bt_stripe__Payment_Method__c paymentMetod = new bt_stripe__Payment_Method__c ();
        paymentMetod.bt_stripe__Billing_Country__c = 'UA';
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
        lead.Country = 'GB';
        lead.Street = 'street';
        lead.PostalCode = 'postalCode';
        lead.Email = 'grushai.sergii@gmail.com';
        lead.Phone = '32151235';
        lead.City = 'City';
        insert lead;
        PageReference pageerr = new PageReference(Url.getSalesforceBaseUrl().toExternalForm()+'?paymentMetodId='+paymentMetod.id+'&LeadId='+lead.id);
		Test.setCurrentPage(pageerr);
        CautionController CC = new CautionController();
        CC.action();
        CC.error = 'TEST';
        
        
    }
}