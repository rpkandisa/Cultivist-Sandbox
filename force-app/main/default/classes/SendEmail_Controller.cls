public with sharing class SendEmail_Controller {
    private ApexPages.StandardSetController standardController;
    public string strTemplateID{get;set;}
    public map<id,string> mapTemplatBody{get;set;}
    
    public SendEmail_Controller(ApexPages.StandardSetController standardController){
        this.standardController = standardController;
    }
    
    public List<SelectOption> getItems() {
    mapTemplatBody= new map<id,string>();
        List<SelectOption> options = new List<SelectOption>();
        list<EmailTemplate> tempTemplate= new list<EmailTemplate>([SELECT Id, HtmlValue, body,Name FROM EmailTemplate]);
        strTemplateID=tempTemplate[0].ID;
        for(EmailTemplate rec:tempTemplate){
            options.add(new SelectOption(rec.ID,rec.Name));
            if(!String.isBlank( rec.HtmlValue )){
            mapTemplatBody.put(rec.ID,rec.HtmlValue);
            }
            else{
                mapTemplatBody.put(rec.ID,rec.body);
            }
        }
        
        return options;
    }

    public PageReference SendEmail(){
        
        set<id> AccID= new set<ID>();
        List<Messaging.SendEmailResult> listEmailResult = null;
        List<Messaging.SingleEmailMessage> listSingleEmailMessages = new List<Messaging.SingleEmailMessage>();
        list<Account> selectedAccount=(List<Account>) standardController.getSelected();
        
        try{
        for(Account c:selectedAccount){
            AccID.add(c.ID);
        }
        for(Account c:[select ID, PersonContactId, PersonEmail from account where ID IN:AccID AND PersonContact.Email !=null]){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setWhatID(c.ID);
            mail.setSaveAsActivity(false);
            mail.setTemplateId(strTemplateID);
            mail.setTargetObjectId(c.PersonContactId);
            listSingleEmailMessages.add(mail);
        }
        if(!listSingleEmailMessages.isEmpty()){ 
            listEmailResult = Messaging.sendEmail(listSingleEmailMessages);
                       
         }
        }
        catch(exception e){
            
        }
        return standardController.save();   
    }
}