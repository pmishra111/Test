public class trg_Helper {
    public static void BeforeInsertionAction(List<Account> Acc){
        updateShippingPostal(Acc);
    }
    public static void  updateShippingPostal(List<Account> Acc){
        for(Account a: Acc){
            if(a.Match_Billing_Address__c==true&& a.BillingPostalCode!=null){
                a.ShippingPostalCode=a.BillingPostalCode;
            }
        }
    }
}