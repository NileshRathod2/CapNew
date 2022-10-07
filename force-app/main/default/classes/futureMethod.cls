public class futureMethod {
    @future 
    public static void futuremethods(List<id> accIds){
        List<Account> accList = [SELECT Id, (SELECT Id  from contacts)
                                from Account WHERE Id IN: accIds];
        for(Account acc: accList){
            acc.ContactCount__c = acc.Contacts.size();
        }
        
        if(!accList.isEmpty()){
            update accList;
        }
        
    }

}