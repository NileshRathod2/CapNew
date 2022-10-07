trigger onConustantSingleCode on consultant__c (before insert, before update,after insert,before delete) {
   //For before insert
    if(trigger.isBefore && trigger.isInsert || trigger.isUpdate){ 
    String UserId = [SELECT Id, Name FROM User where name='Premium User'].id;
    String QueueId= [SELECT Name, Id, Type FROM Group WHERE Type = 'Queue' AND Name = 'ServiceAgentPune'].id; 
        
        
         
    // step1. collect the data which can fire soql query
      List<String> emailList = new List<String>(); 
        
    for(consultant__c cons : trigger.new ){        
          if(cons.Type__c =='Employee' && cons.Sallary__c >=20000){
          cons.OwnerId= UserId;  
        }
          if(cons.type__c== 'vendor'){
            // assign queue to ownerid
            //non bulkified code : for bulkified write code query outside the for loop
            //con.OwnerId= [SELECT Name, Id, Type FROM Group WHERE Type = 'Queue' AND Name = 'ServiceAgentPune'].id;
            cons.OwnerId = QueueId;
            // 2. assign 20 days from today to date of joining
            
            cons.Date_of_joining__c= date.today() + 20;
             cons.Name= 'Pr.'+cons.Name;
           } 
         emailList.add(cons.Email__c);
        }
        
        //step 2. fire soql query and collect resultset
   List<Contact> consList =[Select id , email from Contact where  Email IN:emailList];
     //step3: extract duplicate from resultset
    List<String> Dupsemail = new List<String>();
    for(Contact cc: consList){
     Dupsemail.add(cc.Email);       
   }
  
    //step4: compare
    for(consultant__c cons: trigger.new){
        if(Dupsemail.contains(cons.Email__c)){
            cons.adderror('Duplicate email exists in org'+cons.Email__c+'exists in the same database');
        }  
    }
        
    }   
    //for before delete
    if(trigger.isBefore && trigger.isDelete){
           //for every consultant record
    for(consultant__c c:trigger.old){
        //record having type is equal  to employee
        if(c.Type__c=='Employee'){
            //deletion of record
            c.adderror('You can not delete consultant record which has type is equal to  employee');
            //adding error to the field
        }         
    }      
    }

  //after insert  
 if(trigger.isAfter && trigger.isInsert){
      List<Leave_request__c> lrList= new List<Leave_request__c>();
     for(consultant__c cons:Trigger.new){
        Leave_request__c lr = new Leave_request__c();
        lr.Start_Date__c= date.today()+ 2;
        lr.End_date__c = date.today() + 5;
        lr.Status__c ='new';
        lr.consultant__c=cons.id;
        lrList.add(lr);
        }
      insert lrList;

 }
   
}