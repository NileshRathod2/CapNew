public class OpportunityTriggersHandler {
  /*	// after insert
    public void afterInsert(Map<Id, Opportunity> newMap){
        //account to update
        Set<Id> accIds = new Set<Id>();
        for(Opportunity opp: newMap.values()){
            //check opp have account id
            if(opp.AccountId !=Null){
                //ADDING ACCOUNT IDS to the Set<Id>
                accIds.add(opp.AccountId); 
            }
        }
        //call update account actions
        if(accIds.size() > 0){
            THIS.UpdateAccounts(accIds);
        }
    }
    // for after delete
    public void afterDelete(Map<Id, Opportunity> oldMap){
        //account to update
        Set<Id> accIds = new Set<Id>();
        for(Opportunity opp: oldMap.values()){
            //check opp have account id
            if(opp.AccountId !=Null){
                //ADDING ACCOUNT IDS to the Set<Id>
                accIds.add(opp.AccountId); 
            }
        } 
        //call update account actions
        if(accIds.size() > 0){
            THIS.UpdateAccounts(accIds);
        }
    } */
    
    //for after update
     public void afterUpdate(Map<Id, Opportunity> oldMap){
        //account to update 
        Set<Id> accIds = new Set<Id>();
        for(Opportunity opp: oldMap.values()){
            //check opp have account id
            if(opp.AccountId !=Null){
                //ADDING ACCOUNT IDS to the Set<Id>
                accIds.add(opp.AccountId); 
            }
        }
        //call update account actions
        if(accIds.size() > 0){
            THIS.UpdateAccounts(accIds);
        }
    }
    
    //Accounts to be updated
    
    private void UpdateAccounts(Set<Id> accountids){
        //getting accound record based on account ids
        List<Account> accList =[select id , OpportunityUpdatingCount__c,
                                (select id from Opportunities) FROM Account where Id IN:accountids];
        //iterating accounts to  updates opportunity update count from child to contact
        for(Account acc: accList){
            //acc.OpportunityUpdatingCount__c = acc.Opportunities.size();
            //acc.OpportunityUpdatingCount__c =  ???OpportunityUpdatingCount__c value + 1;
            acc.OpportunityUpdatingCount__c = acc.OpportunityUpdatingCount__c +1;
        }
        if(accList.size()>0){
            update accList;
           
            
        }
        
    }
}