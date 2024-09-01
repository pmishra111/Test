trigger trg_ToStop_noOfProducts on OpportunityLineItem (before insert) {
    if(Trigger.isBefore){
        trg_helper_opportunityLineItem.isInsertAction(Trigger.new);
       // trg_helper_opportunityLineItem.isUpdateAction(Trigger.new);
    }
}