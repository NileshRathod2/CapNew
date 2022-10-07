trigger autoSubmitForApproval on Leave_request__c (after insert) {
    if(trigger.isAfter && trigger.isInsert){
         approvalProcess.autoSubmitLeaveRequest(trigger.new);
    }
   
}