// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Quote {
    global Account Account;
    global Id AccountId;
    global List<ActivityHistory> ActivityHistories;
    global Address AdditionalAddress;
    global String AdditionalCity;
    global String AdditionalCountry;
    global String AdditionalGeocodeAccuracy;
    global Double AdditionalLatitude;
    global Double AdditionalLongitude;
    global String AdditionalName;
    global String AdditionalPostalCode;
    global String AdditionalState;
    global String AdditionalStreet;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global Address BillingAddress;
    global String BillingCity;
    global String BillingCountry;
    global String BillingGeocodeAccuracy;
    global Double BillingLatitude;
    global Double BillingLongitude;
    global String BillingName;
    global String BillingPostalCode;
    global String BillingState;
    global String BillingStreet;
    global Boolean CanCreateQuoteLineItems;
    global List<CombinedAttachment> CombinedAttachments;
    global Contact Contact;
    global Id ContactId;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global Contract Contract;
    global Id ContractId;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String CurrencyIsoCode;
    global String Description;
    global Double Discount;
    global String Email;
    global List<EmailMessage> Emails;
    global List<Event> Events;
    global Date ExpirationDate;
    global String Fax;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<QuoteFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global Decimal GrandTotal;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsSyncing;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Integer LineItemCount;
    global String Name;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global Opportunity Opportunity;
    global Id OpportunityId;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global String Phone;
    global Pricebook2 Pricebook2;
    global Id Pricebook2Id;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<QuoteDocument> QuoteDocuments;
    global List<QuoteLineItem> QuoteLineItems;
    global String QuoteNumber;
    global Address QuoteToAddress;
    global String QuoteToCity;
    global String QuoteToCountry;
    global String QuoteToGeocodeAccuracy;
    global Double QuoteToLatitude;
    global Double QuoteToLongitude;
    global String QuoteToName;
    global String QuoteToPostalCode;
    global String QuoteToState;
    global String QuoteToStreet;
    global List<FlowRecordRelation> RelatedRecord;
    global Address ShippingAddress;
    global String ShippingCity;
    global String ShippingCountry;
    global String ShippingGeocodeAccuracy;
    global Decimal ShippingHandling;
    global Double ShippingLatitude;
    global Double ShippingLongitude;
    global String ShippingName;
    global String ShippingPostalCode;
    global String ShippingState;
    global String ShippingStreet;
    global String Status;
    global Decimal Subtotal;
    global List<Opportunity> SyncedQuote;
    global Datetime SystemModstamp;
    global List<Task> Tasks;
    global Decimal Tax;
    global Decimal TotalPrice;

    global Quote () 
    {
    }
}