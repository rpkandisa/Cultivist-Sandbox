trigger AccountTrigger on Account (after insert,after update) {
    if(trigger.isAfter &&  trigger.isUpdate){
        AccountTriggerAPIHandler.APICallout(trigger.new, trigger.oldMap, trigger.isInsert); // this trigger only run for after inser/update
    }
}