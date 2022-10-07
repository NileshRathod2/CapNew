public with sharing class demoTableController {

    public List<contact> conList { get; set; }

    public List<opportunity> oppList { get; set; }

    public List<Account> accList { get; set; }
    
    public demoTableController(){
    accList=[select name,rating, phone from Account limit 10];
    
    oppList=[select name, type, leadsource from opportunity limit 10];
    
    conList=[select name, department, leadsource, phone from contact limit 10];
    }
}