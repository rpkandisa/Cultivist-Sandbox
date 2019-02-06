@isTest
public class TermOfUSEControllerTest {

    @isTest
    static void test(){
        TermOfUSEController TOU = new TermOfUSEController();
        TOU.termID = TOU.termList[0].id;
        TOU.messangeUser = 'qqqq';
        TOU.mail = 'qqq@mail.ru';
        TOU.name = 'name';
        TOU.getTerm();
        TOU.changeTerm();
        TOU.sendMsg();
        AplicationHeaderController ahc = new AplicationHeaderController();
        AplicationHeaderController ahcterm = new AplicationHeaderController(TOU);
        PageReference page = new PageReference(Url.getSalesforceBaseUrl().toExternalForm()+'?mandarin=true');
		Test.setCurrentPage(page);
        AplicationHeaderController ahcMandarin = new AplicationHeaderController();
        AplicationHeaderController ahctermMandarin = new AplicationHeaderController(TOU);
    }
}