public class Demo4 {
    
    //Query contacts and if phone is not populated on contact
    //then copy phone of related account
    public static void UpdatePhoneOnContact(){
        
         string a_Object_API_Name ='contact';
        string labels;
   //sectionfield API and Label
        List<string> sectionFieldWithLable = new List<string>(); 
        Map<String, Schema.SObjectField> M_Objects_Schema_Field = Schema.getGlobalDescribe().get(a_Object_API_Name).getDescribe().fields.getMap();
        		 
        for( String a_Field_Name : M_Objects_Schema_Field.keySet() ) {
            Schema.DescribeFieldResult a_Field_Description = M_Objects_Schema_Field.get( a_Field_Name ).getDescribe();
             //SectionField wr = new SectionField ();      
            labels=a_Field_Description.getLabel();
           //apiNames = a_Field_Description.getName();
           sectionFieldWithLable.add(labels);
             //sectionFieldWithLable.add(apiNames);
        }
        system.debug(sectionFieldWithLable);
    }

}