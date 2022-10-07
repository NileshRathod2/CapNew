@isTest
public class schedulerApexExampleTest {
    @isTest
    public static void testScheduledClass(){
        List<Consultant__c> cinList = new List<Consultant__c>();
        String con_Expr =  '0 0 0 * * ?';
      //String JobId = System.Schedule('Demo scedule', con_Expr,expes);
        for(integer i =0 ; i<100 ;i++){
            if(i<55){
            cinList.add(new Consultant__c(Name = 'Schedule'+i , Type__c = 'Vendor') );
            }else
            {
              cinList.add(new Consultant__c(Name = 'Schedule'+i , Type__c = 'Vendor' , Country__c ='USA') );  
            }
        }
        insert cinList;
        
        Test.startTest();
         String JobId = System.Schedule('Demo scedule2', con_Expr, new schedulerApexExample());
        Test.stopTest();
        List<Consultant__c> updatedList = [SELECT Id , Country__c FROM Consultant__c WHERE Country__c = 'India'];
        System.assertEquals(50, updatedList.size());
    }
    

}