public with sharing class customoutputConController {

    public consultant__C con { get; set; }
    
   public  customoutputConController(){
   
   } 
    public consultant__C getcon(){
        ID conID=Apexpages.currentpage().getParameters().get('a005g000030EW4eAAG');
   con= [SELECT Id, Salary_band__c,  PhoneNo__c, ConsultantEmail__c, Email__c, State__c, Country__c, Date_of_birth__c, Sallary__c, Date_of_joining__c, Type__c,SSN__c, Name FROM consultant__c where id=: conID];
   return con;
    }
}