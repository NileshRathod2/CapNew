/**
 * @description       : 
 * @author            : Nilesh Rathod (Drizzle)
 * @group             : 
 * @last modified on  : 10-07-2022
 * @last modified by  : Nilesh Rathod (Drizzle)
**/
public class ApexQueableClass implements Queueable{
  
	private List<Account> accList;
    private Id parentAccId;
    
    public ApexQueableClass(List<Account> lstRecords , Id id){
        this.accList = lstRecords;
        this.parentAccId = id;
    }
    
    
 public void execute(QueueableContext context){
	 
     for(Account acc: accList){
         acc.ParentId = parentAccId;
     }
 update accList;
}
//
}