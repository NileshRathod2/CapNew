@isTest
public class sectionDetailsControllerTest {
    public static testmethod void  sectionDetailsControlle(){
        Contact cont = new Contact(FirstName='test',LastName='Tests', Department='Salesforce', 
                                  LeadSource='web', Description='Salesforce Test', HomePhone='2201933',
                                  OtherPhone='10126376', Phone= '987654432');  
         insert cont;
        
        String conId=cont.Id;
        
        Set<String> SobjectFields = Schema.getGlobalDescribe().get('Contact').getDescribe().fields.getMap().keySet();    
        
        Contact con =Database.query('SELECT ' + String.join(new List<String>(SobjectFields), ',') + ' FROM Contact WHERE Id = \'' + conId + '\'');
        
         Test.startTest();
       	 sectionDetailsController sc = new sectionDetailsController();
           sc.getcon();
        // GetPendingApprovalReq.approvePendingApprovals(recordId);
       	 //GetPendingApprovalReq.rejectPendingApprovals(recordId);
         Test.stopTest();
    }
    
}