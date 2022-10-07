public class Nov27thclass {
		@auraEnabled
    public static void createAccount(String fname, String lname, String phone){
        Account ac= new Account();
        ac.Name=fname;
        ac.BillingCity= lname;
        ac.Phone=phone;
        insert ac;
    }
}