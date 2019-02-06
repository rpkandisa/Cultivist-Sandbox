public class RegistrationStepFirstController {
    
    private Lead lead{get;set;}
    private String leadID{get;set;}
    private ApexPages.Message page{get;set;}
    private CountryInit CI = new CountryInit();
    
    public String fone{get;set;}
    public String foneCountryCode{get;set;}
    public String firstName{get;set;}
    public String lastName{get;set;}
    public String title{get;set;}
    public String email {get; set;}
    public String City{get;set;}
    public String Street{get;set;}
    public String StreetSecond{get;set;}
    public String PostalCode{get;set;}
    public String stateCode{get;set;}
    public String CountryCode{get;set;}
    Public List<Selectoption> titleList{get;set;}
    Public List<Selectoption> shippingCountryCodeList{get{return CI.countrySelectOption;}set;}
    Private OwnerId__mdt owner;
	
    public boolean isMandarin{get
    {String mandarin = apexpages.currentpage().getparameters().get('mandarin');
        if(mandarin!=null&&!String.isBlank(mandarin)&&mandarin=='true'){
            return true;
        }else{
            return false ;
        }}
                              set;}

    public RegistrationStepFirstController(){
        try{
        owner = [Select id, OwnerId__c from OwnerId__mdt Limit 1];
        }catch(Exception e){
            
        }
        
        foneCountryCode = '+';
        titleList = new List<SelectOption>(); 
        Schema.DescribeFieldResult fieldResult = Schema.Lead.Salutation.getDescribe();
      	List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
          titleList.add(new SelectOption(pickListVal.getLabel(),pickListVal.getValue()));
                 
		}  
	}
    
   
    
    public PageReference action(){
        ApexPages.Message msg = validateData();
        if(msg != null){
            ApexPages.addMessage(msg);
            return null;
    	}
        try{
            if(saveLead()){
            return nextPAge(); 
            }
        }catch(exception e){
           
            return null; 
        }
        msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Registration is disable we work on this');
        ApexPages.addMessage(msg);
        return null;   
       }
    
   
    
    
    
    private ApexPages.Message validateData(){
        if(String.isBlank(firstName)){ 
          return new ApexPages.Message(ApexPages.Severity.ERROR, 'First Name Cant be empty');
          }else if(String.isBlank(lastName)){
          return new ApexPages.Message(ApexPages.Severity.ERROR, 'Last Name Cant be empty');
          }else if(String.isBlank(email)){
          return new ApexPages.Message(ApexPages.Severity.ERROR, 'Email Cant be empty'); 
          }else if(CountryCode=='null'||CountryCode==null){
          return new ApexPages.Message(ApexPages.Severity.ERROR, 'Select Country'); 
          }else if(String.isBlank(City)){
          return new ApexPages.Message(ApexPages.Severity.ERROR, 'Sity Cant be empty'); 
          }else if(String.isBlank(Street)){
          return new ApexPages.Message(ApexPages.Severity.ERROR, 'Street cant be empty'); 
          }else if(String.isBlank(PostalCode)||PostalCode.length()>=10){
          return new ApexPages.Message(ApexPages.Severity.ERROR, 'Wrong postal code');
          }else if(String.isBlank(title)){
          return new ApexPages.Message(ApexPages.Severity.ERROR, 'Title cant be empty');    
          }
        return null;
    }
    
    
    private boolean saveLead(){
        List<Lead> leads = [Select id from Lead where email=:email and IsConverted = false];
        if(leads.isEmpty()){
    	lead = new Lead();
        }else{
          lead =  leads[0] ;
        }
        lead.Salutation = title;
        lead.lastName = lastName;
        lead.firstName = firstName;
        lead.phone = foneCountryCode+fone; 
        lead.email = email;
		lead.Membership_Type__c = 'Museum Card';
        lead.OwnerId = owner.OwnerId__c;
        lead.City = city;
        if(isMandarin){
            OwnerId__mdt owner = [Select id, OwnerId__c, AccountId__c from OwnerId__mdt Limit 1];
            if(owner.AccountId__c!=null)
            lead.Corporate_Company__c = owner.AccountId__c;
            }
        lead.Country = countryCode;
        lead.State = stateCode;
        lead.PostalCode = PostalCode;
        lead.street_third_line__c = StreetSecond;
        lead.Street = Street;
        Database.UpsertResult saveLead = Database.upsert(lead);
        if(saveLead.isSuccess()){
            leadID=lead.id;
            return true;
        }
        
        return false; 	    
    }
    
    private PageReference nextPage(){
        String url = Url.getSalesforceBaseUrl().toExternalForm()+'/registration_step_second?LeadId='+lead.id;
        if(isMandarin){
           url = url+'&mandarin=true'; 
        }
        PageReference page = new PageReference(url);
        return page;
    }


}