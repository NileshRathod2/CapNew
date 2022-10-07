public with sharing class AccountExtensionController {
    public Account acc;
    public AccountExtensionController(ApexPages.StandardController controller) {
     this.acc=(Account)controller.getRecord();
     acc.ownerId =UserInfo.getUserId();
    }
    //save method: 1) data save 2) control taken to next page -->insert/upsert --> upsert=insert+update..
    
    public pageReference save(){
           upsert acc;
           pageReference pnext= new pageReference('/apex/accountoutputpage?id= '+ acc.id);
           return pnext;
       
        }
        
         public pageReference SaveandNew(){
           upsert acc;
           pageReference pnext= new pageReference('/apex/accounteditpage');
           return pnext;
       
        }
        

}