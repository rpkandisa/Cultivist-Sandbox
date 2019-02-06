// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class bt_stripe__Company__c {
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
    global List<bt_stripe__Company__History> Histories;
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
    global String bt_stripe__City__c;
    global List<bt_stripe__Company_Location__c> bt_stripe__Company_Locations__r;
    global List<bt_stripe__Connected_Account__c> bt_stripe__Connected_Accounts__r;
    global String bt_stripe__Country__c;
    global String bt_stripe__Currency_ISO__c;
    global String bt_stripe__Description__c;
    global String bt_stripe__EIN__c;
    global String bt_stripe__Email__c;
    global String bt_stripe__FY_Start_Month__c;
    global List<bt_stripe__Location__c> bt_stripe__Locations__r;
    global String bt_stripe__Logo__c;
    global List<bt_stripe__Payment_Gateway__c> bt_stripe__Payment_Gateways__r;
    global String bt_stripe__Phone__c;
    global String bt_stripe__Postal_Code__c;
    global String bt_stripe__Registration_Number__c;
    global String bt_stripe__State_or_Province__c;
    global String bt_stripe__Street_Address__c;
    global String bt_stripe__Support_Email__c;
    global String bt_stripe__Support_Phone__c;
    global String bt_stripe__VAT__c;
    global String bt_stripe__Website__c;

    global bt_stripe__Company__c () 
    {
    }
}