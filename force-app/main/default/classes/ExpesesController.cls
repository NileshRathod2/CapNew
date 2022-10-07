public class ExpesesController {
   @auraEnabled
    public static void createExpenses(String EName, String Transport,Date ExpenseDate,Decimal TeaExp ,String ExpComments ){
        Expens__c ex = new Expens__c();
        ex.Name = EName;
        ex.ExpensesDate__c=ExpenseDate;
        ex.ModeOfTransport__c=Transport;
        ex.TA__c= TeaExp;
        //ex.OA__c=OtherExp;
        ex.Expense_Comments__c=ExpComments;
        insert ex;
    }

}