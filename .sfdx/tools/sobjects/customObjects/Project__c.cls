// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Project__c {
    global Id Account__c;
    global Account Account__r;
    global List<ActivityHistory> ActivityHistories;
    global Date Actual_End_Date__c;
    global Date Actual_Start_Date__c;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global Decimal Billable_Materials_and_Expenses__c;
    global Decimal Billable_Time_Logged__c;
    global Double Budgeted_Man_Hours__c;
    global Decimal Budgeted_Material_Expense_Cost__c;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String CurrencyIsoCode;
    global Double Days_since_last_Activity__c;
    global String Description__c;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global List<EmailMessage> Emails;
    global List<Event> Events;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<Project__Feed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global Date Forecast_End_Date__c;
    global Date Forecast_Start_Date__c;
    global List<Project__History> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global String Key_Challenges__c;
    global String Key_Deliverables__c;
    global Date LastActivityDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Decimal Material_Expense_Total_Cost__c;
    global List<Materials_Expenses__c> Materials_Expenses__r;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global String Next_Step__c;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global Double Open_Phases__c;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<Phase__c> Phases__r;
    global String Priority__c;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global Double Progress__c;
    global List<Project_Contacts__c> Project_Contacts__r;
    global List<Project_Team_Member__c> Project_Team_Members__r;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<ContentDistribution> RelatedRecord;
    global String Stage__c;
    global String Status__c;
    global Datetime SystemModstamp;
    global List<Task> Tasks;
    global List<Time_Log__c> Time_Logs__r;
    global List<TopicAssignment> TopicAssignments;
    global Double Total_Time_Logged__c;
    global List<AgentWork> WorkItem;
    global Double of_Budget_Man_Hours__c;
    global Double of_Budget_Material_Expense__c;

    global Project__c () 
    {
    }
}