public  with sharing class AssignCaseTOcamp_Controller {
    public list<Campaign> lstCamp{get;set;}
    public string strsearchString{get;set;}
    public string idSelectedCam{get;set;}
    public list<string> caseIds{get;set;}
    
    public AssignCaseTOcamp_Controller(){
        lstCamp=new list<Campaign>();
        caseIds = ApexPages.currentPage().getParameters().get('recs').split(',',-2);
        recentlyViewedRec();
    }
    
    
    public void recentlyViewedRec(){
        lstCamp=[SELECT id, Name, EndDate, StartDate, Parent.name, Status, Type, Owner.Name FROM Campaign WHERE LastViewedDate != NULL AND IsActive=True ORDER BY LastViewedDate DESC Limit 20];
    }
    
    public void SearchCamp(){
        lstCamp.clear();
        string temp=String.escapeSingleQuotes(strsearchString);
        temp='%'+temp+'%';
        lstCamp=[SELECT id, Name, EndDate, StartDate, Parent.name, Status, Type, Owner.Name FROM Campaign WHERE IsActive=True AND NAme Like :temp Limit 20];
    }
    
    public void updateCases(){
        try{
            list<case> lstCase= new list<case>([select Id,Campaign__c from case where ID IN:caseIds]) ;  
            
            for(case c:lstCase){
                c.Campaign__c=idSelectedCam;
            }
            update lstCase;
        }
        catch(exception e){
            lstCamp[0].Status.addError('somethig went wrong');
        }
    }   
}