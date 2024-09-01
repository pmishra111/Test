@istest()
public class TestCntactTriggerHandler {
  @istest()
    public static void UnitTest(){
        Contact con = new Contact();
        con.LastName = 'PathakJi';
        con.Email='pathakji@gmail.com';
        Insert con;
        Contact con1 = new Contact();
        con1.LastName = 'mishraJi';
        con1.Email='pathakji@gmail.com';
        try{
          Insert con1;  
        }
        catch(DMLException e){
            System.assert(e.getDmlMessage(0).contains('Contact record already Present'));
        }

    }
}