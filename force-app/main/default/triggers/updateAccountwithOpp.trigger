trigger updateAccountwithOpp on Opportunity (after insert) {
    
    List<Account> acList =new  List<Account>() ;
    
    for(Opportunity op :trigger.new){
        if(op.amount >=20000){
         
            Account ac = new Account();
            ac.Premium__c = true;
         
           ac.Id= op.AccountId ; 
             acList.add(ac);
        }
         update acList;
    }
   

}