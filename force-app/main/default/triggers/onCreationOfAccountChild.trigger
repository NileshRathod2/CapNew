trigger onCreationOfAccountChild on Account (before insert) {

    List<Contact> ct= new List<Contact>();
    for(Account acc:trigger.new){
        if(acc.Rating=='hot' & acc.Industry=='Banking'){
         Contact c= new contact();
        c.LastName=acc.Name;
     
        ct.add(c);
        
    }
        insert ct;
}
}