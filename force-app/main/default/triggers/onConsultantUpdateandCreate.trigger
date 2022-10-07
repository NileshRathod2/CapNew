trigger onConsultantUpdateandCreate on consultant__c (before insert , before update) {
    String UserId = [SELECT Id, Name FROM User where name='Premium User'].id;
    String QueueId= [SELECT Name, Id, Type FROM Group WHERE Type = 'Queue' AND Name = 'ServiceAgentPune'].id;
    for(consultant__c cons : trigger.new){
        if(cons.Type__c =='Employee' && cons.Sallary__c >=20000){
          cons.OwnerId= UserId;  
        }
        
        
         if(cons.type__c== 'vendor'){
            // assign queue to ownerid
            //non bulkified code : for bulkified write code query outside the for loop
            //con.OwnerId= [SELECT Name, Id, Type FROM Group WHERE Type = 'Queue' AND Name = 'ServiceAgentPune'].id;
            cons.OwnerId = QueueId;
            // 2. assign 20 days from today to date of joining
            
            cons.Date_of_joining__c= date.today() + 20;
             cons.Name= 'Pr.'+cons.Name;
        }
        
    }

}