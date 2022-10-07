trigger SumOfTheAmount on Contact (before insert) {
    
    List<Account> accItems =[SELECT Id, Name, TotalAmmount__c ,(SELECT Id, Amount__c, Name FROM contacts) FROM Account ];

}