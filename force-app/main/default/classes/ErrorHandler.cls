public class ErrorHandler {
	    public static void sendApiRequest(Map<Id, Account> oldMap ,Map<Id, Account> newMap){
         List<Account> listUpdatedAccounts = new List<Account>();
            for(Id accountId : newMap.keyset()){
                Account oldAccountId = oldMap.get(accountId);
                Account newAccountId = newMap.get(accountId);
            
         if(newAccountId.Corporate_Contracted__c == true  && newAccountId.Name !=null){
                newAccountId.Corporate_Contracted__c= false;
             
         }
                listUpdatedAccounts.add(newAccountId); 
    }
           
           update listUpdatedAccounts;
    
}       
            
}