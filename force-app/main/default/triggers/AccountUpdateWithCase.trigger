trigger AccountUpdateWithCase on Account (before insert) {
    //making List of records for update 
  List<Case> casesList = new List<Case>();
    
        Set<Id> accountIds = new Set<Id>();
       
        for(Account accountRecord : trigger.new){
            List<Case> listofCaseRecords = [Select Id, AccountLastModified__c, AccountModifiedCount__c From Case Where AccountId =: accountRecord.Id]; 
                for(Case caseRecord : listofCaseRecords){
                    caseRecord.AccountLastModified__c = accountRecord.LastModifiedDate;
                    if(caseRecord.AccountModifiedCount__c == Null){
                        caseRecord.AccountModifiedCount__c = 1;
                    }else{
                        caseRecord.AccountModifiedCount__c= ((caseRecord.AccountModifiedCount__c + 1));
                    }
                    casesList.add(caseRecord);
            }        
        }
        update casesList;
}