public with sharing class Controller {
         public Member__c mem {get; set;}
         
    public Controller(ApexPages.StandardController controller) {
        this.mem= (Member__c )controller.getRecord();
    }
     public pageReference Clonee(){
        upsert mem;
        PageReference pageN =new pageReference('/apex/memberVF1?id='+mem.id);
        pageN.setRedirect(true);
        return pageN;
       }
       
       public pageReference Edit(){
        upsert mem;
        PageReference pageN =new pageReference('/apex/memberVF1?id='+mem.id);
        pageN.setRedirect(true);
        return pageN;
       }
}