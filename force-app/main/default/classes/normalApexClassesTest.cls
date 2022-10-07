@isTest
public class normalApexClassesTest {
    @isTest
    public static void test1(){
        String res = normalApexClasses.apexMethod(' ');
        System.assertEquals(null, res);
    }
     @isTest
    public static void test2(){
        String res = normalApexClasses.apexMethod('ABC');
        System.assertEquals('ABCD', res);
    }


}