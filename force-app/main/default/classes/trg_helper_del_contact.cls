public class trg_helper_del_contact
{
   public static void updateAfterAction(List<Opportunity> lstOpportunity)
   {
       deleteContact(lstOpportunity);
   }
public static void deleteContact(List<Opportunity> lstOpportunity)
    {
        Set<id> accid = new Set<id>();
        List<Contact> lstContact=new List<contact>();
        for(Opportunity o : lstOpportunity )
        {
          //  if(o.StageName=='Closed Won'&& Trigger.oldMap.get(o.id).StageName!='Closed Won')
            {
                accid.add(o.AccountId);
            }
        }  
            if(accid.size()>0)
            {
               lstContact =[Select Id from Contact where AccountId in : accid];
            }
        if(lstContact!=null)
         try{
            delete lstContact;
            }
            catch(Exception e){
            System.debug(e.getMessage());
            }
    }
}