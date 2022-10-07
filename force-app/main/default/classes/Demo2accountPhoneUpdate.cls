public class Demo2accountPhoneUpdate {
	
    public static void updatePhoneOnAccount(){
        List<Account> AccItemstObeUpdate = new List<Account>();
        
        for(Account ac: [SELECT id , name from Account where createdDate = LAST_MONTH]){
            
            ac.Phone = '11112222';
            AccItemstObeUpdate.add(ac);
        }
        
        if(AccItemstObeUpdate.size() > 0){
            update AccItemstObeUpdate;
        }
    }
}