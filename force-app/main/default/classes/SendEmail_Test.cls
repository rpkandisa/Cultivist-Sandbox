@isTest(seeAllData=false)
public class SendEmail_Test {
    public static testmethod void testm1(){
        list <Account> cc= new list<Account>();
        recordtype r=[select ID from recordtype where developername='HR_Contact'];
        Account c= new Account(lastname='test', recordtypeID=r.ID, PersonEmail='test@test.com');
        cc.add(c);
        insert cc;
        
		PageReference pageRef = Page.SendMassEmail;
        Test.setCurrentPage(pageRef);
        
        ApexPages.StandardSetController sc = new ApexPages.StandardSetController(cc);
        sc.setSelected(cc);
    	SendEmail_Controller rec = new SendEmail_Controller(sc);
        rec.getItems();
        rec.sendEmail();
    }

}