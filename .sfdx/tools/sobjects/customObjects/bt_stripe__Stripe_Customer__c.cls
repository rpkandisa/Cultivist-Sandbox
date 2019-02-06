// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class bt_stripe__Stripe_Customer__c {
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
    global List<bt_stripe__Stripe_Customer__History> Histories;
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
    global Id bt_stripe__Account__c;
    global Account bt_stripe__Account__r;
    global Id bt_stripe__Contact__c;
    global Contact bt_stripe__Contact__r;
    global Datetime bt_stripe__Created_Date__c;
    global String bt_stripe__Customer_Id__c;
    global String bt_stripe__Default_Source_Id__c;
    global Id bt_stripe__Default_Source__c;
    global bt_stripe__Payment_Method__c bt_stripe__Default_Source__r;
    global Boolean bt_stripe__Deleted_From_Stripe__c;
    global String bt_stripe__Description__c;
    global String bt_stripe__Email__c;
    global Id bt_stripe__Payment_Gateway__c;
    global bt_stripe__Payment_Gateway__c bt_stripe__Payment_Gateway__r;
    global List<bt_stripe__Payment_Method__c> bt_stripe__Payment_Methods__r;
    global Boolean bt_stripe__Remove_from_Stripe__c;
    global String bt_stripe__Stripe_Customer_Name__c;
    global List<bt_stripe__Transaction__c> bt_stripe__Transactions__r;
    global List<bt_stripe__Webhook_Event__c> bt_stripe__Webhook_Events__r;

    global bt_stripe__Stripe_Customer__c () 
    {
    }
}