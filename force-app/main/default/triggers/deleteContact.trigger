trigger deleteContact on Opportunity (after update) {
if(Trigger.isUpdate){
set <id> accid = new set<id>();
List<Contact> conlist = new List<Contact>();        
for(opportunity opp :Trigger.new)
        {
            if(opp.StageName=='Closed Won' && Trigger.oldMap.get(opp.id).StageName!='Closed Won')
            {
              accid.add(opp.AccountId);
            }
        }
            if(accid.size()>0){
            conlist=[Select Id from Contact where AccountId in:accid ];
        }
        
            try{
            delete conlist;
            }
            catch(Exception e){
            System.debug(e.getMessage());
            }
        }
    }