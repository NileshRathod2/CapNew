public class newUser{
    @future
    public static void createUser(
        String uName , String al ,String em , String lName){
            Profile p = [SELECT Id , Name FROM Profile WHERE Name = 'Standard Platform User'];
            UserRole user= [SELECT Id , Name FROM UserRole WHERE Name = 'CFO'];
            // Create user 
            User u = new User(alias=al,email= em, EmailEncodingKey = 'UTF-8',LastName=lName,
                              LanguageLocaleKey = 'en_US',
                              LocaleSidKey ='en_US',ProfileId = p.Id,
                              UserRoleId = user.Id,
                              TimeZoneSidKey ='America/New_York',
                              Username = uName);
            insert u;
            
        }
    
}