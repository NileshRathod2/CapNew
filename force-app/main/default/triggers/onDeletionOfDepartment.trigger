trigger onDeletionOfDepartment on Department__c (before delete) {
  // bulkified code
    // step 1: coolect thedata using for loop using which u can fire the soql query
    List<ID> DepId = new List<ID>();
    for(Department__c d: trigger.old){
        DepID.add(d.Id);
    }
    //step2:fire the soql query outside the for loop and collect resultset in a collection (list)
    List<Employee__c> Emplist = [select id from Employee__c  where DepartmentName__c IN:DepID and Type__c='intern'];
    delete Emplist;
}