public class nov27th2class {
    @auraEnabled
    public static void createContact(String fname ,String lname, String Phone, String email){
        Contact cc= new Contact();
            cc.FirstName=fname;
            cc.LastName=lname;
            cc.Phone=phone;
            cc.Email=email;
            insert cc;
    }

}