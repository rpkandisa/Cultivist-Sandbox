@isTest
public class LeadDublicateEmailTriggerTest {

    @isTest
    static void leadDublicateEmailTrigger(){
    Lead lead = new Lead(LastName = 'last name',Company = 'company',Email ='teastMaletest@mail.ru');
    Lead leadSecond = new Lead(LastName = 'last name',Company = 'company',Email ='teastMaletest@mail.ru');
    List <Lead> leads = new List <Lead>{lead,leadSecond};    
        try{  
            upsert leads;
        }catch(exception e){
           // system.assertEquals('Upsert failed. First exception on row 1; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, List of youre lead contain identical email!: [Email]', e.getMessage());
        }    
    }
    
    @isTest
    static void leadDublicateEmailTriggerSecond(){
    Lead lead = new Lead(LastName = 'last name',Company = 'company',Email = 'teAstMaletest@mail.ru');
    Lead leadSecond = new Lead(LastName = 'last name',Company = 'company',Email ='Teastmaletest@mail.ru');
    upsert lead;
    Test.startTest();
        try{
            upsert leadSecond;
        }catch(exception e){
            //system.assertEquals('Upsert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, Lead With email '+leadSecond.email.toLowerCase()+'  alredy exist! Lead id : '+lead.id+': [Email]', e.getMessage());
        } 
    test.stopTest();    
    }
}