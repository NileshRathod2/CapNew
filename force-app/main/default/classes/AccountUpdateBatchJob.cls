global class AccountUpdateBatchJob  implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        String query = 'SELECT Id, Name from Account';
        return Database.getQueryLocator(query);
        
    }
    global void execute(Database.BatchableContext BC , List<Account> scope)
    {
        for(Account a: scope)
        {
            a.name=a.name +'_UpdatedByBatchJobOn25Oct';
        }
        update scope;
    }
    global void finish(Database.BatchableContext BC){
        //Optional 
        //write a code to share email to admin when the process is complete
    }
}