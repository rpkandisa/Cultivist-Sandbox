// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Time_Log__c {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global Boolean Billable__c;
    global List<CombinedAttachment> CombinedAttachments;
    global Id Completed_By__c;
    global User Completed_By__r;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String CurrencyIsoCode;
    global Date Date_Completed__c;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global Double Duration_hrs__c;
    global List<EmailMessage> Emails;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<Time_Log__Feed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<Time_Log__History> Histories;
    global Decimal Hourly_Rate__c;
    global Id Id;
    global String Internal_Description__c;
    global Boolean Invoiced__c;
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
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global Id Phase__c;
    global Phase__c Phase__r;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global Id Project__c;
    global Project__c Project__r;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<FlowRecordRelation> RelatedRecord;
    global String Short_Description__c;
    global Datetime SystemModstamp;
    global List<TopicAssignment> TopicAssignments;
    global Decimal Total_Cost__c;
    global List<AgentWork> WorkItem;
    global String Work_Type__c;

    global Time_Log__c () 
    {
    }
}