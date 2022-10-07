public with sharing class SearchPageController {
public List<account> accList{get; set;}

public List<contact> ccList{get; set;}

public List<opportunity> oppList{get; set;}

public List<consultant__c> conList{get; set;}

//database.query(<searchString>) is used to implement dynamic SOQL, return the resultset of the SOQL  search String
    public PageReference search(){
    
    
    
   // String searchString='select id, name ,phone,rating from account where name LIKE \'%' + searchString +'%\'';
   // accList = Database.query(searchString);
    
    String searchString='select id, name, phone, email, title,leadsource from contact where name LIKE \'%' + searchString +'%\'';
    ccList = Database.query(searchString);
   // ccList=[ select name ,email,phone from contact where name LIKE '%test%' ];]
   
   
    oppList=[select id, name,stagename, leadsource from opportunity  where name LIKE '%test%'];
    conList= [select id, name, type__c from consultant__c  where name LIKE '%test%'];
    
        return null;
    }


    public String searchString { get; set; }
}