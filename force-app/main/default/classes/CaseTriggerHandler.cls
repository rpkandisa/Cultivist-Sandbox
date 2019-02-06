public class CaseTriggerHandler{
    public static void addCaseTeamMemeber(List<Case> caseList){
        Map<Id,list<Id>> mapofCampaignContact= new Map<Id,list<Id>>();
        
        List<CampaignMember>listofCampaignmember= new List<CampaignMember>();
        List<CampaignMember>listofCampaignmembertoAdd= new List<CampaignMember>();
        
        Map<Id, List<CampaignMember>> mapofcampaignmember=new Map<Id,List<CampaignMember>>();
        for(Case c:caseList){
            
            if(mapofCampaignContact.containsKey(c.campaign__c)) {
                List<Id> usersId = mapofCampaignContact.get(c.campaign__c);
                usersId.add(c.ContactId);
                mapofCampaignContact.put(c.campaign__c, usersId);
            } else {
                mapofCampaignContact.put(c.campaign__c, new List<Id> {c.ContactId });
            }
        }
        list<Campaign> tempCampaign= [Select id, (Select id, ContactId,CampaignId, LeadId from CampaignMembers ) from Campaign where Id in: mapofCampaignContact.keyset()];
        for(Campaign camp:tempCampaign){
            
            mapofcampaignmember.put(camp.Id, camp.CampaignMembers);
        }
        
        for(Id key: mapofCampaignContact.keyset()){
            set<id> tempcon=new set<id>();
            listofCampaignMember=mapofcampaignmember.get(key);
            Set<Id>ContactIdinCampaign= new Set<Id>();
            
            for(Campaignmember camp: listofCampaignMember){
                ContactIdinCampaign.add(camp.ContactId);
            } 
            
            for(id conIDs:mapofCampaignContact.get(key)){
                
                
                
                if(!(ContactIdinCampaign.contains(conIDs) || tempcon.contains(conIDs))){ 
                    CampaignMember m= new CampaignMember ();
                    m.contactId=conIDs;
                    m.campaignId=key;
                    tempcon.add(conIDs);
                    listofCampaignmembertoAdd.add(m);
                }   
            }
        }
        if(!listofCampaignmembertoAdd.isEmpty()){
            Database.insert(listofCampaignmembertoAdd);
        }
    }
    public static void removeCaseMember(List<Case> caseList)
    {
        List <CampaignMember> cm = new List <CampaignMember>();
        list<Account> tempap = new List <Account>();
        List <Id> campId = new List <Id> ();
        List <Id> accId = new List <Id>();
        for(Case c: caseList)
        {
            campId.add(c.Campaign__c);
            accId.add(c.AccountId);
        }
        
        if(campid.size()>0)
        {
          list<Campaign> tempCampaign= [Select id, (Select id, ContactId,CampaignId, LeadId from CampaignMembers ) from Campaign where Id in: campId];
        
        if(accId.size()>0)
        {
          tempap = [SELECT id, PersonContact.Id FROM Account where id in:accId AND IsPersonAccount =: true];
        }
        if(tempCampaign.size()>0)
        {
            for(Campaign cp:tempCampaign)
            {
                for(CampaignMember cpm:cp.CampaignMembers)
                {
                    for(Case c: caseList)
                    {
                        if(cp.Id == c.Campaign__c)
                        {
                            if(c.ContactId!=null)
                            {
                            if(cpm.ContactId == c.ContactId)
                            {
                                cm.add(cpm);
                            }
                            }
                            else
                            {
                                for(Account a:tempap)
                                {
                                    if(a.PersonContactId == cpm.ContactId)
                                    {
                                        cm.add(cpm);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        }
        if(cm.size()>0)
        {
            Delete(cm);
        }
    }
}