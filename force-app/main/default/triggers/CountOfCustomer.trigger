trigger CountOfCustomer on Customer__c (after insert) {
    Set<Id> idItems = new Set<Id>();
    List<Account> accItems = new List<Account>();
    for(Customer__c c:trigger.new){
        idItems.add(c.Account__c);
} 
    for(Account ac:[SELECT Id , Name, CustomerCount__c, (SELECT  Id, Name FROM Customers__r ) FROM Account where id IN:idItems]){
        Account ac1 = new Account();
        ac1.Id=ac.Id;
        ac1.CustomerCount__c= ac.Customers__r.size();
        accItems.add(ac1);
        
    }
    update accItems;
        }