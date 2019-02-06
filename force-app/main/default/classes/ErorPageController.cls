public class ErorPageController {

    public String error{get;set;}
    public String LeadID{get;set;}
     public boolean isMandarin{get
    {String mandarin = apexpages.currentpage().getparameters().get('mandarin');
        if(mandarin!=null&&!String.isBlank(mandarin)&&mandarin=='true'){
            return true;
        }else{
            return false ;
        }}
                              set;}
    
    public ErorPageController(){
    	error = ApexPages.currentPage().getParameters().get('error');
        LeadID = ApexPages.currentPage().getParameters().get('LeadID');
    }
    
     public PageReference redirectMainPage(){
         String url = Url.getSalesforceBaseUrl().toExternalForm()+'/registration_step_second?LeadId='+LeadID;
         if(isMandarin){
            url = url+'&mandarin=true';
         }
        PageReference page = new PageReference(url);
        page.setRedirect(true);
        return page;
    }
}