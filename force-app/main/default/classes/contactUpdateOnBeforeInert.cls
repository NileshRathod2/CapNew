public class contactUpdateOnBeforeInert {
    public static void UpdateCountOnAccount(List<contact> oldList , List<contact> newList){
        Set<Id> setid= new Set<Id>();
        List<Account> accList= new List<Account>();
        for(Contact con: newList){
            if(con.AccountId != null){
                setid.add(con.AccountId);
            }
        }
        for(Contact con: oldList){
            if(con.AccountId != null){
                setid.add(con.AccountId);
            }
        }  
        for(Account acc: [SELECT Id,  ContactCount__c, Name,(SELECT Id from contacts) from Account where Id in: setid]){
            Account ac1= new Account();
            ac1.Id = acc.Id;
            ac1.ContactCount__c = acc.contacts.size();
            accList.add(ac1);
        }
        update accList;
    }
    
}