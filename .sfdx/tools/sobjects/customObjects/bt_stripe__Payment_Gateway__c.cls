// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class bt_stripe__Payment_Gateway__c {
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
    global List<bt_stripe__Payment_Gateway__History> Histories;
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
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<ContentDistribution> RelatedRecord;
    global Datetime SystemModstamp;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Double bt_stripe__ACH_Amount__c;
    global Double bt_stripe__ACH_Cap__c;
    global Double bt_stripe__ACH_Percentage__c;
    global Boolean bt_stripe__Active__c;
    global Double bt_stripe__Amex_Amount__c;
    global Double bt_stripe__Amex_Percentage__c;
    global Boolean bt_stripe__Balances_incorrect__c;
    global Double bt_stripe__Blended_Amount__c;
    global Double bt_stripe__Blended_Percentage__c;
    global Date bt_stripe__Calculate_Salesforce_Balances_From__c;
    global Id bt_stripe__Company__c;
    global bt_stripe__Company__c bt_stripe__Company__r;
    global List<bt_stripe__Connected_Account__c> bt_stripe__Connect_Accounts__r;
    global List<Contact> bt_stripe__Contacts__r;
    global String bt_stripe__Default_Currency__c;
    global Boolean bt_stripe__Default__c;
    global Double bt_stripe__Discover_Amount__c;
    global Double bt_stripe__Discover_Percentage__c;
    global List<bt_stripe__Dispute__c> bt_stripe__Disputes__r;
    global String bt_stripe__Error_Message__c;
    global String bt_stripe__Error_Type__c;
    global Double bt_stripe__Held_in_Reserve__c;
    global String bt_stripe__Logo_URL__c;
    global Double bt_stripe__Mastercard_Amount__c;
    global Double bt_stripe__Mastercard_Percentage__c;
    global Double bt_stripe__Other_Amount__c;
    global Double bt_stripe__Other_Percentage__c;
    global List<bt_stripe__Payment_Method__c> bt_stripe__Payment_Methods__r;
    global String bt_stripe__Plaid_Public_Key__c;
    global String bt_stripe__Plaid_Secret__c;
    global String bt_stripe__Plaid_User_Id__c;
    global Double bt_stripe__Salesforce_Balance_Available__c;
    global Double bt_stripe__Salesforce_Balance_Pending__c;
    global Datetime bt_stripe__Salesforce_Balances_Last_Updated__c;
    global String bt_stripe__Stripe_Access_Token__c;
    global String bt_stripe__Stripe_Account_Country__c;
    global Double bt_stripe__Stripe_Balance_Available__c;
    global Double bt_stripe__Stripe_Balance_Pending__c;
    global Datetime bt_stripe__Stripe_Balances_Last_Updated__c;
    global List<bt_stripe__Stripe_Customer__c> bt_stripe__Stripe_Customers__r;
    global String bt_stripe__Stripe_Publishable_Key__c;
    global String bt_stripe__Stripe_Refresh_Token__c;
    global String bt_stripe__Stripe_User_Email__c;
    global String bt_stripe__Stripe_User_Id__c;
    global Boolean bt_stripe__Test_Mode__c;
    global List<bt_stripe__Transaction__c> bt_stripe__Transactions__r;
    global Boolean bt_stripe__Update_Balance__c;
    global Double bt_stripe__Visa_Amount__c;
    global Double bt_stripe__Visa_Percentage__c;
    global List<bt_stripe__Webhook_Event__c> bt_stripe__Webhook_Events__r;
    global String bt_stripe__Webhook_Label__c;

    global bt_stripe__Payment_Gateway__c () 
    {
    }
}