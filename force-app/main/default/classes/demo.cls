public with sharing class demo {
    public Boolean showOwner {get; set;}
    public Boolean showTenant {get; set;}
    
    public Member__c mem {get; set;}
    public demo(ApexPages.StandardController controller) {
        showOwner  = false;
        ID memID = ApexPages.currentPage().getParameters().get('id');
        
        if(memID !=null){
            Mem= [SELECT Id, OwnerId, FlatNumber__c, Name__c, Gender__c, FamilyCount__c, 
                  PhoneNumber__c, Email__c, AdharNumber__c, PAN_Number__c, FlatType__c, Parking__c, Owner__c,
                  MaintainaceAmountDue__c, PermanentAddress__c, ReferenceName__c, OfficeAddress__c, ReferencePhone__c,
                  RegistrationNumber__c, FamilyStatus__c, PoliceVerificationNumber__c, TenureFrom__c, TenureTo__c,
                  RentPerMonth__c, DepositAmount__c, TotalRent__c FROM Member__c where id=: memID ];
        }
        
        else{
            mem = new Member__c();
            mem.OwnerId = UserInfo.getUserID();
        }
    }
    
     public PageReference showSection(){
        if(mem.Owner__c == 'Owner'){
            showOwner = true ;
            showTenant= false;
        }
        else if(mem.Owner__c == 'Tenant'){
            showTenant= true;
            showOwner = false;
        }
        
        else{
            showOwner = false;
            showTenant= false;
        }
        return null;
        
    }
 public pageReference Save(){
        upsert mem;
        PageReference pageN = new PageReference('/apex/output?id='+mem.id);
        pageN.setRedirect(true);
        return pageN;
    }
    public pageReference SaveAndNew(){
        upsert mem;
        PageReference pageN =new pageReference('/apex/memberVF1');
        pageN.setRedirect(true);
        return pageN;
       }
    public pageReference Clonee(){
        upsert mem;
        PageReference pageN =new pageReference('/apex/memberVF1?id='+mem.id);
        pageN.setRedirect(true);
        return pageN;
       }
        
    public pageReference Cancel(){
       
        PageReference pageN =new pageReference('/a00/o');
        pageN.setRedirect(true);
        return pageN;
 
    }
    
    
    
}