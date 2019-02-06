global class SchedulerForAccountBatch implements Schedulable {
	global void execute(SchedulableContext ctx) 
    {
        UpdateLast3MonthsAccount_Batch batch=new UpdateLast3MonthsAccount_Batch();
        database.executebatch(batch);
    }
}