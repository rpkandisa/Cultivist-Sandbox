// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class bt_stripe__Dispute_Evidence__c {
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
    global List<bt_stripe__Dispute_Evidence__History> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global RecordType RecordType;
    global Id RecordTypeId;
    global List<ContentDistribution> RelatedRecord;
    global Datetime SystemModstamp;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global String bt_stripe__Access_Activity_Log__c;
    global String bt_stripe__Additional_File_ID__c;
    global String bt_stripe__Additional_Information__c;
    global String bt_stripe__Billing_Address__c;
    global String bt_stripe__Cancellation_Policy_Disclosure__c;
    global String bt_stripe__Cancellation_Policy_ID__c;
    global String bt_stripe__Cancellation_Rebuttal__c;
    global String bt_stripe__Customer_Communication_ID__c;
    global String bt_stripe__Customer_Email_Address__c;
    global String bt_stripe__Customer_Name__c;
    global String bt_stripe__Customer_Purchase_IP__c;
    global String bt_stripe__Customer_Signature_ID__c;
    global Id bt_stripe__Dispute__c;
    global bt_stripe__Dispute__c bt_stripe__Dispute__r;
    global String bt_stripe__Duplicate_Charge_Documentation_ID__c;
    global String bt_stripe__Duplicate_Charge_Explanation__c;
    global String bt_stripe__Duplicate_Charge_ID__c;
    global String bt_stripe__Error_Code__c;
    global String bt_stripe__Error_Message__c;
    global String bt_stripe__Error_Type__c;
    global String bt_stripe__Product_Description__c;
    global String bt_stripe__Receipt_ID__c;
    global String bt_stripe__Refund_Policy_Disclosure__c;
    global String bt_stripe__Refund_Policy_ID__c;
    global String bt_stripe__Refund_Refusal_Explanation__c;
    global Date bt_stripe__Service_Date__c;
    global String bt_stripe__Service_Documentation_ID__c;
    global String bt_stripe__Shipping_Address__c;
    global String bt_stripe__Shipping_Carrier__c;
    global Date bt_stripe__Shipping_Date__c;
    global String bt_stripe__Shipping_Documentation_ID__c;
    global String bt_stripe__Shipping_Tracking_Number__c;
    global Boolean bt_stripe__Submit__c;

    global bt_stripe__Dispute_Evidence__c () 
    {
    }
}