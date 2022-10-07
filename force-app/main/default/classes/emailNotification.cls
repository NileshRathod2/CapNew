public class emailNotification {
    public static void sendEmailViaApex(List<Bank__c> bankList){
        List<Messaging.Email> emailList = new List<Messaging.Email>();
        for(Bank__c b:bankList){
            if(b.Email__c != null){
                Messaging.SingleEmailMessage email= new Messaging.SingleEmailMessage();
                //set address
                String[] emailAddresssList = new String[]{b.Email__c};
                email.setToAddresses(emailAddresssList);
                // set sub 
                String sub = 'bank Name ' +b.Name;
                email.setSubject(sub);
                //set body 
                String body= 'welcome to our bank: ' +b.Account_Holder_Names__c+
                    '<br/>'
                    + 'thank you ';
                email.setHtmlBody(body);
                emailList.add(email);
            }
        }
        Messaging.sendEmail(emailList);
    }

}