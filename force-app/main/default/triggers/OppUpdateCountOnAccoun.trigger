trigger OppUpdateCountOnAccoun on Opportunity (after insert,after delete) {
    
   Set<Id> setids= new Set<Id>();
    List<Account> accListtobeUpdated = new List<Account>();
   
    //for Inserting the opportunity
    if(trigger.isAfter && trigger.isInsert){
    for(Opportunity op:trigger.new){
        setids.add(op.AccountId); 
   			 }
        }
    //for deleting the opportunity
        if(trigger.isAfter && trigger.isDelete){
    for(Opportunity op:trigger.old){
        setids.add(op.AccountId); 
   			 }
        }
    
    
    
    
    for(Account acc:[SELECT Id, Name, OpportunityUpdatingCount__c ,(SELECT Id FROM Opportunities) FROM Account where id IN:setids ]){
        
       Account ac1= new Account();
        ac1.Id = acc.Id;
        ac1.OpportunityUpdatingCount__c=acc.Opportunities.size();
        accListtobeUpdated.add(ac1);

  }
    update accListtobeUpdated;
}