public class trg_helper_opportunityLineItem {
    public static void isInsertAction(List<OpportunityLineItem> lstOpportunityLineItem){
        set<id> opportunityIds = new set<id>();
        
       
        for(OpportunityLineItem oppL:lstOpportunityLineItem){
            opportunityIds.add(oppL.OpportunityId);
            
        }
        Map<id,Opportunity> mapOfIdrelatedToOpplineitem= new  Map<id,Opportunity>([select id,(select id from OpportunityLineItems) from Opportunity where id in: opportunityIds]);
       //List<OpportunityLineItem> lstOppli = [select id from OpportunityLineItem where id in: opportunityIds];
        for(OpportunityLineItem o:lstOpportunityLineItem)
        {
            if( mapOfIdrelatedToOpplineitem.get(o.OpportunityId).OpportunityLineItems.size()>2)
            {
              o.addError('You can not add more than two items');  
            }
        }
    // public static void isUpdateAction(List<OpportunityLineItem> lstOpportunityLineItem){}
}
}