@isTest(seeAllData=false)
public class ChangeRecordType_Test {
	
    public static testmethod void testm1(){
        list <case> cc= new list<case>();
        case c= new case(Status='Working', Origin='web', CurrencyIsoCode='USD');
        cc.add(c);
        insert cc;
		PageReference pageRef = Page.ChangeRecordType;
        Test.setCurrentPage(pageRef);
        ApexPages.StandardSetController sc = new ApexPages.StandardSetController(cc);
    	ChangeRecordType_Controller rec = new ChangeRecordType_Controller(sc);
        rec.getItems();
        rec.updateCases();
    }
}