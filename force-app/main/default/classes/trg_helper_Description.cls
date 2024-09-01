public class trg_helper_Description
{
    public static void updateAfterAction(List<Account> lstAccount)
    {
      updateDes(lstAccount);  
    }
    public static void updateDes(List<Account> lstAccount)
    {
        List<Contact> lstCon = new List<Contact>();
        List<Opportunity> lstOpp = new  List<Opportunity>();
        Set<id> accid = new Set<id>();
        
         for(Account acc: lstAccount)
         {
           accid.add(acc.id);
         }
          lstCon = [Select Id from Contact where AccountId in : accid];
          lstOpp = [select Id from Opportunity where AccountId in : accid];
          for(Account acc1 : lstAccount)
          {  
             if(acc1.All_rejected__c==true)
             {
                for(Opportunity o: lstOpp)
               {
               
                 o.Description='Account is rejected';
                //if(lstOpp!=null&& lstOpp.size()>0)    
                 update lstOpp;
               }
                for(Contact c: lstCon)
                {
                 c.Description='Account is rejected';
                 //if(lstCon!=null&& lstCon.size()>0)    
                 update lstCon;   
                }
          
              }
           }
      }
}