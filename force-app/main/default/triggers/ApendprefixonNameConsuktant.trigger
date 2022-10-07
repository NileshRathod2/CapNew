trigger ApendprefixonNameConsuktant on consultant__c (before insert) {
    for(consultant__c con:trigger.new){
        if(con.type__c=='Employee'){
            con.Name = 'Mr.'+con.Name;
            
        }
        else if(con.Type__c=='vendor'){
            con.Name= 'Pr.'+con.Name;
        }
    }
}