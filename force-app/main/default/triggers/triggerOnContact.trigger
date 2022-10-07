trigger triggerOnContact on Contact (after insert, after delete) {
   if(trigger.isAfter){
            if(trigger.isInsert || trigger.isDelete){
        contactUpdateOnBeforeInert.UpdateCountOnAccount(trigger.old,trigger.new);
    }
   }
}