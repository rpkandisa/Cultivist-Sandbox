@isTest(seeAllData=false)
public class UpdateLast3MonthsAccount_Test {
    public static testmethod void testmethod1() {
        Account[] ml = new List<Account>();
        for (Integer i=0;i<3;i++) {
            Account m = new Account(
                Name='Test Account ' + i);
            ml.add(m);
        }
        insert ml;
        RecordType rt = [SELECT Id, Name FROM RecordType WHERE SobjectType='Case' AND developerName='Redemption'  LIMIT 1];
        case[] cc = new List<case>();
        for(Account objAcc:ml){
            for (Integer i=0;i<5;i++) {
                case c = new case(
                    AccountID=objAcc.ID, Status='Request Received', Origin='Website Portal', CurrencyIsoCode='USD', recordtypeID=rt.ID);
                cc.add(c);
            }
        }
        insert cc;
        
        test.startTest();
        //UpdateLast3MonthsAccount_Batch batch = new UpdateLast3MonthsAccount_Batch();
		//Database.executeBatch(batch);
		SchedulerForAccountBatch batchSch=new SchedulerForAccountBatch();
        String sch='0 5 * * * ?';
        //System.schedule(String jobName, String cronExp, APEX_OBJECT schedulable);
        System.schedule('Batch Schedule', sch , batchSch);
        test.stopTest();
    }
}