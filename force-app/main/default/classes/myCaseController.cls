public class myCaseController {
    
    public myCaseController(){
        
    }
    public static PageReference displayName(){
   String myID='0035g00000DkxsvAAB';
    PageReference pg=new PageReference('/contactId');
    pg.getParameters().put('id', myID);
    pg.setRedirect(true);
        system.debug(pg);
   return pg;
  }
}