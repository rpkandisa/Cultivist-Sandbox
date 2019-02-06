//created by Kandisa technologies on 23/01/2019
public with sharing class cultivistAPI {
    public static string strtoken{get;set;}
    public static Map<string,string> mapURL{get;set;}
    public static void fnFillURL(){        
        mapURL = new Map<string,string>();
        if(mapURL == null || mapURL.size() == 0){
            for(Cultivist_Config__mdt c : [select id, Value__c, MasterLabel, DeveloperName from  Cultivist_Config__mdt where Is_Active__c=true and Type__c='API Data']){
                mapURL.put(c.DeveloperName, c.Value__c);                
            }
        }
    }

    public static HttpResponse cultivistAPICallout(String reqUrl, String strMethod, string strBody, string token){
        Http h = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(reqUrl);
        request.setMethod(strMethod);
        request.setHeader('Accept','application/json');
        
        if(!string.isBlank(token)){       
            request.setHeader('Content-Type','application/json');     
            request.setHeader('Authorization','Bearer ' + token);
        }else{
            request.setHeader('Content-Type','application/x-www-form-urlencoded');
        }
        request.setBody(strBody);
        System.HttpResponse response = new System.Http().send(request);         
        return response;
    }

    public static string getToken(){   
        String reqUrl = mapURL.get('logintokenurl');
        String strbody = 'email=' + EncodingUtil.urlEncode(mapURL.get('email'),'UTF-8') + '&password=' + EncodingUtil.urlEncode(mapURL.get('password'), 'UTF-8');
        System.HttpResponse response = cultivistAPICallout(reqUrl, 'POST', strbody, ''); 
        if(response.getStatusCode() == 200){
            Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            if(m.containsKey('access_token')){
                return (string) m.get('access_token');
            }
        }
        return '';
    }

    public static void setToken(){
        fnFillURL();
        strtoken = getToken();
    }
    
    public static string refreshtoken(){        
        String reqUrl = mapURL.get('refreshurl');
        System.HttpResponse response = cultivistAPICallout(reqUrl, 'POST', '', strtoken); 
        if(response.getStatusCode() == 200){
            Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            if(m.containsKey('access_token')){
                //System.debug('token@@@@ ' + m.get('access_token'));
                return (string) m.get('access_token');
            }
        }        
        return '';
    }

   

    public static string booking(Case obj){
        setToken();

        Map<string,Integer> mapconfig = new Map<string,Integer>();
        for(Cultivist_Config__mdt c : [select id ,Record_Type__c,Record_Type_Status__c,CMS_Status__c from Cultivist_Config__mdt where Type__c='Case Record Type' order by Record_Type__c asc]){
            mapconfig.put(c.Record_Type__c.toLowerCase()+'#'+c.Record_Type_Status__c.toLowerCase(), Integer.valueOf(c.CMS_Status__c));
        }

        String reqUrl = mapURL.get('bookingurl');
        reqUrl = reqUrl.replace('{id}','1');
        String strbody = '{';
                //strbody += '"Status": ' + EncodingUtil.urlEncode(obj.Status__c, 'UTF-8') + ',';
                if(obj.RecordType.Name != null && !string.isBlank(obj.Status) && mapconfig.containsKey(obj.RecordType.Name.tolowercase()+'#'+obj.Status.toLowerCase())){
                    Integer intStatus = mapconfig.get(obj.RecordType.Name.tolowercase()+'#'+obj.Status.toLowerCase());
                    strbody += '"Status": ' + intStatus + ','; // need to confirm field 
                }else{
                    strbody += '"Status": 1,'; // need to confirm field 
                }                
                strbody += '"Date": "' + EncodingUtil.urlEncode(formatDate(obj.Service_Date__c), 'UTF-8') + '",';
                strbody += '"Member ID": "' + EncodingUtil.urlEncode(obj.CaseNumber, 'UTF-8') + '",';
                strbody += '"Event ID": "' + EncodingUtil.urlEncode(obj.Campaign__c, 'UTF-8') + '",';
                strbody += '"Time": "' + findTime(obj.CreatedDate) + '",'; 
                strbody += '"No of guests": ' + obj.Total_Guest_Count__c+ '';
                strbody += '}';
                

        //system.debug('strbody@@@###!!! ' +strbody);        
        System.HttpResponse response = cultivistAPICallout(reqUrl, 'PUT', strbody, strtoken); 
        //system.debug('res@@@###!!! ' + response);
        //system.debug('res@@@###!!! ' + response.getBody());
        Case objCase = new Case(Id = obj.Id, Cultivist_API_Exception__c='');
        if(response.getStatusCode() == 200){
            objCase.Case_API_Executed_Successfully__c = true;
            Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            //System.debug('token@@@@ ' + m);
            // pending code to set based on response
        }else{
            objCase.Case_API_Executed_Successfully__c = false;
            objCase.Cultivist_API_Exception__c = response.getBody();
        }        
        Update objCase;
        return '';
    }

    public static string user(Account obj){
        setToken();
        String reqUrl = mapURL.get('userurl');
        reqUrl = reqUrl.replace('{id}','1');
        String strbody = '{';
                strbody += '"Name": "' + obj.Name + '",';
                // strbody += '"email": "' + EncodingUtil.urlEncode(obj.PersonEmail, 'UTF-8') + '",'; 
                if(string.isNotBlank(obj.Profile_Picture__c))
                    strbody += '"Profile Picture URL": "' + obj.Profile_Picture__c + '",';
                if(string.isNotBlank(obj.Phone))
                    strbody += '"Phone": "' + obj.Phone + '",';
                
                strbody += '"Membership": {'; 
                                strbody += '"Type": "' + obj.Membership_Type__c + '",';
                                if(obj.Member_Since__c != null)
                                    strbody += '"Member Since": "' + EncodingUtil.urlEncode(formatDate(obj.Member_Since__c), 'UTF-8') + '",';
                                if(obj.Membership_Expiry_date__c != null)
                                    strbody += '"Expiry Date": "' + EncodingUtil.urlEncode(formatDate(obj.Membership_Expiry_date__c), 'UTF-8') + '",';
                                if(obj.Card_Valid_Through_Date__c != null)
                                    strbody += '"Card Expiry": "' + EncodingUtil.urlEncode(formatDate(obj.Card_Valid_Through_Date__c), 'UTF-8') + '",';
                                
                                strbody = strbody.removeEnd(',');

                strbody += '},' ;

                strbody += '"Address": {'; 
                                if(string.isNotBlank(obj.PersonMailingStreet))
                                    strbody += '"Address line 1": "' + obj.PersonMailingStreet + '",';
                                
                                strbody += '"Address line 2": "' + obj.PersonMailingStreet + '",';
                                if(string.isNotBlank(obj.PersonMailingCity))
                                    strbody += '"City": "' + obj.PersonMailingCity + '",';
                                if(string.isNotBlank(obj.PersonMailingState))
                                    strbody += '"State": "' + obj.PersonMailingState + '",';
                                if(string.isNotBlank(obj.PersonMailingPostalCode))
                                    strbody += '"Post Code": "' + obj.PersonMailingPostalCode + '",';
                                if(string.isNotBlank(obj.PersonMailingCountry))
                                    strbody += '"Country": "' + obj.PersonMailingCountry + '",';
                                strbody = strbody.removeEnd(',');
                strbody += '},' ;

                strbody += '"Liaison": {'; 
                                strbody += '"Name": "' + obj.Owner.Name + '",';
                                strbody += '"Email": "' + obj.Owner.Email + '",';
                                if(obj.Owner.Phone != null)
                                    strbody += '"Phone": "' + obj.Owner.Phone + '",';
                                if(obj.Owner.FullPhotoUrl != null)
                                    strbody += '"Photo url": "' + obj.Owner.FullPhotoUrl + '",';
                                strbody = strbody.removeEnd(',');
                strbody += '}' ;

                strbody += '}';

        
        System.HttpResponse response = cultivistAPICallout(reqUrl, 'PUT', strbody, strtoken); 
        //system.debug('res@@@###!!! ' + response);
        //system.debug('res@@@###!!! ' + response.getBody());

        Account objacc = new Account(Id = obj.Id, Cultivist_API_Exception__c='');  
        if(response.getStatusCode() == 200){
            objacc.Member_API_Executed_Successfully__c = true;
            Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            //System.debug('token@@@@ ' + m);
            // pending code to set based on response
        }   else{
            objacc.Cultivist_API_Exception__c = response.getBody();
            objacc.Member_API_Executed_Successfully__c = false;
        } 

        update objacc;

        return '';
    }

    public static String formatDate(Date d) { // change format as yyyy/mm/dd        
        return DateTime.newInstance(d.year(),d.month(),d.day()).format('YYYY-MM-dd');
    }

    public static String findTime(DateTime d) {
        return string.valueOf(d.format('HH:mm'));
    }
}