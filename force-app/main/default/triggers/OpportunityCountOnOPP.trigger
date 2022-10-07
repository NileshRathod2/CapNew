trigger OpportunityCountOnOPP on Opportunity (after insert , after Update , after Delete) {
    Map<Id,Datetime> idLastModifiedDateMap = new Map<Id,Datetime >();
    List<Datetime> childIdList = new List<Datetime>();
    Set<Id> setIdList = new Set<Id>();
    OpportunityTriggersHandler handler=new OpportunityTriggersHandler();
   
     if( Trigger.isUpdate){
        handler.afterUpdate(Trigger.oldMap);
        //last modification date/time
         for(Opportunity opps : trigger.new){
            childIdList.add(opps.LastModifiedDate); 
            System.debug('childIdList' +childIdList);
            List<Account> ParentACccList=[SELECT Id, OpportuntLastUpdated__c,
                                          (SELECT Id, LastModifiedDate FROM Opportunities where LastModifiedDate=: childIdList)
                                          FROM Account];
            List<Account> lastDate = new List<Account>();
            for(Account a: ParentACccList){ 
                for(Opportunity  op:A.Opportunities){
                    System.debug('opportunity op' +op.LastModifiedDate);
                    a.OpportuntLastUpdated__c=op.LastModifiedDate;
                    lastDate.add(a);
                    
                }
            }
            update ParentACccList;
            System.debug('last updated date and time ' +lastDate);
           
        }
        
    }
    
    
}