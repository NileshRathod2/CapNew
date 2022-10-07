trigger onConCreation on consultant__c (before insert,before update) {
    
    String QueueId= [SELECT Name, Id, Type FROM Group WHERE Type = 'Queue' AND Name = 'ServiceAgentPune'].id;
    for(consultant__c con: trigger.new){
        if(con.type__c== 'vendor'){
            // assign queue to ownerid
            //non bulkified code : for bulkified write code query outside the for loop
            //con.OwnerId= [SELECT Name, Id, Type FROM Group WHERE Type = 'Queue' AND Name = 'ServiceAgentPune'].id;
            con.OwnerId = QueueId;
            // 2. assign 20 days from today to date of joining
            
            con.Date_of_joining__c= date.today() + 20;
        }
    }
}