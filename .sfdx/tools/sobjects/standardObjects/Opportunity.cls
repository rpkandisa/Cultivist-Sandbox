// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Opportunity {
    global Account Account;
    global Id AccountId;
    global List<AccountPartner> AccountPartners;
    global String Action_Tags__c;
    global List<ActivityHistory> ActivityHistories;
    global String Additional_Verbal_Cue__c;
    global Decimal Amount;
    global String Application_Status__c;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global Campaign Campaign;
    global Id CampaignId;
    global Date CloseDate;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global List<Contract> Contracts__r;
    global List<Lead> ConvertedOpportunity;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String CurrencyIsoCode;
    global String Description;
    global List<EmailMessage> Emails;
    global List<Event> Events;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<OpportunityFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global String Fiscal;
    global Integer FiscalQuarter;
    global Integer FiscalYear;
    global String ForecastCategory;
    global String ForecastCategoryName;
    global Boolean HasOpenActivity;
    global Boolean HasOpportunityLineItem;
    global Boolean HasOverdueTask;
    global List<OpportunityFieldHistory> Histories;
    global Id Id;
    global Double Inactive_Days__c;
    global String Introduced_by__c;
    global Boolean IsClosed;
    global Boolean IsDeleted;
    global Boolean IsWon;
    global Date LastActivityDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global String LeadSource;
    global String Lead_Source_3_Detail__c;
    global String Management_Region__c;
    global String Name;
    global String NextStep;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global List<OpportunityCompetitor> OpportunityCompetitors;
    global List<OpportunityContactRole> OpportunityContactRoles;
    global List<OpportunityHistory> OpportunityHistories;
    global List<OpportunityLineItem> OpportunityLineItems;
    global List<OpportunityPartner> OpportunityPartnersFrom;
    global User Owner;
    global Id OwnerId;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<Partner> Partners;
    global Pricebook2 Pricebook2;
    global Id Pricebook2Id;
    global Double Probability;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<Quote> Quotes;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<FlowRecordRelation> RelatedRecord;
    global String Secondary_Introduced__c;
    global String Secondary_Source__c;
    global String Secondary_Team_Converter__c;
    global List<OpportunityShare> Shares;
    global String Source__c;
    global String StageName;
    global Quote SyncedQuote;
    global Id SyncedQuoteId;
    global Datetime SystemModstamp;
    global List<Task> Tasks;
    global String Team_Converter__c;
    global List<TopicAssignment> TopicAssignments;
    global String Type;
    global String Type_of_Membership__c;
    global String Verbal_Cue__c;
    global List<AgentWork> WorkItem;
    global Double ebsta1__Ebsta_Score_Trend_Last_30_Days__c;
    global Double ebsta1__Ebsta_Score_Trend_Last_7_Days__c;
    global Double ebsta1__Ebsta_Score_Trend_Last_90_Days__c;
    global Double ebsta1__Ebsta_Score__c;
    global Datetime ebsta1__Last_Ebsta_Stats_Update__c;
    global Datetime ebsta1__Last_Email_Activity_Date__c;
    global Double ebsta1__Last_month_emails_exchanged_inbound__c;
    global Double ebsta1__Last_month_emails_exchanged_outbound__c;
    global Double ebsta1__Last_week_emails_exchanged_inbound__c;
    global Double ebsta1__Last_week_emails_exchanged_outbound__c;
    global List<ebsta1__Opportunity_Report__c> ebsta1__Opportunity_Reports__r;
    global Double ebsta1__Total_emails_exchanged_inbound__c;
    global Double ebsta1__Total_emails_exchanged_outbound__c;

    global Opportunity () 
    {
    }
}