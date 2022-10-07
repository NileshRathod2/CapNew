public class approvalProcess {
    public static void autoSubmitLeaveRequest(List<Leave_request__c> listofRecords){
        //SOQL Query to get current User
        User submitterUser =[SELECT Id, Name ,Email FROM User WHERE Id =: userInfo.getUserId()];
        for(Leave_request__c leave: listofRecords){
            
            Approval.ProcessSubmitRequest request = new Approval.ProcessSubmitRequest();
             request.setObjectId(leave.Id);
             request.setSubmitterid(submitterUser.Id);
             Approval.ProcessResult result = Approval.Process(request);

        }
        
    }
    
 
}