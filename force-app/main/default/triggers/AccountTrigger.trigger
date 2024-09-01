trigger AccountTrigger on Account (before insert,before update,after Update) {
    if(Trigger.isUpdate && Trigger.isAfter){
            AccountTriggerHandler.updateAccountField(Trigger.OldMap,Trigger.New);
        
    }
    
}