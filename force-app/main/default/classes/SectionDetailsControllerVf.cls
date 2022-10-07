public class SectionDetailsControllerVf {
    public List<section> lstsections;
    public string label {get ;set;}
    public contact con { set; }
    //public  Attachment generatePDF {get; set;}
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
     //getting all field values
   @auraEnabled
    public static contact getcon(){
        
  		String pageRecordId=Apexpages.currentPage().getParameters().get('id');
        system.debug('new con :' +pageRecordId);
        
        
        Set<String> SobjectFields = Schema.getGlobalDescribe().get('Contact').getDescribe().fields.getMap().keySet(); 
        Contact con =Database.query('SELECT ' + String.join(new List<String>(SobjectFields), ',') + ' FROM Contact WHERE Id = \'' + pageRecordId + '\'');
        	System.debug('contact '+con);
        	        return con;

   			 }
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