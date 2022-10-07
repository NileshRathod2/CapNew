trigger onChildLeaveRequest on consultant__c (after insert) {
    
    List<Leave_request__c> lrList= new List<Leave_request__c>();
    for(consultant__c consl:Trigger.new){
        Leave_request__c lr = new Leave_request__c();
        lr.Start_Date__c= date.today()+ 2;
        lr.End_date__c = date.today() + 5;
        lr.Status__c ='new';
        lr.consultant__c=consl.id;
        lrList.add(lr);
    }
   insert lrList;
}