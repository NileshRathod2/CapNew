public class sectionDetailsController {
    public List<section> lstsections;
    public string label {get ;set;}
    public static String conId {get; set;}
    public  Attachment generatePDF {get; set;}
    //public String conId {get;set;}
    
    //Get Section and SectionField using metadata
    @AuraEnabled
    public static List<Section> getlstsections(){
        Map<String, Schema.SObjectField> mapFieldAPIName_FieldSchema = Schema.getGlobalDescribe().get('Contact').getDescribe().fields.getMap();
        
        List<Metadata.Metadata> layouts = Metadata.Operations.retrieve(Metadata.MetadataType.Layout, 
                                                                       new List<String> {'Contact-Contact (Sales) Layout'});
        Metadata.Layout layoutMd = (Metadata.Layout)layouts.get(0);
        
        List<Section> lstSections = new List<Section>();
        
        for (Metadata.LayoutSection layoutSection : layoutMd.layoutSections) {
            	Section sect = new Section();
           	    sect.label = layoutSection.label;
            	sect.sectionFields = new List<SectionField>();
            
            for (Metadata.LayoutColumn column : layoutSection.layoutColumns) {
                if (column.layoutItems != null) {
                    for (Metadata.LayoutItem item : column.layoutItems) {
                       	 	SectionField sectField = new SectionField();	
                       	 	sectField.apiName = item.field;
                        if(sectField.apiName == 'MailingAddress'){       
                            sectField.apiName ='MailingStreet';  
                        }
                        else if(sectField.apiName == 'OtherAddress'){
                            sectField.apiName = 'OtherStreet';
                        }
                        sectField.label = mapFieldAPIName_FieldSchema.get(item.field).getDescribe().getLabel();
                        	sect.sectionFields.add(sectField);
                        
                    } 
                }
            }
            lstSections.add(sect);
        }
        
       		 System.debug(JSON.serialize(lstSections));
       		 return lstSections;
    }
    //pdf generation and Email Sending 
    @auraEnabled
    public static String generatePDF(String recordId){
        system.debug('Record Id :' +recordId);
        conId = recordId;
       
       // Pagereference pg = new Pagereference('/apex/PageSectionDetails?id='+conId);
       Pagereference pg = Page.PageSections;
       
        	pg.getParameters().put('id', conId);
        
        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
        	attach.setContentType('application/pdf');	
        	attach.setFileName('ContactData.pdf');
        	attach.setInline(false);
        	attach.Body = pg.getContentaspdf();
        
        OrgWideEmailAddress orgWideEmail = new OrgWideEmailAddress();
            orgWideEmail = [SELECT Id, Address, DisplayName FROM 
					OrgWideEmailAddress WHERE DisplayName='DrizzleIT'];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        	mail.setUseSignature(false);
        	mail.setOrgWideEmailAddressId(orgWideEmail.Id);
        String[] emailAddresssList = new String[]{'rathodnil401@gmail.com', 'abhijeet@drizzleit.org'};  
            mail.setToAddresses(emailAddresssList);
        	mail.setSubject('PDF Email Demo');
        	mail.setHtmlBody('Here is the email you requested! Check the attachment!');
        	mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
        
        // Send the email
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        return null;
    }
    
    //getting all field values
   
    //wrapper class
    public class Section{
        @AuraEnabled
        public string label{get ;set;}
        @AuraEnabled
        public List<SectionField> sectionFields {get;set;}
  		  }
    
    public class SectionField{
        @AuraEnabled
        public string label {get ;set;}
        @AuraEnabled
        public string apiName {get;set;}
 	     }

}