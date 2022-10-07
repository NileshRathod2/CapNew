public class lightningDataTable {
  @AuraEnabled(Cacheable=true)
    public static List<Account> getAccounts(String strName){
           String strNameLike = '%'+strName+'%';
        List<Account> accList = [SELECT Id, Name FROM Account WHERE name like: strNameLike LIMIT 20];
        return accList;
        
    }

}