// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class bt_stripe__Connected_Account__c {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
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
    global List<bt_stripe__Connected_Account__History> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<FlowRecordRelation> RelatedRecord;
    global Datetime SystemModstamp;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Id bt_stripe__Account__c;
    global Account bt_stripe__Account__r;
    global String bt_stripe__Automatic_Payout_Schedule_Interval__c;
    global Boolean bt_stripe__Automatic_Payouts_Enabled__c;
    global Double bt_stripe__Balance_Available__c;
    global Double bt_stripe__Balance_Pending__c;
    global Boolean bt_stripe__Balances_incorrect__c;
    global List<bt_stripe__Blackthorn_Log__c> bt_stripe__Blackthorn_Logs__r;
    global Boolean bt_stripe__Business_Tax_ID_Provided__c;
    global Boolean bt_stripe__Business_VAT_ID_Provided__c;
    global Boolean bt_stripe__Charges_Enabled__c;
    global String bt_stripe__Connect_Account_Type__c;
    global String bt_stripe__Connected_Account_ID__c;
    global List<bt_stripe__Connected_Account_Owner__c> bt_stripe__Connected_Account_Owner__r;
    global String bt_stripe__Country__c;
    global String bt_stripe__Currency_ISO_Default__c;
    global String bt_stripe__Day_of_the_Month__c;
    global String bt_stripe__Day_of_the_Week__c;
    global Boolean bt_stripe__Debit_Negative_Balances__c;
    global Boolean bt_stripe__Decline_Charge_On_AVS_Failure__c;
    global Boolean bt_stripe__Decline_Charge_On_CVV_Failure__c;
    global Boolean bt_stripe__Details_Submitted__c;
    global String bt_stripe__Entity_Type__c;
    global String bt_stripe__Error_Code__c;
    global String bt_stripe__Error_Message__c;
    global Date bt_stripe__Last_Payout__c;
    global Id bt_stripe__Legal_Entity__c;
    global bt_stripe__Company__c bt_stripe__Legal_Entity__r;
    global Date bt_stripe__Next_Payout__c;
    global Id bt_stripe__Payment_Gateway__c;
    global bt_stripe__Payment_Gateway__c bt_stripe__Payment_Gateway__r;
    global List<bt_stripe__Payment_Method__c> bt_stripe__Payment_Methods__r;
    global Double bt_stripe__Payout_Schedule_Delay_Days__c;
    global String bt_stripe__Payout_Statement_Descriptor__c;
    global Boolean bt_stripe__Personal_ID_Number_Provided__c;
    global String bt_stripe__Product_Description__c;
    global Boolean bt_stripe__SSN_Last_4_Provided__c;
    global Double bt_stripe__Salesforce_Balance_Available__c;
    global Double bt_stripe__Salesforce_Balance_Pending__c;
    global Datetime bt_stripe__Salesforce_Balances_Last_Updated__c;
    global String bt_stripe__Statement_Descriptor__c;
    global String bt_stripe__Stripe_Access_Token__c;
    global Datetime bt_stripe__Stripe_Balances_Last_Updated__c;
    global String bt_stripe__Stripe_Publishable_Key__c;
    global Boolean bt_stripe__Submit_to_Stripe__c;
    global Date bt_stripe__TOS_Acceptance_Date__c;
    global String bt_stripe__TOS_Acceptance_IP__c;
    global String bt_stripe__TOS_Acceptance_User_Agent__c;
    global List<bt_stripe__Transaction__c> bt_stripe__Transactions__r;
    global Boolean bt_stripe__Update_Balance__c;
    global String bt_stripe__Verification_Code__c;
    global String bt_stripe__Verification_Details__c;
    global String bt_stripe__Verification_Disabled_Reason__c;
    global String bt_stripe__Verification_Document_ID__c;
    global Date bt_stripe__Verification_Due_By__c;
    global String bt_stripe__Verification_Fields_Needed__c;
    global String bt_stripe__Verification_Status__c;
    global List<bt_stripe__Webhook_Event__c> bt_stripe__Webhook_Events__r;

    global bt_stripe__Connected_Account__c () 
    {
    }
}