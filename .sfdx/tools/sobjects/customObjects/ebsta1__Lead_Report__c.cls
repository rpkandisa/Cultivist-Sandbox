// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ebsta1__Lead_Report__c {
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
    global List<ContentDistribution> RelatedRecord;
    global Datetime SystemModstamp;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Double ebsta1__Ebsta_Score_Trend_Last_30_Days__c;
    global Double ebsta1__Ebsta_Score_Trend_Last_7_Days__c;
    global Double ebsta1__Ebsta_Score_Trend_Last_90_Days__c;
    global Double ebsta1__Ebsta_Score__c;
    global String ebsta1__ExternalId__c;
    global Datetime ebsta1__Last_Email_Received__c;
    global Datetime ebsta1__Last_Email_Sent__c;
    global Double ebsta1__Last_Month_Emails_Exchanged_Inbound__c;
    global Double ebsta1__Last_Month_Emails_Exchanged_Outbound__c;
    global Double ebsta1__Last_Week_Emails_Exchanged_Inbound__c;
    global Double ebsta1__Last_Week_Emails_Exchanged_Outbound__c;
    global Id ebsta1__Lead__c;
    global Lead ebsta1__Lead__r;
    global Double ebsta1__Total_Emails_Exchanged_Inbound__c;
    global Double ebsta1__Total_Emails_Exchanged_Outbound__c;

    global ebsta1__Lead_Report__c () 
    {
    }
}