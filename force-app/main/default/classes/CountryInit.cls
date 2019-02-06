public class CountryInit {

    public  List<SelectOption> countrySelectOption{get;set;}
    
    
    public CountryInit(){
		init();
    }
    
    
    public void init(){
       countrySelectOption = new List<SelectOption>();
       try{
           Countryes__mdt c = [Select id, List_country_Json__c from Countryes__mdt Limit 1];
           List< Object> fieldList = (List< Object>)JSON.deserializeUntyped(c.List_country_Json__c);
		   for(Object obj:fieldList){
              Map<String, Object> objMap = (Map<String, Object>)obj;
               
               SelectOption so = new SelectOption(String.ValueOf(objMap.get('code')), String.ValueOf(objMap.get('name')));
               if(so.getValue()=='--------------------'){
                  so.setDisabled(true); 
               }
               countrySelectOption.add(so);
           }
       }catch(exception e){
           
           countrySelectOption.add(new Selectoption('Country not available', ''));
       } 
 	}
    

}