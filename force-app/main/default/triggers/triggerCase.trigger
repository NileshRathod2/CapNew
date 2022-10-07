trigger triggerCase on Case (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        caseHandler.caseUpdate(trigger.new);
    }

}