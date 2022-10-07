trigger onLeadCreation on Lead (before insert) {
    for(Lead L: trigger.new){
        if(L.leadsource=='web'){
            L.Rating=('Warm');
        }
    }
}