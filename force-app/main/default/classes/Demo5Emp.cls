public class Demo5Emp {

    public static void PopulateSalaeyEmp(){
         
        List<Account> accItems = [SELECT Id, TotalSalaryOfEmp__c,
                                  (SELECT Id, Salary__c FROM Employyes__r) FROM Account ];
        
        if(!accItems.isEmpty()){
            for(Account ac:accItems){
                Decimal TotalSal = 0;
                for(Employee__c emp: ac.Employyes__r){
                    TotalSal = TotalSal + emp.Salary__c;
                   
                    
                }
                ac.EmpCountNumber__c =ac.Employyes__r.size();
                ac.TotalSalaryOfEmp__c = TotalSal;
            }
        }
        if(!accItems.isEmpty()){
            update accItems;
        }
        
        
    }
}
/*public class ExpesesController{
    public  void submitForApproval(Expense__c exp){
        
        //create an approval request for the Expenses
        
        Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
        req1.setComments('Submitted for approval.please aprrove');
        req1.setObjectId(exp.id);
        
        //submit the approval request for processing 
        Approval.ProcessResult result =  Approval.ProcessResult(req1);
        //display if request was successful
        System.debug('Submitted for approval successfully:' +result.isSuccess());
        
    }

}
*/