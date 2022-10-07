/*updaye the active field on account to 'yes' if an account record is created with rating ='cold'
  reuseable method
 without using class
 */

trigger UpdateAccountRating on Account (before insert) {
    
    UpdateAccountOnInsertClass.updateAccountActive(trigger.new);
    /* for(Account A: trigger.new){
        if(A.rating=='cold'){
            A.Active__c='Yes';
        }
    }*/
}