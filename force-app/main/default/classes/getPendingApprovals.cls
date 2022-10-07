public with sharing class getPendingApprovals {
    public static List<ProcessInstance> getAllPendingApprovals(){
        Id Current_User_id = UserInfo.getUserId();
            
        return [SELECT Id,ProcessDefinitionId,Status,SubmittedById,SystemModstamp,TargetObjectId,
               (SELECT ID, ProcessNodeId, StepStatus,Comments,TargetObjectId,ActorId,CreatedById,OriginalActorId,ProcessInstanceId,CreatedDate 
				FROM StepsAndWorkitems 
                WHERE StepStatus=: 'Pending' AND ActorId =: Current_User_id ) 
                FROM ProcessInstance 
                WHERE Status =: 'Pending'];
        
        
    }
}