@isTest
public class testGetPendingApprovalReq {
    public static testmethod void GetPendingApprovalReq(){
        	consultant__c con= new consultant__c(Name='Nilesh' , Type__c ='vendor' , PhoneNo__c = 123456789);
        insert con;
        
   			 Leave_request__c objOpp = new Leave_request__c(Start_Date__c = Date.today() +2 , 
                                                   End_date__c = Date.today() +5,consultant__c=con.Id );
			insert objOpp;
        
            ProcessInstance objProcessInstance = [SELECT Id,TargetObjectId, CreatedDate FROM ProcessInstance WHERE TargetObjectId = :objOpp.Id];
			 Id recordId = 	objOpp.Id;									
        	 List<ProcessInstanceWorkitem> workItems = [
                                                SELECT Id, ProcessInstanceId 
                                                FROM ProcessInstanceWorkitem 
                                                WHERE ProcessInstance.TargetObjectId = :objOpp.Id ];
        List<Approval.ProcessWorkitemRequest> requests = new List<Approval.ProcessWorkitemRequest>();
        //Approve approval requests
        for(ProcessInstanceWorkitem workItem : workItems){
        	Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
            req.setWorkitemId(workItem.Id);
            req.setAction('Approve');    // Approve/Reject
            req.setComments('Your Comment.');
            requests.add(req);
        }
         
        //Reject approval requests
        for(ProcessInstanceWorkitem worksItem : workItems){
        	Approval.ProcessWorkitemRequest reqs = new Approval.ProcessWorkitemRequest();
            reqs.setWorkitemId(worksItem.Id);
            reqs.setAction('Reject');    // Approve/Reject
            reqs.setComments('Your Comment.');
            requests.add(reqs);
        }
        
        
         Test.startTest();
       	 GetPendingApprovalReq.getAllPendingApprovals();
         GetPendingApprovalReq.approvePendingApprovals(recordId);
       	 GetPendingApprovalReq.rejectPendingApprovals(recordId);
         Test.stopTest();
    }
}