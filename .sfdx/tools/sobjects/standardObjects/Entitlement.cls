// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Entitlement {
    global Account Account;
    global Id AccountId;
    global List<ActivityHistory> ActivityHistories;
    global Asset Asset;
    global Id AssetId;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global BusinessHours BusinessHours;
    global Id BusinessHoursId;
    global List<Case> Cases;
    global Integer CasesPerEntitlement;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global ContractLineItem ContractLineItem;
    global Id ContractLineItemId;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String CurrencyIsoCode;
    global List<EmailMessage> Emails;
    global Date EndDate;
    global List<EntitlementContact> EntitlementContacts;
    global List<Event> Events;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<EntitlementFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<EntitlementHistory> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsPerIncident;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global String Name;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global Integer RemainingCases;
    global ServiceContract ServiceContract;
    global Id ServiceContractId;
    global SlaProcess SlaProcess;
    global Id SlaProcessId;
    global Date StartDate;
    global String Status;
    global Datetime SystemModstamp;
    global List<Task> Tasks;
    global String Type;
    global List<WorkOrder> WorkOrders;

    global Entitlement () 
    {
    }
}