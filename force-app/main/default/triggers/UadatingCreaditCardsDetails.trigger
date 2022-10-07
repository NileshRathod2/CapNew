trigger UadatingCreaditCardsDetails on Credit_card__c (after insert, after update) {
    if(trigger.isAfter){
        List<Credit_card__c> ccList = new List<Credit_card__c> ();
        Set<Id> bankIdsSet = new  Set<Id>();
        ccList = Trigger.new;
        //List<sObject> == List<credit card>
        for(Credit_card__c cc: ccList){
            if(cc.Bank__c != Null){
                bankIdsSet.add(cc.Bank__c);
            }
        }   
    }

}