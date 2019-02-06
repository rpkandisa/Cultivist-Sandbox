public class CautionController {
    
    private bt_stripe__Payment_Method__c paymentMetod{get;set;}

    
    public String error{get;set;}
    public List <bt_stripe__Transaction__c> listTransaction{get;set;}
    public String paymentMetodId{get;set;}
    public String leadId{get;set;}
    public String StripeCustumerId{get;set;}
    public boolean isMandarin{get
    {String mandarin = apexpages.currentpage().getparameters().get('mandarin');
        if(mandarin!=null&&!String.isBlank(mandarin)&&mandarin=='true'){
            return true;
        }else{
            return false ;
        }}
                              set;}
    
    public CautionController(){
        paymentMetodId = ApexPages.currentPage().getParameters().get('paymentMetodId');
        LeadId = ApexPages.currentPage().getParameters().get('LeadId');
		StripeCustumerId = ApexPages.currentPage().getParameters().get('custumerID');
        paymentMetod = [SELECT id, bt_stripe__Stripe_Customer__c, bt_stripe__Error_Message__c, bt_stripe__Account__c, bt_stripe__Customer_Id__c, bt_stripe__Billing_Country__c, bt_stripe__Payment_Gateway__c, bt_stripe__Billing_Email__c FROM bt_stripe__Payment_Method__c Where id=:paymentMetodId];
        listTransaction = new List <bt_stripe__Transaction__c> ([SELECT id, bt_stripe__Payment_Method_Billing_Email__c, bt_stripe__Amount__c, bt_stripe__Currency_ISO__c, bt_stripe__Processed_Date__c FROM bt_stripe__Transaction__c 
        WHERE bt_stripe__Transaction_Status__c = : 'Completed' AND bt_stripe__Stripe_Customer__c = : StripeCustumerId ]);
    }

    public PageReference action(){ 
        
        String url = Url.getSalesforceBaseUrl().toExternalForm()+'/finish?doubleTransact=true&paymentMetodId='+paymentMetodId+'&LeadId='+LeadId;
        if(isMandarin){
                        url = url+'&mandarin=true'; 
                    }
       PageReference page = new PageReference(url);
       page.setRedirect(true);
       return page; 
    }
    

}