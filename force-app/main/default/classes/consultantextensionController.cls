public with sharing class consultantextensionController {
    public consultant__c con;
    public consultantextensionController(ApexPages.StandardController controller) {
        this.con=(consultant__c)controller.getRecord();
     con.ownerId =UserInfo.getUserId();
    }
    
     public pageReference save(){
           upsert con;
           pageReference pnext= new pageReference('/apex/assignmentstandardcontrolleroutput?id= '+ con.id);
           return pnext;
       
        }

}