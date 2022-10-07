public class UpdateAccountCaseTrigger {
	/*//after insert
    public void afterInsert(Map<Id, Case> newMap){
        //account to be updaated
        Set<Id> accIds= new Set<Id>();
        for(Case c: newMap.values()){
            //check case have account id
            if(c.AccountId != null){
                accIds.add(c.AccountId);
            }
        }
        
        //call update action  
        if(accIds.size()> 0){
            THIS.UpdateAccounts(accIds);
        }
 
        } */
    
    //after update
    public void afterUpdate(Map<Id, Case> oldMap){
        //account to be updaated
        Set<Id> accIds= new Set<Id>();
        for(Case c: oldMap.values()){
            //check case have account id
            if(c.AccountId != null){
                accIds.add(c.AccountId);
            }
        }
        
        //call update action  
        if(accIds.size()> 0){
            THIS.UpdateAccounts(accIds);
        }
 
        }
      //acounts to be updated
            private void UpdateAccounts(Set<Id> accountids){
                //getting accountIds based on account id 
                List<Case> accList= [SELECT Id, AccountId, Account.Id, AccountModifiedCount__c FROM Case where Id IN: accountids];
            	//List<Case> ccList=[SELECT Id, AccountId, AccountModifiedCount__c FROM Case];
                //ierating account to be updated account update count from account to case
                for(Case cc: accList){
                    cc.AccountModifiedCount__c = cc.AccountModifiedCount__c + 1;
                }

                if(accList.size()> 0){
                    update accList;
                }
            }
    }