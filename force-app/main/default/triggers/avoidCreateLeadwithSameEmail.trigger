trigger avoidCreateLeadwithSameEmail on Lead (before insert) {
/* 1>. collect data and fire query */
        Set<String> emSet = new Set<String>();
    Set<String> phoneSet = new Set<String>();
   
      for(Lead le : trigger.new){
        emSet.add(le.email);
          phoneSet.add(le.Phone);
    }
     /* 2> fire the query and collect the on basis of query */
    List<Lead> leadList = new List<Lead>();
    
     leadList= [SELECT id, name, email from Lead where phone IN:phoneSet OR email IN:emSet ];
       
    
    
    
     /* comparing the old data with new data */
    for(Lead le:trigger.new){
        if(leadList.size() > 0){
            le.Phone.adderror('You cannot create a lead record with dup email' +le.Email+'and duplicate phone'+le.Phone+'Please contact your system administrator');
       }
    }

}