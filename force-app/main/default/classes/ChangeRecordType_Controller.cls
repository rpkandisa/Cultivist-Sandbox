public with sharing class ChangeRecordType_Controller {
    private ApexPages.StandardSetController standardController;
    public string strRecordtypeID{get;set;}
    
    public ChangeRecordType_Controller(ApexPages.StandardSetController standardController){
        this.standardController = standardController;
    }
    
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        for(RecordType rec:[select Id,Name FROM RecordType WHERE SobjectType='case']){
            options.add(new SelectOption(rec.ID,rec.Name));
        }
        return options;
    }
	
    public PageReference updateCases(){
        list<case> selectedCases=(List<Case>) standardController.getSelected();
        for(case c:selectedCases){
            c.RecordTypeID=strRecordtypeID;
        }
        return standardController.save();   
    }
}