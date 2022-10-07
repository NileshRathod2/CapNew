trigger avoidConsultantDeletion on consultant__c (before delete) {
   //for every consultant record
    for(consultant__c c:trigger.old){
        //record having type is equal  to employee
        if(c.Type__c=='Employee'){
            //deletion of record
            c.adderror('You can not delete consultant record which has type is equal to  employee');
            //adding error to the field
        }         
    }
}