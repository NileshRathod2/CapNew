trigger UpdateCasesOnAccount on Case (after insert, after update, after delete) {
 Set<Id> SetIds = new Set<Id>();
  List<Account> accList = new List<Account>(); 
    //for after insert 
    if(trigger.isAfter && trigger.isInsert ){
        for(Case c:trigger.new){ 
            SetIds.add(c.AccountId);
        }
    }
    
    //for after update 
    if(trigger.isAfter && trigger.isDelete ){
        for(Case c:trigger.old){ 
            SetIds.add(c.AccountId);
        }
    }
    
    
        for(Account acc:[SELECT Id, Name, caseUpdatingCount__c , (SELECT id from cases) FROM Account where id IN: SetIds]){
            
            Account ac1 = new Account();
            ac1.Id= acc.Id;
            ac1.caseUpdatingCount__c=acc.cases.size();
            accList.add(ac1);
        }
        update accList;
        
    
}