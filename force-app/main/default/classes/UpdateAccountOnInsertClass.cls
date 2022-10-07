public class UpdateAccountOnInsertClass {
    public static void updateAccountActive(List<Account> acclist){
        for(Account A: acclist){
        if(A.rating=='cold'){
            A.Active__c='Yes';
        }
        
    }

    }
}