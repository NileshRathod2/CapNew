public class DynamicSOQL {
    public static void getAllPendingApprovals(){
        String a_Object_API_Name = 'Contact';
        String apiName;
        
        Map<String ,List<String>> sectionFieldWithLable = new Map<String ,List<String>>(); 
        Map<String, Schema.SObjectField> M_Objects_Schema_Field = Schema.getGlobalDescribe().get(a_Object_API_Name).getDescribe().fields.getMap();
        for( String a_Field_Name : M_Objects_Schema_Field.keySet() ) {
            Schema.DescribeFieldResult a_Field_Description = M_Objects_Schema_Field.get( a_Field_Name ).getDescribe();
            // Label of the field
            List<String> label = new  List<String>();
            label.add(a_Field_Description.getLabel());
            //System.debug('-=-=Label:' +label);
            
            // API Name of the field
            apiName = a_Field_Description.getName();
            //System.debug('-=-=Name:' +apiName);
            sectionFieldWithLable.put(apiName,label);
        }
        system.debug(JSON.serialize(sectionFieldWithLable));
        //System.debug(sectionFieldWithLable);
    }
}