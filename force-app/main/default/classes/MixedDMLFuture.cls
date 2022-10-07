public class MixedDMLFuture {
    public static void UseFutureMethod(){
        //first dml operation
     Account a=new Account(name='niloct6');
    insert a;
        
//this is next opreation (insert a 8user with arole )
//can't be mixed with previous insert unless
//// it is within a future method 
//call future method to insert a user eith a role .

        Util.insertUserWithRole('sj25oct@pls430.com','s5oct','nilesh@25.com','Nil');
    }
}