public class afterUndelete {
    /*public static void afterUndeletUpdateFiled(List<Expense__c> newList){
        List<Expense__c> exToBeUpadted = new List<Expense__c>();
        for(Expense__c ex:newList){
            Expense__c ex1 = new Expense__c();
            ex1.id = ex.Id;
            ex1.OA__c = 1255;
            exToBeUpadted.add(ex1);
        }
        if(!exToBeUpadted.isEmpty()){
            update exToBeUpadted;
        }
    }*/
      public static void afterInsert(List<Expense__c> listOfResignationRecords){
           
       User submitterUser = [Select Id, Email,Name From User Where Id =: userInfo.getUserId()];
           for(Expense__c ignation : listOfResignationRecords){ 
               Approval.ProcessSubmitRequest request = new Approval.ProcessSubmitRequest();
               request.setComments('Submitting request for approval.');
               request.setObjectId(ignation.Id);
               request.setSubmitterId(submitterUser.Id);             
               request.setProcessDefinitionNameOrId('Resignation_Approval_ProcessV1');
               request.setSkipEntryCriteria(true);
                
                Approval.ProcessResult result = Approval.process(request);

           }

       }

}