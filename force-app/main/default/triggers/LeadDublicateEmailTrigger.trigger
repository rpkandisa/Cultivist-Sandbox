trigger LeadDublicateEmailTrigger on Lead (before insert, before update) {
    Set<String> newLeadEmails =new set<String>();
    for(Lead l:Trigger.new){
       if(!string.isBlank(l.Email))
       if(!newLeadEmails.add(l.Email.toLowerCase())){
           //l.Email.addError('List of youre lead contain identical email!'); 
       }
    }

    Map<String,Lead> leadsMap=new Map<String,Lead>();
    for(Lead l:[SELECT id, Email FROM Lead WHERE Email IN:newLeadEmails]){
        leadsMap.put(l.Email.toLowerCase(), l);
    }
    for (Lead leadNew : Trigger.new) {
        if(leadsMap.containsKey(leadNew.Email.toLowerCase())) {
            //leadNew.Email.addError('Lead With email '+leadNew.Email.toLowerCase()+'  alredy exist! Lead id : '+leadsMap.get(leadNew.Email).id);
        }     
    }
}