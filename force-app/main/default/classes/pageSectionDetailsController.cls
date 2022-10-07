public with sharing class pageSectionDetailsController {
    public List<Section> lstSections{get;set;}
    
    public  pageSectionDetailsController(){
    
            Map<String, Schema.SObjectField> mapFieldAPIName_FieldSchema = Schema.getGlobalDescribe().get('Contact').getDescribe().fields.getMap();
    
            List<Metadata.Metadata> layouts = Metadata.Operations.retrieve(Metadata.MetadataType.Layout, 
                                                                           new List<String> {'Contact-Contact Layout'});
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
                            sectField.label = mapFieldAPIName_FieldSchema.get(item.field).getDescribe().getLabel();
                            sect.sectionFields.add(sectField);
                            
                        } 
                    }
                }
                lstSections.add(sect);
            }
    
            System.debug(JSON.serialize(lstSections));
            //return lstSections;
        }
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