trigger dueOnMaintain on Maintainance__c (before insert, before update) {
  List<Member__c> memb= new  List<Member__c>();
    List<Id> membId = new List<Id>();
    
    for(Maintainance__c main: trigger.new){
        membId.add(main.Member__c);
        
        for(Member__c m: [SELECT Id, MaintainaceAmountDue__c FROM Member__c where ID IN:membId ]){
            
            if(main.AmountPaid__c == true){
                m.MaintainaceAmountDue__c = 'Amount Paid';
                memb.add(m);
            }
            else{
                //(main.AmountPaid__c == false)
                m.MaintainaceAmountDue__c = 'Amount Unpaid';
                    memb.add(m);
                
            }
            
        }
    }
    update memb;
    
}