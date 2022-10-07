trigger DeleteMember on Member__c (before Delete) {
    
    for(Member__c m: trigger.old){
        if(m.MaintainaceAmountDue__c == 'Amount Unpaid'){
            Trigger.oldMap.get(m.Id).addError('Cannot delete member record because maintainance amount is unpaid...');
            //m.addError('Cannot delete member record because maintainance amount is unpaid...');
        }
    }

}