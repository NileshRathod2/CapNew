public class apexBatchExample implements Database.Batchable<sObject>{
    public integer countNumber = 0;
    //Start 
    public Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id FROM Consultant__c]);
    }
    //execute
    public void  execute (Database.BatchableContext bc , List<Consultant__c> conList){
        for(Consultant__c con : conList){
            con.Country__c = 'India';
            con.Status__c= 'approved';
        }
        update conList;
        countNumber = countNumber + conList.size();
        
    }
    //finish 
     public void  finish (Database.BatchableContext bc){
        System.debug('Total number of records processes: '+ countNumber);
    }

}