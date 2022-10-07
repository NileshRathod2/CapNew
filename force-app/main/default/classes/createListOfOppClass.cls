public class createListOfOppClass {
		@auraEnabled
    public static List<Opportunity> getOppty(){
        List<Opportunity> oppList =[select Id, Name, Stagename, Amount from Opportunity limit 20];
        return oppList;
    }
}