@isTest 
public class ErorPageControllerTest {
    
    @isTest
    static void test(){
        ErorPageController epc = new ErorPageController();
        epc.error = 'test';
        epc.LeadID = 'test';
        epc.redirectMainPage();
    }
}