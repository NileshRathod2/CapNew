@isTest
public class testingConTrigger {
    public static testmethod void testingtrigger(){
        Test.startTest();
        consultant__c con =new consultant__c();
        con.Name='test';
        con.Type__c='Employee';
        con.SSN__c='9990-008-55';
        insert con;
        Test.stopTest();
        
        consultant__c c=[select id,name from consultant__c where id=:con.Id];
        system.assertEquals('Mr.Test', c.Name);
        
         consultant__c con1 =new consultant__c();
        con.Name='test';
        con.Type__c='intern';
        con.SSN__c='9990-008-55';
        insert con1;
        Test.stopTest();
        consultant__c c2=[select id,name from consultant__c where id=:con1.Id];
        system.assertEquals('Dr.Test', c2.Name);
    }
}