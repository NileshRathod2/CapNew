public class caseHandler {
    public static void caseUpdate(List<Case> caseList){
        for(Case cs:caseList){
            if(cs.Status == 'working' && cs.Origin== 'phone'){
                cs.Reason = 'Performance';
                cs.Type = 'Electronic';
            }
        }
    }
}