public class TermOfUSEController {

    private String [] ovnerMail {get;set;}
    private Email_adress__mdt [] mailAdress {get;set;}
    private Contact contact{get;set;}
    
    public List<Terms_information__mdt> termList{get;set;}
    public Terms_information__mdt term{get;set;}
    public id termID{get;set;} 
    public String termLabel{get;set;}
    public String messangeUser{get;set;}
    public String mail{get;set;}
    public String name{get;set;}
    
    public TermOfUSEController(){
        mailAdress =  new List<Email_adress__mdt>();
        ovnerMail = new List<String>();
        mailAdress = [SELECT email__c FROM Email_adress__mdt]; 
        for(Email_adress__mdt mail:mailAdress){
           ovnerMail.add(mail.email__c);
        }
        termList = new List<Terms_information__mdt>([SELECT id, Name__c, Information__c, Label FROM Terms_information__mdt ]);
        if(!termList.isEmpty())
        term = termList[0];
        termLabel = ApexPages.currentPage().getParameters().get('lable'); 
        if(!String.isEmpty(termLabel)){
            getTerm();
        }
    }
    
    public void changeTerm(){
        for( Terms_information__mdt t:termList){
            if(t.Id==termID) {
              term = t;  
            }
        }
    }
    
    public void getTerm(){
       for( Terms_information__mdt t:termList){
            if(t.label==termLabel) {
              term = t;  
            }
        } 
    }
    
    public PageReference sendMsg(){
        PageReference page = new PageReference(Url.getSalesforceBaseUrl().toExternalForm());
        page.setRedirect(true);
        try{
        contact = [SELECT id, email FROM Contact WHERE email = : mail Limit 1];
        }catch(exception e){
        contact = new Contact();
        contact.LastName = name;
        contact.email = mail;
        insert contact;
        }
        Task task = new Task();
        task.WhoId = contact.id;
        task.Description = messangeUser ;
        task.Subject = 'NAME :'+name+' Email: '+mail;
        insert task;
        system.debug(task.id);
        if(sendMail())
    	return page;
        return null;
    }

     private boolean sendMail(){
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses = ovnerMail;
        message.optOutPolicy = 'FILTER';
        message.subject = 'Messange from custumer '+name +'. You can contact by '+mail;
        message.plainTextBody = messangeUser;
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
            If(Test.isRunningTest()){
                return true;
            }
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        
        if (results[0].success) {
           return true;
        }
         return false;
     }
  
}