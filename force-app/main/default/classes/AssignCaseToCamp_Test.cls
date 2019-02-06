@isTest(seeAllData=false)
public class AssignCaseToCamp_Test {
    public static testmethod void test1(){
        list<case> lstCase= new list <case>();
        recordtype ac= [select id from recordtype where developerName='HR_Contact' and sObjecttype='Account' ];
        recordtype rt= [select id from recordtype where developerName='Contact_us' and sObjecttype='case' ];
        account acc= new account(recordtypeID=ac.id, lastName='test');
        insert acc;
        account temAccount=[select ID, PersonContactId from Account];
        for(integer i=0; i<10; i++){
            case temp = new case();
            temp.Status='Working';
            temp.ContactId=temAccount.PersonContactId;
            temp.Origin='web'; 
            temp.CurrencyIsoCode='USD';
            lstCase.add(temp);
        }
        insert lstCase;
        
        list<Campaign> lstCamp= new list <Campaign>();
        for(integer i=0; i<3; i++){
            Campaign tempcamp = new Campaign();
            tempcamp.Name='test'+i;
            tempcamp.Status='Planned';
            tempcamp.CurrencyIsoCode='USD';
            tempcamp.IsActive=True;
            lstCamp.add(tempcamp);
        }
        insert lstCamp;
        
       		case c2 = new case();
            c2.Status='Working';
            c2.ContactId=temAccount.PersonContactId;
            c2.Origin='web'; 
            c2.CurrencyIsoCode='USD';
        c2.Campaign_Member_Opt_Out__c= true;
 insert c2;
                   
        string s;
        for(case c:[select id from case]){
            if(s=='' || s==null){
                s=c.id;
            }
            else{
                s=s+','+c.id;
            }
        }
        system.debug('s'+s);
        
        campaign cTemp=[select ID from campaign Limit 1];
        PageReference myVfPage = Page.AssignCaseToCampaign;
        Test.setCurrentPage(myVfPage);
        
        // Put Id into the current page Parameters
        ApexPages.currentPage().getParameters().put('recs',s);
        AssignCaseTOcamp_Controller controller =new AssignCaseTOcamp_Controller();
        controller.idSelectedCam=cTemp.Id;
        controller.strsearchString='test';
        test.startTest();
        controller.SearchCamp();
        controller.updateCases();
        test.stopTest();
        system.assertEquals(3, controller.lstCamp.size());
    }
}