@isTest(SeeAllData=true)
private class TestCaseTrigger {
    
    static testmethod void InsertingRecords() {
         Account A = new Account();
         A.LastName = 'Test';
         A.RecordTypeId = '012410000005Lx1';
         insert A;
         
         Account B = new Account();
         B.LastName = 'Test2';
         B.RecordTypeId = '012410000005Lx1';
         insert B;
         
         Case C = new Case();
         C.Status = 'Working';
         C.Origin = 'Web';
         C.RecordTypeId = '01241000000Lyom';
         C.ContactId = A.PersonContact.Id;
         C.AccountId = A.Id;
         insert C;
         
         Case C2 = new Case();
         C2.Status = 'Working';
         C2.Origin = 'Web';
         C2.RecordTypeId = '01241000000Lyom';
         C2.ContactId = A.PersonContact.Id;
         C2.AccountId = A.Id;
         insert C2;
         
         C2.Description = 'Blank';
         C2.ContactId = B.PersonContact.Id;
         update C2;
         
         delete C2;
    }
}