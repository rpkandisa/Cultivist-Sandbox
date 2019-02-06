public class FinishController {
    private String paymentMethodId{get;set;}
    private String custumerId{get;set;}
    private bt_stripe__Payment_Method__c paymentMetod{get;set;}
    private bt_stripe__Transaction__c transact{get;set;}
    private List <Country> countryes{get;set;}
    private String LeadId{get;set;}
    private String countryStr;
    
    public boolean doubleTransact{get;set;}
    public boolean finish{get;set;}
    public String currentIso{get;private set;}
    public Double sum{get;private set;}
    public boolean isValid{get;set;}
    public boolean transactInProgres{get;set;}
    public String error{get;set;}
    public boolean isMandarin{get
    {String mandarin = apexpages.currentpage().getparameters().get('mandarin');
     if(mandarin!=null&&!String.isBlank(mandarin)&&mandarin=='true'){
         return true;
     }else{
         return false ;
     }}
                              set;}
    
    public String script{get{
        if(isValid)
            return '';
        return '<script>window.setTimeout(cheack,5000);</script>';}}
    public Integer count {get;set;}
    private boolean IPM = false;
    private boolean IC = false;
    public FinishController(){
        doubleTransact = false;
        isValid = false;
        transactInProgres = false;
        initCountry();
    }
    
    public PageReference action(){  
        if(finish){
            isValid = true;
            return null;
        }
        if(count==null){
            count =0;
        }
        count++;
        if(count>8){
            String url = Url.getSalesforceBaseUrl().toExternalForm()+'/errorPage?error=Cant+connect+to+your+bank+at+this+moment,+we+will+notify+you+after+seccessfull+payment.+Thanks+&leadID='+LeadID;
            if(isMandarin){
                url = url+'&mandarin=true'; 
            }
            PageReference page = new PageReference(url);
            return page; 
        }
        if(!initPaymentMetod()){
            system.debug('_______________________ PM FALSE');
            return returnError(false);
        }

        if(!cheachCaptureTransaction()){
            system.debug('_______________________ CCT FALSE');
            String url = Url.getSalesforceBaseUrl().toExternalForm()+'/caution?custumerID='+custumerId+'&leadID='+LeadID+'&paymentMetodId='+paymentMethodId;
            if(isMandarin){
                url = url+'&mandarin=true'; 
            }
            PageReference page = new PageReference(url);
            return page;
            
        }
        system.debug('_______________________ CCT TRUE');
        initCurency();
        saveTransction();
        system.debug('_______________________ sAVE TRANSCTION');
        if(cheackTransaction()){
            convertLead();
            system.debug('_______________________ CT TRUE ');
            isValid=true;
            if(doubleTransact){
                String url = Url.getSalesforceBaseUrl().toExternalForm()+'/finish?finish=true';
                if(isMandarin){
                    url = url+'&mandarin=true'; 
                }
                PageReference page = new PageReference(url);
                return page;
            }
            return null;
        }
        system.debug('_______________________ CT FALSE');
        return returnError(true);
        
    }
    
    public boolean cheackTransaction(){
        bt_stripe__Transaction__c trasctCheack = [SELECT 
                                                  Id,
                                                  bt_stripe__Error_Code__c,
                                                  bt_stripe__Error_Message__c,
                                                  bt_stripe__Error_Param__c,
                                                  bt_stripe__Error_Type__c,
                                                  bt_stripe__Invalid_Payment_Method__c, bt_stripe__Paid__c, bt_stripe__Transaction_Status__c FROM bt_stripe__Transaction__c where id = :transact.id];
        system.debug(trasctCheack.bt_stripe__Error_Code__c);
        system.debug(trasctCheack.bt_stripe__Transaction_Status__c);
        if(trasctCheack.bt_stripe__Error_Message__c!=null
           &&trasctCheack.bt_stripe__Transaction_Status__c!='Completed'){
               error = trasctCheack.bt_stripe__Error_Message__c;
               return false;  
           }
        return true;
    }
    
    public PageReference returnError(boolean cheack){
        system.debug(error);
        if(error!=null){
            String url = Url.getSalesforceBaseUrl().toExternalForm()+'/errorPage?error='+error+'&leadID='+LeadID;
            if(isMandarin){
                url = url+'&mandarin=true'; 
            }
            PageReference page = new PageReference(url);
            return page; 
        }
        if(cheack){
            system.debug(paymentMethodId);
            bt_stripe__Payment_Method__c paymentMetodEror = [SELECT id,
                                                             bt_stripe__Error_Message__c,
                                                             bt_stripe__Error_Code__c
                                                             FROM bt_stripe__Payment_Method__c 
                                                             Where id=:paymentMethodId];
            if(paymentMetodEror.bt_stripe__Error_Message__c!=null){
                String url = Url.getSalesforceBaseUrl().toExternalForm()+'/errorPage?error='+paymentMetodEror.bt_stripe__Error_Message__c+'&leadID='+LeadID;
                if(isMandarin){
                    url = url+'&mandarin=true'; 
                }
                PageReference page = new PageReference(url);
                return page; 
            }
        }
        return null;
    }
    
    public PageReference doredirect(){
        String finishStr = ApexPages.currentPage().getParameters().get('finish');
        if(finishStr!=null){
            if(finishStr=='true'){
                finish =true;
            }
        }else{
            finish = false;
            String BooleanString = ApexPages.currentPage().getParameters().get('doubleTransact');
            if(BooleanString!=null){
                if(BooleanString=='true'){
                    doubleTransact =true;
                }
            }
            paymentMethodId = ApexPages.currentPage().getParameters().get('paymentMetodId');
            LeadId = ApexPages.currentPage().getParameters().get('LeadId');
            if(String.isBlank(paymentMethodId)){
                String url = Url.getSalesforceBaseUrl().toExternalForm();
                if(isMandarin){
                    url = url+'&mandarin=true'; 
                }
                PageReference page = new PageReference(url);
                return page;
            }
            Lead l = [Select id, country from lead where id =:LeadId];
            countryStr = l .Country; 
        }
        return null;
    } 
    

    
    private boolean initPaymentMetod(){
        try{
            system.debug(''+paymentMethodId);
            paymentMetod = [SELECT id,
                            bt_stripe__Stripe_Customer__c,
                            bt_stripe__Error_Message__c,
                            bt_stripe__Error_Code__c,
                            bt_stripe__Customer_Id__c,
                            bt_stripe__Account__c,
                            bt_stripe__Payment_Method_Status__c,
                            bt_stripe__Billing_Country__c,
                            bt_stripe__Payment_Gateway__c,
                            bt_stripe__Billing_Email__c
                            FROM bt_stripe__Payment_Method__c 
                            Where id=:paymentMethodId];
            system.debug('__________________'+paymentMetod);
        }catch(exception e){
            error = 'Paymen metod with this id does not exist please try again or contact administrator. Error messange : '+e.getMessage();
            return false;
        }
        if(!Test.isRunningTest()&&paymentMetod.bt_stripe__Stripe_Customer__c==null){
            return false;
        }
        if(paymentMetod.bt_stripe__Error_Message__c!=null){
            error = paymentMetod.bt_stripe__Error_Message__c;
            return false;
        }
        paymentMethodId = paymentMetod.id;
        custumerId = paymentMetod.bt_stripe__Stripe_Customer__c;
        return true;    
    }
    
    public boolean saveTransction(){
        transact = new bt_stripe__Transaction__c();
        transact.bt_stripe__Currency_ISO__c = currentIso;
        transact.bt_stripe__Amount__c = sum;
        transact.bt_stripe__Payment_Method__c = paymentMetod.id;
        transact.bt_stripe__Payment_Gateway__c = paymentMetod.bt_stripe__Payment_Gateway__c;
        transact.bt_stripe__Stripe_Customer__c = paymentMetod.bt_stripe__Stripe_Customer__c;
        Database.SaveResult result = Database.insert(transact);
        if(result.isSuccess()){
            transact.bt_stripe__Capture__c = true;
            if(Test.isRunningTest())
                return true;
            Database.UpsertResult updateTransction = Database.upsert(transact);
            if(!updateTransction.isSuccess()){
                bt_stripe__Transaction__c cheackTrError = [SELECT id,bt_stripe__Error_Message__c FROM bt_stripe__Transaction__c WHERE id = :transact.id];
                if(cheackTrError.bt_stripe__Error_Message__c==null){
                    return true;
                }else 
                    error = cheackTrError.bt_stripe__Error_Message__c;
            }
        }
        return false;
    }
    
    private boolean cheachCaptureTransaction(){
        if(doubleTransact){
            return true;
        }
        List <bt_stripe__Transaction__c> listTransaction = new List <bt_stripe__Transaction__c> ([SELECT id FROM bt_stripe__Transaction__c 
                                                                                                  WHERE bt_stripe__Transaction_Status__c = : 'Completed' AND bt_stripe__Stripe_Customer__c = : custumerId ]);
        if(listTransaction.isEmpty()){
            return true;             
        }
        return false;
    }
    
    private void initCurency(){
        String continent;
        if(countryStr.equals('GB')){currentIso = 'GBP';sum = 700; return;
                                                                   }
        for(Country mycountry:countryes){
            if(mycountry.code.equals(countryStr)){ continent = mycountry.continent;}
        }

        if(continent!=null&&continent.contains('Europe')){currentIso = 'EUR';sum = 700; return;
                                                         }
        currentIso = 'USD';sum = 800;
    }
    
    public void convertLead(){
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(LeadId);
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
        lc.setDoNotCreateOpportunity(true);
        try{
            Database.LeadConvertResult lcr = Database.convertLead(lc);
            Account account =[SELECT id FROM Account WHERE id=:lcr.getAccountId()];
            account.bt_stripe__Default_Payment_Gateway__pc = paymentMetod.bt_stripe__Payment_Gateway__c;
            account.bt_stripe__Default_Payment_Method__pc = paymentMetod.id;
            account.Stripe_Customer_ID__c = paymentMetod.bt_stripe__Customer_Id__c;
            account.Stripe_Account__c = paymentMetod.bt_stripe__Account__c;
            if(isMandarin){
            OwnerId__mdt owner = [Select id, OwnerId__c, AccountId__c from OwnerId__mdt Limit 1];
            if(owner.AccountId__c!=null)
            account.Corporate_Company__c = owner.AccountId__c;
            }
            update account;
        }catch(exception e){ 
            system.debug('Error convert or update lead : '+e);
        }
    }
    
    public void initCountry(){
        USA__mdt use =[SELECT USA_Countries__c from USA__mdt LIMIT 1];
        countryes = new List <Country>();
        countryes = (List <Country>)JSON.deserialize(use.USA_Countries__c, List<Country>.class);
    }
    
    public class Country{
        public String code{get;set;} 
        public String continent{get;set;}
    }
    
}