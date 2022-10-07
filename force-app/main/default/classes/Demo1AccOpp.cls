public class Demo1AccOpp {

    public static void CreateOppOnAccount(){
        List<Account> accItems = [SELECT Id, name FROM Account where createddate= LAST_MONTH];
        
        List<Opportunity> OppToBeUpdated = new List<Opportunity>();
        
        if(accItems.size() > 0){
            for(Account ac: accItems){
                Opportunity op = new Opportunity();
                op.Name = ac.Name;
                op.StageName = 'Closed Lost';
                op.CloseDate = System.today();
                op.AccountId = ac.Id;
                OppToBeUpdated.add(op);
            }
        }
        if(OppToBeUpdated.size() > 0){
            insert OppToBeUpdated;
        }
        
    }
}