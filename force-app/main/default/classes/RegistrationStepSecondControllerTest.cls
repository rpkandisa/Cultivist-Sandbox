@isTest
public class RegistrationStepSecondControllerTest{

	static testMethod void validateSecondStep(){

        Lead lead = new Lead();
        lead.LastName = 'lastName';
        lead.FirstName = 'first name';
        lead.Country = 'United Kingdom';
        lead.Secondary_Mailing_Country__c = 'UK';
        lead.Street = 'street';
        lead.PostalCode = 'postalCode';
        lead.Email = 'grushai.sergii@gmail.com';
        lead.Phone = '32151235';
        lead.City = 'City';
        insert lead;
        PageReference pageerror = new PageReference(Url.getSalesforceBaseUrl().toExternalForm()+'?leadId=ddd');
		Test.setCurrentPage(pageerror);
       	RegistrationStepSecondController rss = new RegistrationStepSecondController();
        rss.doredirect();
        
        PageReference page = new PageReference(Url.getSalesforceBaseUrl().toExternalForm()+'?leadId='+lead.id);
		Test.setCurrentPage(page);
        rss.doredirect();
        rss.contentType = 'img';
        rss.filesize = '23';
        rss.cardName = 'nnndd';
        rss.cardNumber = '4242';
        rss.expiryMonth  = '12';
        rss.expiryYears  = '1000';
        rss.billingAdress = 'address';
        rss.City = 'sity';
        rss.stateCode = 'AL';
        rss.PostalCode = '1234';
        rss.CVC  = '2345';
        rss.Street = 'street';
        rss.CountryCode = 'US';
        rss.fileblob = Blob.valueof('myString');
        rss.filename = 'qq';
        rss.CreatePaymentMethods();
        rss.expiryYears  = '2020';
        rss.fileblob = EncodingUtil.base64Decode('test');
        rss.filename = 'test';
        rss.CreatePaymentMethods();
        rss.commandLinkActionTrue();
        rss.CreatePaymentMethods();
        rss.savePaymenMetod();
        rss.commandLinkActionFalse();
        rss.getBlob();
    }
}