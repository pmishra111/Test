global class LeadProcessor implements Database.batchable<sObject> {
    global Database.queryLocator start(Database.batchableContext bc) {
        //Query all Lead records
        String query = 'SELECT Id, LeadSource FROM Lead';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.batchableContext bc, list<Lead> scope) {
        list<Lead> lstLead  = new list<Lead>();
        for(Lead l : scope) {
          l.LeadSource = 'Dreamforce';
            lstLead.add(l);
        }
        Update lstLead;
    }
    
    global void finish(Database.batchableContext bc) {
        
    }
}