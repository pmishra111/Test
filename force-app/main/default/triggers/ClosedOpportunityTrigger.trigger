trigger ClosedOpportunityTrigger on Opportunity (before insert) {
    if(trigger.isInsert ){
        if(trigger.isBefore){
            trg_Opp.beforeInsertAction(trigger.new);
        }
    }
}