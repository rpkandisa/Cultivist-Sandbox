// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class bt_stripe__Stripe_Settings__c {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String CurrencyIsoCode;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global List<EmailMessage> Emails;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global Id Id;
    global Boolean IsDeleted;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<FlowRecordRelation> RelatedRecord;
    global SObject SetupOwner;
    global Id SetupOwnerId;
    global Datetime SystemModstamp;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Boolean bt_stripe__Auto_Capture_Only_Transactions_Due_Today__c;
    global Double bt_stripe__Auto_Charge_Batch_Size__c;
    global String bt_stripe__Charge_Receipt_Template_Id__c;
    global Boolean bt_stripe__Disable_All_Triggers__c;
    global Boolean bt_stripe__Disable_Balance_Validation__c;
    global Boolean bt_stripe__Disable_Charge_Receipt_Default__c;
    global Boolean bt_stripe__Disable_FLS__c;
    global Boolean bt_stripe__Disable_PSchedule_Compile__c;
    global Boolean bt_stripe__Disable_PSchedule_Generate__c;
    global Boolean bt_stripe__Disable_PSchedule_UpdatePM__c;
    global Boolean bt_stripe__Disable_PaymentMethod_CleanOnClone__c;
    global Boolean bt_stripe__Disable_PaymentMethod_Delete__c;
    global Boolean bt_stripe__Disable_PaymentMethod_RUPContactToCust__c;
    global Boolean bt_stripe__Disable_PaymentMethod_SetDefaultGateway__c;
    global Boolean bt_stripe__Disable_PaymentMethod_ValidateOnInsert__c;
    global Boolean bt_stripe__Disable_PaymentMethod_Validate__c;
    global Boolean bt_stripe__Disable_RolldownParentToTra__c;
    global Boolean bt_stripe__Disable_StripeCustomer_Delete__c;
    global Boolean bt_stripe__Disable_StripeCustomer_PreventDelete__c;
    global Boolean bt_stripe__Disable_StripeCustomer_RolldownContactTo__c;
    global Boolean bt_stripe__Disable_StripeCustomer_Upsert__c;
    global Boolean bt_stripe__Disable_Stripe_Support_Currency__c;
    global Boolean bt_stripe__Disable_Trans_Rollup_To_Parent__c;
    global Boolean bt_stripe__Disable_Transaction_Charge__c;
    global Boolean bt_stripe__Disable_Transaction_CleanOnClone__c;
    global Boolean bt_stripe__Disable_Transaction_PaidOnNonStripe__c;
    global Boolean bt_stripe__Disable_Transaction_RollupRefunds__c;
    global Boolean bt_stripe__Disable_Transaction_RollupToPM__c;
    global Boolean bt_stripe__Disable_Transaction_RollupToSchedule__c;
    global Boolean bt_stripe__Disable_Transaction_RoundOnInsert__c;
    global Boolean bt_stripe__Disable_Transaction_TriggerDeclarative__c;
    global Boolean bt_stripe__Disable_Transaction_ValidateRules__c;
    global Boolean bt_stripe__Disable_TransferGroupIDValidation__c;
    global Boolean bt_stripe__Disable_Update_PM_Related_Transaction__c;
    global Boolean bt_stripe__Disable_Update_PS_Account_Contact__c;
    global String bt_stripe__Enable_ACH__c;
    global String bt_stripe__Enable_Non_Stripe__c;
    global String bt_stripe__Enable_p360_All__c;
    global Boolean bt_stripe__EndpointConfigured__c;
    global String bt_stripe__Failed_Trans_Not_Template_Id__c;
    global String bt_stripe__Origin_Host_LEX__c;
    global String bt_stripe__Origin_Host_VF__c;
    global Boolean bt_stripe__Personal_ID_Number_Encrypted__c;
    global Double bt_stripe__Record_Sync_List_Size__c;
    global String bt_stripe__Refund_Receipt_Template_Id__c;
    global String bt_stripe__Related_To_Priority_Order__c;
    global Double bt_stripe__Retain_Webhook_Records_for_Days__c;
    global Boolean bt_stripe__SSN_Last_4_Encrypted__c;
    global Boolean bt_stripe__Send_Notification_On_Failed_Transaction__c;
    global Boolean bt_stripe__Send_Receipt_On_Refund__c;
    global String bt_stripe__Support_Plan__c;

    global bt_stripe__Stripe_Settings__c () 
    {
    }
}