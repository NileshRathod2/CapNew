trigger updateContactCountOnAccount on Contact (after insert,after delete) {
    
    Set<Id> setid= new Set<Id>();
    List<Account> accList= new List<Account>();
    //for insert
    if(trigger.isAfter && trigger.isInsert){  
    for(Contact c:trigger.new){
    
    setid.add(c.AccountId);
    }
}
    
    //for delete
     if(trigger.isAfter && trigger.isDelete){  
    for(Contact c:trigger.old){
    
    setid.add(c.AccountId);
    }
}
    
    for(Account acc: [SELECT Id,  ContactCount__c, Name,(SELECT Id from contacts) from Account where Id in: setid]){
        Account ac1= new Account();
        ac1.Id = acc.Id;
        ac1.ContactCount__c = acc.contacts.size();
        accList.add(ac1);
    }
    update accList;
    

}