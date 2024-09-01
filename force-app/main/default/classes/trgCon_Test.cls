@isTest
public class trgCon_Test {

    static testMethod void method1()   
    {
        Account acc = new Account(name='test123');
        insert acc;
        System.assertNotEquals(null, acc);
        
    	Contact c = new Contact(LastName='Test',accountId=acc.Id);
    	insert c;
        System.assertNotEquals(null, c);
    }
}