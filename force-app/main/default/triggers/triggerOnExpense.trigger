trigger triggerOnExpense on Expense__c (after Insert) {
    if(trigger.isAfter && trigger.isInsert){
        afterUndelete.afterInsert(trigger.new);
    }

}