trigger bankTrigger on Bank__c (after insert) {
    if(trigger.isAfter && trigger.isInsert){
    emailNotification.sendEmailViaApex(trigger.new);
        }

}