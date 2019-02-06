// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class bt_stripe__Payment_Method__c {
    global List<ActivityHistory> ActivityHistories;
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
    global List<Event> Events;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global List<bt_stripe__Payment_Method__History> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Date LastActivityDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global RecordType RecordType;
    global Id RecordTypeId;
    global List<FlowRecordRelation> RelatedRecord;
    global Datetime SystemModstamp;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global String bt_stripe__Account_Holder_Type__c;
    global String bt_stripe__Account_Number__c;
    global Id bt_stripe__Account__c;
    global Account bt_stripe__Account__r;
    global String bt_stripe__Bank_Name__c;
    global String bt_stripe__Billing_City__c;
    global String bt_stripe__Billing_Country__c;
    global String bt_stripe__Billing_Email__c;
    global String bt_stripe__Billing_Postal_Code__c;
    global String bt_stripe__Billing_State__c;
    global String bt_stripe__Billing_Street__c;
    global List<bt_stripe__Blackthorn_Log__c> bt_stripe__Blackthorn_Logs__r;
    global String bt_stripe__Brand__c;
    global String bt_stripe__CVV_Check__c;
    global String bt_stripe__CVV__c;
    global String bt_stripe__Card_Expiration_Month__c;
    global String bt_stripe__Card_Expiration_Year__c;
    global String bt_stripe__Card_Holder_Name__c;
    global String bt_stripe__Card_Id__c;
    global String bt_stripe__Card_Last_4_Digit__c;
    global String bt_stripe__Card_Number__c;
    global Id bt_stripe__Connected_Account__c;
    global bt_stripe__Connected_Account__c bt_stripe__Connected_Account__r;
    global Id bt_stripe__Contact__c;
    global Contact bt_stripe__Contact__r;
    global List<Contact> bt_stripe__Contacts__r;
    global String bt_stripe__Country_ISO__c;
    global String bt_stripe__Currency_ISO__c;
    global String bt_stripe__Customer_Id__c;
    global Boolean bt_stripe__Default_Payment_Method__c;
    global Boolean bt_stripe__Default_Payout_Method__c;
    global String bt_stripe__Error_Code__c;
    global String bt_stripe__Error_Message__c;
    global String bt_stripe__Error_Param__c;
    global String bt_stripe__Error_Type__c;
    global Boolean bt_stripe__External_Account__c;
    global String bt_stripe__Fingerprint__c;
    global String bt_stripe__Funding__c;
    global Double bt_stripe__Micro_Deposit_One__c;
    global Double bt_stripe__Micro_Deposit_Two__c;
    global Id bt_stripe__Payment_Gateway__c;
    global bt_stripe__Payment_Gateway__c bt_stripe__Payment_Gateway__r;
    global String bt_stripe__Payment_Method_Status__c;
    global List<bt_stripe__Payment_Schedule__c> bt_stripe__Payment_Schedules__r;
    global String bt_stripe__Postal_Code_Check__c;
    global String bt_stripe__Response_Message__c;
    global String bt_stripe__Routing_Number__c;
    global String bt_stripe__Street_Check__c;
    global Id bt_stripe__Stripe_Customer__c;
    global bt_stripe__Stripe_Customer__c bt_stripe__Stripe_Customer__r;
    global List<bt_stripe__Stripe_Customer__c> bt_stripe__Stripe_Customers__r;
    global String bt_stripe__Stripe_Token__c;
    global Double bt_stripe__Total_Transaction_Count__c;
    global List<bt_stripe__Transaction__c> bt_stripe__Transactions__r;
    global List<bt_stripe__Webhook_Event__c> bt_stripe__Webhook_Events__r;

    global bt_stripe__Payment_Method__c () 
    {
    }
}