@isTest
public class RegistrationStepFirsControllerTest {
    
    static testMethod void test(){

        RegistrationStepFirstController rsf = new RegistrationStepFirstController();
        for(Integer i = 0;i<10;i++){
          	rsf.fone = '123123123'; 
            rsf.firstname = 'name'; 
            rsf.lastName = 'lastname';
            rsf.email = 'grushai.sergii@gmail.com';
            rsf.CountryCode = 'US';
            rsf.City = 'City';
            rsf.Street = 'Street';
            rsf.PostalCode = '3452';
            rsf.foneCountryCode = '234';
            rsf.title = 'title';
            rsf.StreetSecond = 'StreetSecond';
            rsf.stateCode = 'AL';
          if(i==0)rsf.fone = ''; 
          if(i==1)rsf.firstname = '';
          if(i==2)rsf.lastName = '';
          if(i==3)rsf.email = '';
          if(i==4)rsf.CountryCode = 'null';
          if(i==5)rsf.City = '';
          if(i==6)rsf.Street = '';
          if(i==7)rsf.PostalCode = ''; 
          if(i==8)rsf.title = '';
          if(i==9)rsf.stateCode = 'aaa';  
            
          rsf.action();
        }
      
    }
   
}