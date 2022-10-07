trigger caseObjectTrigges on Case (before insert) {
    for(Case cs:trigger.new){
        if(cs.Origin == 'phone' && cs.Status == 'Escalated'){
            //1.assigne 'service agent pune' queue to owner
            // Group g= [SELECT Id, Name, Type FROM Group where Type = 'Queue' AND Name ='ServiceAgentPune'];
            // cs.OwnerId= g.id;
            cs.OwnerId =[SELECT Id, Name, Type FROM Group where Type = 'Queue' AND Name ='ServiceAgentPune'].id;
            
            //2.assign two days from today as expect4ed closed date
            cs.ExpectedClosedDate__c= date.today() + 2;
            
        }
            
        }
    }