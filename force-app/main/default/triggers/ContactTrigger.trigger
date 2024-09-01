trigger ContactTrigger on Contact (before insert,After Update) {
    if(trigger.isBefore && trigger.isInsert){
        ContactTriggerHandler.preventToCreateContact(Trigger.New);
    }
    //if(trigger.IsAfter && trigger.isUpdate){
        //ContactTriggerHandler.UpdateCaseOwner(Trigger.OldMap, Trigger.New);
    //}
}