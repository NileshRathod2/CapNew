public class UpdateCasesOnAccountTrigger {
		
     //for after update
    public void afterUpdate(Map<Id, Case> oldMap){
        //account to update 
        Set<Id> accIds = new Set<Id>();
        for(Case cs: oldmap.values()){
            //check cases have account id
            if(cs.AccountId !=Null){
                //ADDING ACCOUNT IDS to the Set<Id>
                accIds.add(cs.AccountId); 
            }
        }
         //call update account actions
        if(accIds.size() > 0){
            THIS.UpdateAccounts(accIds);
        }
        
 }
      private void UpdateAccounts(Set<Id> accountids){
        //getting accound record based on account ids
        List<Account> accList =[select id , caseUpdatingCount__c,
                                (select id from Cases) FROM Account where Id IN: accountids];
        //iterating accounts to  updates case update count from child
        for(Account acc: accList){
          
            acc.caseUpdatingCount__c = acc.caseUpdatingCount__c +1;
        }
        if(accList.size()>0){
            update accList;
           
            
        }
        
    }
}