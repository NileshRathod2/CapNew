trigger AvoidCreationDupEmail on Lead (before insert) {
//step1. collect data which can beusedto fire soql 
Set<String> listemail= new Set<String>();
//Set<String> listphone= new Set<String>();
    for(Lead l:trigger.new){
        listemail.add(l.Email);
       // listphone.add(l.Phone);
        
    }
    //step2.fire SOQL query and collect the result set
   List<Contact> maillist=[select id, email,phone from contact where email IN:listemail];
    
     //step3.extract duplicates values from result set
     List<String> DupEmails= new List<String>();
    for(Contact cc:maillist){
        DupEmails.add(cc.Email);
    }
      //step4. comparing recordof trigger.new with already existing duplicate record
    for(Lead l: trigger.new){
        if(DupEmails.contains(l.Email)){
            l.addError('duplicateemail recordwith same email '+ l.Email +'existin the database '+ 'please delete previous one manually');
        }
    }
        
}