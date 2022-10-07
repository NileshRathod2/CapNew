trigger AvoidCreationDupAccount on Account (before insert) {
  //step1. collect data which can beusedto fire soql 
  List<String> Nameaccount= new  List<String>();
    for(Account a:trigger.new){
        Nameaccount.add(a.Name);
    }
    
    //step2.fire SOQL query and collect the result set
    List<Account> acclist=[select id, name from Account where name IN:Nameaccount];
    
    //step3.extract duplicates values from result set
    List<String> Dupnames =new List<String>();
    for(Account acc: acclist){
        Dupnames.add(acc.Name);
    }
    
    //step4. comparing recordof trigger.new with already existing duplicate record
    for(Account a: trigger.new){
        if(Dupnames.contains(a.Name)){
            a.addError('duplicateaccount record with name' + a.Name +' exist in the database');
        }
    }
}