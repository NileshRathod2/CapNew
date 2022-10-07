trigger TiggerOnBanksCasecadeDelete on Bank__c (before insert) {
    //step.1 collect the data using for loop using which you can fire the soql query
    List<Id> bankID= new List<Id>();
    
    for(Bank__c b:trigger.old){
        
        bankId.add(b.Id);
        
    }

    //step2. fire the SOQL query outside the for loop and collect the result set(list)
    List<Credit_card__c> cclist = new List<Credit_card__c>();
    cclist=[SELECT id from Credit_card__c where Bank__c IN: bankID];

    //step3. process the result recieved from step2

        delete cclist;    

}