// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class bt_stripe__Webhook_Event__c {
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
    global List<ContentDistribution> RelatedRecord;
    global Datetime SystemModstamp;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Id bt_stripe__Connected_Account__c;
    global bt_stripe__Connected_Account__c bt_stripe__Connected_Account__r;
    global Datetime bt_stripe__Created__c;
    global String bt_stripe__Data__c;
    global String bt_stripe__Event_ID__c;
    global Double bt_stripe__Index__c;
    global Boolean bt_stripe__Livemode__c;
    global Id bt_stripe__Payment_Gateway__c;
    global bt_stripe__Payment_Gateway__c bt_stripe__Payment_Gateway__r;
    global Id bt_stripe__Payment_Method__c;
    global bt_stripe__Payment_Method__c bt_stripe__Payment_Method__r;
    global Boolean bt_stripe__Processed__c;
    global String bt_stripe__Request__c;
    global Id bt_stripe__Stripe_Customer__c;
    global bt_stripe__Stripe_Customer__c bt_stripe__Stripe_Customer__r;
    global Id bt_stripe__Transaction__c;
    global bt_stripe__Transaction__c bt_stripe__Transaction__r;
    global String bt_stripe__Type__c;

    global bt_stripe__Webhook_Event__c () 
    {
    }
}