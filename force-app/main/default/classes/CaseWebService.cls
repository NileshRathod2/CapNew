@RestResource(urlMapping='/Cases/*')
global class CaseWebService {
    
    @HttpGet
    global static List<Case> getCases() {
        RestRequest request = RestContext.request;  
        List<Case> result =  [SELECT CaseNumber,Subject,Status,Origin,Priority
                        FROM Case
                        LIMIT 20];
        return result;
    }
    @HttpPost
    global static ID createCase(String subject, String status,
        String origin, String priority) {
        Case thisCase = new Case(
            Subject=subject,
            Status=status,
            Origin=origin,
            Priority=priority);
        insert thisCase;
        return thisCase.Id;
    }   

}