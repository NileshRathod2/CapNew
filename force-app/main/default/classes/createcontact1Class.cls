public class createcontact1Class {
	@auraEnabled
    public static Id createContact(String fname, String lname, String phone, String email, String accountId){
        
        Contact con = new Contact();
        con.FirstName = fname;
        con.LastName = lname;
        con.Email = email;
        con.Phone = phone;
        con.AccountId = accountId;
        Insert con;
        return con.Id;
    }
}