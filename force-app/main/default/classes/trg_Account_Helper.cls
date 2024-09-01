public class trg_Account_Helper {
    public static void beforeInsertAction(List<Account> FstAccount){
        updateType(FstAccount);//added by prakhar
    }
public static void  updateType(List<Account> FstAccount){
    if(FstAccount!=null && FstAccount.size()>0){
        for(Account a:FstAccount)
            {
                if(a.Type==null)
                {
                    //System.debug('firstAcoount'+FstAccount);
                    a.addError('type filed must be filled');
                }
            }
   
    }
}
}