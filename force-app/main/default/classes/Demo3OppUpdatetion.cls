public class Demo3OppUpdatetion {
     public static void updateOppDiscriptiom(){
    	List<Opportunity> oppItems = new List<Opportunity>();
       
    
        for(Opportunity op:[SELECT Id, name,StageName,CloseDate From Opportunity ]){
            if(op.StageName == 'Closed Won'){
               op.Description =' Opportunity is closed won ';
                
            }
            
          else if(op.StageName == 'Closed Lost'){
                op.Description =' Opportunity is closed Lost ';
            }
            oppItems.add(op);
        }
         
        
      
         if(!oppItems.isEmpty()){
             update oppItems;
         }
    }

}