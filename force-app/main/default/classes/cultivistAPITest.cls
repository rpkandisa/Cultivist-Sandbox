//created by Kandisa technologies on 05/02/2019
@isTest
private class cultivistAPITest {
    static testMethod void fnApiCalloutValidate() {

        cultivistAPICalloutMock.strResponseBody = '{"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9zc2Ntcy5sb2NcL2FwaVwvc2FsZXNmb3JjZVwvbG9naW4iLCJpYXQiOjE1NDgwODA0MzMsImV4cCI6MTU0ODA4NDAzMywibmJmIjoxNTQ4MDgwNDMzLCJqdGkiOiJiQ25YbDhzWTFDSjluREpZIiwic3ViIjoxLCJwcnYiOiIxOTI0YzFhOWQ3NjJmYjc4ZmFhZmZjYzJhOTkyYjEyMGNlMDVhZDhkIn0.ngC0OwPDGKSMoHkU_XSrwz9iBQmIoL1hB4iVCDz9v7o","token_type": "bearer","expires_in": 3600}';
        Test.setMock(HttpCalloutMock.class, new cultivistAPICalloutMock());
        cultivistAPI.setToken();

        cultivistAPICalloutMock.strResponseBody = '{"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9zc2Ntcy5sb2NcL2FwaVwvc2FsZXNmb3JjZVwvbG9naW4iLCJpYXQiOjE1NDgwODA0MzMsImV4cCI6MTU0ODA4NDAzMywibmJmIjoxNTQ4MDgwNDMzLCJqdGkiOiJiQ25YbDhzWTFDSjluREpZIiwic3ViIjoxLCJwcnYiOiIxOTI0YzFhOWQ3NjJmYjc4ZmFhZmZjYzJhOTkyYjEyMGNlMDVhZDhkIn0.ngC0OwPDGKSMoHkU_XSrwz9iBQmIoL1hB4iVCDz9v7o","token_type": "bearer","expires_in": 3600}';
        Test.setMock(HttpCalloutMock.class, new cultivistAPICalloutMock());
        cultivistAPI.refreshtoken();

        Contact con = new Contact(LastName = 'conlast');
        insert con;

        Campaign cam = new Campaign(Name='Test Campaign', IsActive = true);
        insert cam;        

        Id objectRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Art Fair - Basel, Fiac, Frieze').getRecordTypeId();
        Case c = new Case();
        c.RecordTypeId = objectRecordTypeId;
        c.Service_Date__c = System.today();
        c.Campaign__c = cam.Id;
        c.Total_Guest_Count__c = 1;
        c.Status = 'Request cancelled by Member';
        c.ContactId = con.Id;
        c.Campaign_Member_Opt_Out__c = false;
        insert c;        
        
        Test.startTest(); 

        //Case objCase = [select id,Service_Date__c,CaseNumber,Campaign__c,CreatedDate,Total_Guest_Count__c,Status,RecordType.Name from Case where Id=: c.Id limit 1];

        cultivistAPICalloutMock.strResponseBody = '{"success":true,"data":{"ticketRequest":{"id":3,"user_id":2,"ticket_request_type_id":1,"start_date":"2019-01-30 11:47:00","end_date":"2019-01-13 00:00:00","quantity":1,"user_notes":"Some user requirements","status":2,"created_at":"2019-01-08 13:54:17","updated_at":"2019-01-18 11:00:39","status_for_human":"Cancelled by Member"}},"error":null}';
        Test.setMock(HttpCalloutMock.class, new cultivistAPICalloutMock());
        // cultivistAPI.booking(objCase);
        c.Status = 'Member has confirmed receipt of their pass';
        c.Campaign_Member_Opt_Out__c = true;
        update c;

        Test.stopTest();  
    }

     static testMethod void fnApiCalloutforUserValidate() {

        cultivistAPICalloutMock.strResponseBody = '{"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9zc2Ntcy5sb2NcL2FwaVwvc2FsZXNmb3JjZVwvbG9naW4iLCJpYXQiOjE1NDgwODA0MzMsImV4cCI6MTU0ODA4NDAzMywibmJmIjoxNTQ4MDgwNDMzLCJqdGkiOiJiQ25YbDhzWTFDSjluREpZIiwic3ViIjoxLCJwcnYiOiIxOTI0YzFhOWQ3NjJmYjc4ZmFhZmZjYzJhOTkyYjEyMGNlMDVhZDhkIn0.ngC0OwPDGKSMoHkU_XSrwz9iBQmIoL1hB4iVCDz9v7o","token_type": "bearer","expires_in": 3600}';
        Test.setMock(HttpCalloutMock.class, new cultivistAPICalloutMock());
        cultivistAPI.setToken();

        cultivistAPICalloutMock.strResponseBody = '{"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9zc2Ntcy5sb2NcL2FwaVwvc2FsZXNmb3JjZVwvbG9naW4iLCJpYXQiOjE1NDgwODA0MzMsImV4cCI6MTU0ODA4NDAzMywibmJmIjoxNTQ4MDgwNDMzLCJqdGkiOiJiQ25YbDhzWTFDSjluREpZIiwic3ViIjoxLCJwcnYiOiIxOTI0YzFhOWQ3NjJmYjc4ZmFhZmZjYzJhOTkyYjEyMGNlMDVhZDhkIn0.ngC0OwPDGKSMoHkU_XSrwz9iBQmIoL1hB4iVCDz9v7o","token_type": "bearer","expires_in": 3600}';
        Test.setMock(HttpCalloutMock.class, new cultivistAPICalloutMock());
        cultivistAPI.refreshtoken();

        
        Id RecTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Member').getRecordTypeId();

        Account Accnt = new Account(
            RecordTypeID=RecTypeId,
            Profile_Picture__c='https://www.dropbox.com/s/7fmyepr5m6s21j6/imgpsh_fullsize.png',
            Phone = '+380681884229',
            Member_Since__c=System.today(),
            Membership_Expiry_date__c = System.today(),
            Card_Valid_Through_Date__c = System.today().addYears(5),
            FirstName='Test FName',
            LastName='Test LName',
            PersonMailingStreet='test@yahoo.com',
            PersonMailingPostalCode='12345',
            PersonMailingCity='SFO',
            PersonMailingState='CA',
            PersonMailingCountry='US',
            PersonEmail='test@yahoo.com',
            PersonHomePhone='1234567',
            PersonMobilePhone='12345678',
            OwnerId = System.UserInfo.getUserId()
        );
        insert Accnt;
        
        Test.startTest(); 

        //Account objUser = [select id,Name,PersonEmail,Profile_Picture__c,Phone,Membership_Type__c,Member_Since__c,Membership_Expiry_date__c,Card_Valid_Through_Date__c,PersonMailingStreet,PersonMailingCity,PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,Owner.Name,Owner.Email,Owner.Phone,Owner.FullPhotoUrl from Account where Id=: Accnt.Id limit 1];

        cultivistAPICalloutMock.strResponseBody = '{"success": true,"data": {"user": {"id": 1,"name": "John Smith","email": "test@test.com","created_at": "2019-01-21 09:15:51","updated_at": "2019-01-21 14:17:26","profile_picture_url": "https://www.dropbox.com/s/7fmyepr5m6s21j6/imgpsh_fullsize.png","phone": "+380681884229","liaison_id": 2,"membership": {"id": 1,"type": 0,"member_since": "2019-01-01 12:00:00","expiry_date": "2019-06-01 12:00:00","card_expiry": "2019-05-01 12:00:00","user_id": 1},"address": {"id": 1,"user_id": 1,"address_line_1": "Address line number 1","address_line_2": "Address line number 2","city": "City name","state": "State name","postal_code": "123456","country": "Fictional Country"},"liaison": {"id": 2,"name": "Dedicated Liais1","email": "Liaison@thecultivist.com","phone": "0044330 390 2109","photo_url": "https://www.dropbox.com/s/twr9k1l8b208pre/08164050r.jpg","updated_at": "2019-01-21 14:20:45"}}},"error": null}';
        Test.setMock(HttpCalloutMock.class, new cultivistAPICalloutMock());
        //cultivistAPI.user(objUser);

        Accnt.PersonMailingPostalCode='13223';
        update Accnt;

        Test.stopTest();  
    }
}