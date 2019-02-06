@isTest
public class TestTaskTrigger {
    
    static testmethod void InsertingRecords() {
         
         Account A = new Account();
         A.LastName = 'Test';
         A.RecordTypeId = '012410000005Lx1';
         insert A;
         
         Case C = new Case();
         C.Status = 'Working';
         C.Origin = 'Web';
         C.RecordTypeId = '01241000000Lyom';
         C.ContactId = A.PersonContact.Id;
         C.AccountId = A.Id;
         insert C;
         
         Task T1 = new Task();
         T1.Subject = 'Email';
         T1.WhatId = C.Id;
         T1.OwnerId = UserInfo.GetUserId();
         T1.Status = 'Not Started';
         T1.Priority = 'Normal';
         insert T1;
         
         Datetime pickedDate = Datetime.now().addDays(-3);
         Test.setCreatedDate(T1.Id, pickedDate);
         
         Task T2 = new Task();
         T2.Subject = 'Email';
         T2.WhatId = C.Id;
         T2.OwnerId = UserInfo.GetUserId();
         T2.Status = 'Not Started';
         T2.Priority = 'Normal';
         insert T2;
         
         Task T3 = new Task();
         T3.Subject = 'Email';
         T3.WhatId = C.Id;
         T3.OwnerId = UserInfo.GetUserId();
         T3.Status = 'Not Started';
         T3.Priority = 'Normal';
         insert T3;
    }
}