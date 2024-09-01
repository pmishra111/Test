public class AccountProcessor 
{
  @future
  public static void countContacts(Set<id> setAccId) 
  {
      List<Account> lstAccount = [select id ,Number_of_Contacts__c,(select id from contacts ) from account where id in :setAccId ];
      for( Account acc : lstAccount )
      {
          List<Contact> lstCont = acc.contacts ;
          
        acc.Number_of_Contacts__c = lstCont.size();
      }
      update lstAccount;
  }
}