trigger avoidCreationOfConsultant on consultant__c (before insert) {

    
    // step1. collect the data which can fire soql query
   List<String> emailList = new List<String>(); 
    for(consultant__c c: trigger.new){
       emailList.add(c.Email__c);
    }
    //step 2. fire soql query and collect resultset
   List<Contact> consList =[Select id , email from Contact where leadsource='Partner' and Email IN:emailList];
     //step3: extract duplicate from resultset
    List<String> Dupsemail = new List<String>();
    for(Contact cc: consList){
        
             Dupsemail.add(cc.Email);
            
   }
  
    //step4: compare
    for(consultant__c c: trigger.new){
        if(Dupsemail.contains(c.Email__c)){
            c.adderror('Duplicate email exists in org'+c.Email__c+'exists in the same database');
        }  
    }
}