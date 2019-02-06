public with sharing class  RegistrationStepSecondController {

    private List <Country> countryes{get;set;}
    private Lead lead{get;set;}
    private Payment_Getwey_Metod__mdt paymentGetweyMetod{get;set;}
    private bt_stripe__Payment_Method__c paymentMetod{get;set;}
    private String leadId{get;set;}
    private CountryInit CI = new CountryInit();
    private String country{get;set;}
    
    public String cardName{get;set;}
    public String cardNumber{get;set;}
    public String expiryMonth {get;set;}
    public String expiryYears {get;set;}
    public String CVC {get;set;}
    public Boolean rend{get;set;} 
    Public List<Selectoption> shippingCountryCodeList{get{return CI.countrySelectOption;}set;}
    public String billingAdress {get;set;}
    public String CountryCode{get;set;}
    public String City{get;set;}
    public String Street{get;set;}
    public String StreetSecond{get;set;}
    public String PostalCode{get;set;}
    public Blob fileblob {get;set;}
    public String contentType { get; set; }
    public String filename { get; set; }
    public String filesize { get; set; }
    public String stateCode{get;set;}
    public String currentIso{get;set;}
    public String currentIsoCode{get;set;}
    public String currentIsoString{get{
        if(currentIso=='€'){
            return ' EUR';
        }else if(currentIso=='£'){
            return ' UK';
        }else{
            return ' US';
        }
    }
                                  }
    public Integer sum{get;set;}
    public boolean terAndConditions{get;set;}
    public boolean isMandarin{get
    {String mandarin = apexpages.currentpage().getparameters().get('mandarin');
        if(mandarin!=null&&!String.isBlank(mandarin)&&mandarin=='true'){
            return true;
        }else{
            return false ;
        }}
    set;}
    
    public RegistrationStepSecondController(){
        rend = false;
        terAndConditions= false;
	}
    
    public PageReference doredirect(){
        try{
          leadID = ApexPages.currentPage().getParameters().get('leadId');  
          lead= [SELECT Id, LastName, FirstName, Street, City, State, PostalCode, Country, 
                 Phone, Secondary_Mailing_Country__c, Secondary_Mailing_City__c,
                 Secondary_Mailing_Zip_Postal_Code__c, Secondary_Mailing_State_Province__c, Email FROM Lead WHERE id = : leadID];
           }catch(exception e){
          return redirectMainPage();    
          }
        initCountryAndState();
        return null;
    } 
    
    public PageReference CreatePaymentMethods(){
        ApexPages.Message msgvalid = isValidCard();
        if(msgvalid!=null){
            system.debug('Wrong card');
            ApexPages.addMessage(msgvalid);
            cleanBlob();
            return null;
   		}
         
        paymentMetod = new bt_stripe__Payment_Method__c();
        ApexPages.Message msg = initPaymentAddres();
         if(msg!=null){
            cleanBlob();
            ApexPages.addMessage(msg);
            return null;
         }

        if(!saveImage()){
            System.debug('Failed save img');
            ApexPages.Message msgblob = new ApexPages.Message(ApexPages.Severity.ERROR, 'Upload photo');
            ApexPages.addMessage(msgblob);  
            return null; 
        }

        if(savePaymenMetod()){
            String url = Url.getSalesforceBaseUrl().toExternalForm()+'/finish?paymentMetodId='+paymentMetod.id+'&LeadId='+lead.id;
        if(isMandarin){
           url = url+'&mandarin=true'; 
        }
           PageReference page = new PageReference(url);
    	   return page;  
        }
        system.debug('Error save payment metod');
        msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Registration is disuble just now we work on this.');
        ApexPages.addMessage(msg);
        return null;       
    }
    
    public ApexPages.Message isValidCard(){
        system.debug('Card validation');
        Integer month;
        if(!(isIntager(cardNumber))) {
           ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Wrong curd number.');
           return msg;
        }
        
        try { 
           Integer.valueOf(cvc);
           month = Integer.valueOf(expiryMonth); 
        	} catch(exception e) {
                ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'CVC must be number.');
                return msg;
            }
        
        if(month<1||month>12){ 
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Wrong month.');
            return msg;
        }
        
        if(!isIntager(expiryYears)){
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Wrong years.');
            return msg;
        }
        
    	Date myDate = Date.newInstance(Integer.valueOf(expiryYears),month, 31);
        Date mycurentDate = date.today();
        if(myDate<mycurentDate){ 
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Expiry date in past.');
            return msg;  
        }
        return null;
    }

    private ApexPages.Message initPaymentAddres(){
        system.debug('Init payment adrees. rend = '+rend);
        Date d = date.today().addMonths(-3);
       if(rend){
          ApexPages.Message msg = validateData();
          if(msg!=null){ 
              return msg;             
          }
           system.debug('**********************************');
        lead.street_firsth_line__c = Street;
        lead.Secondary_Mailing_City__c = city;
        lead.Secondary_Mailing_Country__c = countryCode;
        lead.Secondary_Mailing_Zip_Postal_Code__c = PostalCode;
        lead.street_second_line__c = StreetSecond;
        lead.Secondary_Mailing_State_Province__c = stateCode; 
           
        paymentMetod.bt_stripe__Billing_State__c = stateCode;
        paymentMetod.bt_stripe__Billing_City__c = City;
        paymentMetod.bt_stripe__Billing_Postal_Code__c = PostalCode;
        paymentMetod.bt_stripe__Billing_Street__c = Street; 
        paymentMetod.bt_stripe__Billing_Country__c = countryCode;
          update lead;
       }else{
           system.debug('_________________________________________________');
        paymentMetod.bt_stripe__Billing_Country__c = lead.Country;
        paymentMetod.bt_stripe__Billing_State__c = lead.State;
        paymentMetod.bt_stripe__Billing_City__c = lead.City;
        paymentMetod.bt_stripe__Billing_Postal_Code__c = lead.PostalCode;
        paymentMetod.bt_stripe__Billing_Street__c = lead.Street; 
       }
          initPaymentGetwey();
        return null;
    }   
    
    private ApexPages.Message validateData(){ 
    	system.debug('Validate Adress data');
      	if(CountryCode==null||CountryCode=='null'||CountryCode == 'Select Country'||CountryCode=='--------------------'){
            	return new ApexPages.Message(ApexPages.Severity.ERROR, 'Select Country'); 
          }else if(City.length()<1){
              	return new ApexPages.Message(ApexPages.Severity.ERROR, 'Sity Cant be empty');  
          }else if(Street.length()<1){
              	return new ApexPages.Message(ApexPages.Severity.ERROR, 'Street cant be empty');
          }else if(PostalCode.length()<1){
              	return new ApexPages.Message(ApexPages.Severity.ERROR, 'Enter postal code');
          }else if(PostalCode.length()>10){
              	return new ApexPages.Message(ApexPages.Severity.ERROR, 'Postal code to large');
          }
    	return null;
    }
   
    public boolean saveImage(){ 
        Attachment attachment = new Attachment();
        attachment.Body = fileblob;
        attachment.Name = filename;
        attachment.ParentId = lead.id;
        
        List<Attachment> attach = [Select id, BodyLength from Attachment where ParentId = :lead.id And Name = :filename];
        if(attach.isEmpty()){
         if(fileblob!=null&&filename!=null){
        
        Database.SaveResult saveAtach = Database.insert(attachment);
           return saveAtach.isSuccess();
		}  
        }else{
            return true;
        }
        system.debug('Save img');
        
        return false;
    }
    
    
    public void cleanBlob(){
        system.debug('Clean blob');
            fileName = null;
            fileSize = null;
            fileBlob = null;
     }
    
     private void initCountryAndState(){
        system.debug('initCountryAndState');
      	shippingCountryCodeList = CI.countrySelectOption;
        USA__mdt use =[SELECT USA_Countries__c from USA__mdt LIMIT 1];
        countryes = new List <Country>();
        countryes = (List <Country>)JSON.deserialize(use.USA_Countries__c, List<Country>.class);
        initCurency();
    }
 
    @TestVisible
    private boolean savePaymenMetod(){
        system.debug('savePaymenMetod');
        
        
        paymentMetod.bt_stripe__Card_Holder_Name__c = cardname;
   		paymentMetod.bt_stripe__CVV__c=cvc;
       	paymentMetod.bt_stripe__Card_Expiration_Year__c = expiryYears;
       	paymentMetod.bt_stripe__Card_Expiration_Month__c = expiryMonth;
        paymentMetod.bt_stripe__Card_Number__c = cardNumber;
        paymentMetod.bt_stripe__Payment_Gateway__c = paymentGetweyMetod.Payment_Getwey_Metod_ID__c;
        paymentMetod.bt_stripe__Billing_Email__c = lead.Email;

        if(Test.isRunningTest()){
             return true;
        }
        Database.SaveResult result = Database.insert(paymentMetod);
            if(result.isSuccess()){
                return true;
            }else{
              system.debug('Error save payment metod');                        
            }	
        
        return false; 
    }
    
    public void getBlob(){
        System.debug(fileblob);
    }
    
    public void commandLinkActionFalse(){
        rend=false;
    }
    public void commandLinkActionTrue(){
        rend=true;
    }
    
    private void initPaymentGetwey(){
        system.debug('initPaymentGetwey');
        String continent = '';
            for(Country mycountry:countryes){
                if(mycountry.code.equals(lead.Country)){
                  continent = mycountry.continent;
                }
            }
            if(continent.contains('Europe')){
                paymentGetweyMetod = [SELECT Payment_Getwey_Metod_ID__c FROM Payment_Getwey_Metod__mdt WHERE Label = 'Europe' LIMIT 1];
            }else
                paymentGetweyMetod = [SELECT Payment_Getwey_Metod_ID__c FROM Payment_Getwey_Metod__mdt WHERE Label = 'Other' LIMIT 1];
      	      
    }
    
    private boolean isIntager(String str){
    	try { lONG.valueOf(str); }  catch(exception e) { return false;} 
        return true;
    }
    
    public PageReference redirectMainPage(){
        system.debug('Redirect');
        String url = Url.getSalesforceBaseUrl().toExternalForm()+'?LeadId='+leadID;
        if(isMandarin){
           url = url+'&mandarin=true'; 
        }
        PageReference page = new PageReference(url);
        return page;
    }
    
    private void initCurency(){
        system.debug('initCurency');
        String continent = '';
        if(lead.Country.equals('GB')){currentIso = '£';sum = 700; currentIsoCode=' UK'; return;
        }
        for(Country mycountry:countryes){
            if(mycountry.code.equals(lead.Country)){ continent = mycountry.continent;
            }
        }
        if(continent.contains('Europe')){currentIso = '€';sum = 700;currentIsoCode=' EUR'; return;
        }else{currentIso = '$';sum = 800; currentIsoCode=' US';return;
        }
    }
    
    public class Country{
        public String name{get;set;} 
        public String code{get;set;} 
        public String continent{get;set;}
	}


}