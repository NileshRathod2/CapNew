public class schedulerApexExample implements Schedulable {
    public void execute(SchedulableContext ct){
        List<Consultant__c> conList = [SELECT Id , Country__c FROM Consultant__c WHERE Country__c = 'USA' LIMIT 50];
        for(Consultant__c con: conList)
        {
            
            con.Country__c = 'India';
        }
        if(!conList.isEmpty()){
            update conList;
        }
    }

}