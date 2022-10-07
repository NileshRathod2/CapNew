public with sharing class GetPendingApprovalReq {
    
    
	@AuraEnabled(cacheable=true)
    public static List<pendingApprovalWrapperClass> getAllPendingApprovals() {
		Id currentUserid = UserInfo.getUserId(); 
        List<pendingApprovalWrapperClass> pendingApprovalList = new List<pendingApprovalWrapperClass>();
        for (ProcessInstance pi: [SELECT Id, Status, TargetObjectId,SubmittedById,SubmittedBy.Name, TargetObject.Name,
                                 (SELECT Id, ActorId, Actor.Name, OriginalActorId, OriginalActor.Name, StepStatus, Comments, ProcessNode.Name, CreatedDate 
                                  FROM StepsAndWorkitems WHERE StepStatus =: 'Pending' AND ActorId =: currentUserid) 
                                  FROM ProcessInstance WHERE Status =: 'Pending' ORDER BY TargetObjectId] ) {
 
           for (ProcessInstanceHistory pihistory : pi.StepsAndWorkItems) {
            pendingApprovalWrapperClass pendingApprovalWrap = new pendingApprovalWrapperClass();
               pendingApprovalWrap.Status = pi.Status;
               pendingApprovalWrap.RecordName = pi.TargetObject.Name;
               pendingApprovalWrap.RecordId = String.valueOf(pi.TargetObjectId);
               pendingApprovalWrap.Submitter = String.valueOf(pi.SubmittedBy.Name);
               pendingApprovalWrap.RecordObject = String.valueOf(pi.TargetObjectId.getSObjectType()).split('__')[0];
               pendingApprovalWrap.AssignedToName = String.valueOf(pihistory.OriginalActor.Name);
               pendingApprovalWrap.ApproverName = pihistory.Actor.Name;
               pendingApprovalWrap.CreatedDate = String.valueOf(pihistory.CreatedDate);
               pendingApprovalList.add(pendingApprovalWrap);
           }          
       }
       /*
        if(!pendingApprovalList.isEmpty()){
            String emailName = System.Label.EmailToConsultantAfterOneHour;
            List<Messaging.Email> emailList = new List<Messaging.Email>();
                EmailTemplate emailTemplate = [Select Id,Subject,Description,HtmlValue,DeveloperName,Body 
                                                from EmailTemplate 
                                                where DeveloperName =: emailName];
            OrgWideEmailAddress orgWideEmail = new OrgWideEmailAddress();
            orgWideEmail = [SELECT Id, Address, DisplayName FROM 
					OrgWideEmailAddress WHERE DisplayName='NAMMAN Team'];
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            	message.setOrgWideEmailAddressId(orgWideEmail.Id);
                String[] emailAddresssList = new string[]{'abhijeet@drizzleit.org','rathodnil401@gmail.com'};
                message.setToAddresses(emailAddresssList);
                message.setTemplateID(emailTemplate.Id);
                message.targetobjectid = currentUserid;
                message.setSaveAsActivity(false);
               // Id id = message.getWhatId();
               // message.setWhatId(request.processdefinitionnameorid);
                emailList.add(message);
                Messaging.sendEmail(emailList);
            }
        */
 
       return pendingApprovalList;
    }
	 @AuraEnabled
    public static void approvePendingApprovals(Id recordId ){
         List<ProcessInstanceWorkitem> workItems = [
                                                SELECT Id, ProcessInstanceId 
                                                FROM ProcessInstanceWorkitem 
                                                WHERE ProcessInstance.TargetObjectId = :recordId ];
         List<Approval.ProcessWorkitemRequest> requests = new List<Approval.ProcessWorkitemRequest>();
        for(ProcessInstanceWorkitem workItem : workItems){
            Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
            req.setWorkitemId(workItem.Id);
            req.setAction('Approve');    // Approve/Reject
            req.setComments('Your Comment.');
            requests.add(req);
                }
        Approval.ProcessResult[] processResults = Approval.process(requests);
        }
    
    @AuraEnabled
    public static void rejectPendingApprovals(Id recordId ){
         List<ProcessInstanceWorkitem> workItems = [
                                                SELECT Id, ProcessInstanceId 
                                                FROM ProcessInstanceWorkitem 
                                                WHERE ProcessInstance.TargetObjectId = :recordId ];
         List<Approval.ProcessWorkitemRequest> requests = new List<Approval.ProcessWorkitemRequest>();
        for(ProcessInstanceWorkitem workItem : workItems){
            Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
            req.setWorkitemId(workItem.Id);
            req.setAction('Reject');    // Approve/Reject
            req.setComments('Your Comment.');
            requests.add(req);
                }
        Approval.ProcessResult[] processResults = Approval.process(requests);
        }
	
    public class pendingApprovalWrapperClass{
		@AuraEnabled
        public String Status {get; set;}
		@AuraEnabled
        public String RecordName {get; set;}
		@AuraEnabled
        public String RecordId {get; set;}
		@AuraEnabled
        public String RecordObject {get; set;}
		@AuraEnabled
        public String AssignedToName {get; set;}
		@AuraEnabled
        public String ApproverName {get; set;}
		@AuraEnabled
        public String CreatedDate {get; set;}
        @AuraEnabled
        public String Submitter {get; set;}
      
    }
        
}