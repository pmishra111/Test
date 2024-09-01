public class AccountTriggerHandler {
    public static void updateAccountField(Map<Id,Account>mapOfAccount,List<Account> listAccount){
        List<Account> listAccountUpdate = new List<Account>();
        set<Id> accId = new set<Id>();
        for(Account acc: listAccount){
           system.debug('acc.Rating '+acc.Rating );
                if(acc.Rating =='Hot' && acc.Rating != mapOfAccount.get(acc.Id).Rating){
                    accId.add(acc.Id);
                }
        }
        List<Account> listAccounts =[Select Id, Name from Account where Id IN:accId];
        for(Account accObj: listAccounts){
            accObj.Industry = 'Banking';
            listAccountUpdate.add(accObj);
        }
        if(!listAccountUpdate.isEmpty()){
            update listAccountUpdate;
        }
    }
}