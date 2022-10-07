public with sharing class customConController {

    public pagereference save(){
    upsert con;
    pagereference pnext= new pagereference('/apex/conoutputcustom?id=' +con.id);
    pnext.setRedirect(true);
    return pnext;
    
    }

public consultant__c con{set; get;}
    public customConController(){
    con = new consultant__c();
    con.ownerid= userInfo.getUserId();
    
    }
}