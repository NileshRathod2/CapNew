public class normalApexClasses {
    public static String apexMethod(String status){
        String statusResult;
        if(String.isBlank(status)){
            return null;
        }
        
        else if(status == 'ABC'){
            statusResult = 'ABCD';
        }else{
            statusResult = 'EFG';
        }
        return statusResult;
    }

}