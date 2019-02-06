// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class bt_stripe__Payment_Schedule__c {
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
    global List<bt_stripe__Payment_Schedule__History> Histories;
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
    global Boolean bt_stripe__Auto_Capture__c;
    global Double bt_stripe__Balance_Due__c;
    global Double bt_stripe__Balance_Paid__c;
    global String bt_stripe__CRON__c;
    global Boolean bt_stripe__Capture_First__c;
    global Id bt_stripe__Contact__c;
    global Contact bt_stripe__Contact__r;
    global Double bt_stripe__Count__c;
    global String bt_stripe__Currency__c;
    global String bt_stripe__Day_of_Month__c;
    global String bt_stripe__Day_of_Week__c;
    global String bt_stripe__Description__c;
    global Double bt_stripe__Each_Amount__c;
    global Date bt_stripe__End_Date__c;
    global Double bt_stripe__Frequency__c;
    global Double bt_stripe__Initial_Amount__c;
    global String bt_stripe__Month_of_Year__c;
    global Date bt_stripe__Next_Payment_Date__c;
    global String bt_stripe__On_The__c;
    global Id bt_stripe__Payment_Method__c;
    global bt_stripe__Payment_Method__c bt_stripe__Payment_Method__r;
    global String bt_stripe__Payment_Status__c;
    global String bt_stripe__Preset__c;
    global String bt_stripe__Repeats__c;
    global Date bt_stripe__Start_Date__c;
    global String bt_stripe__Status__c;
    global Double bt_stripe__Total_Amount__c;
    global List<bt_stripe__Transaction__c> bt_stripe__Transactions__r;

    global bt_stripe__Payment_Schedule__c () 
    {
    }
}