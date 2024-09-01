@isTest
Public class LeadProcessorTest {
    @isTest
    static void unitTest() {
     
        list<Lead> lstLead = new list<Lead>();
        for(integer i=0 ; i<200 ; i++) {
            Lead l = new Lead();
            l.LastName = 'testLead' + i;
            l.Company = 'testCompany';
            l.Status = 'Open - Not Contacted';
            lstLead.add(l);
        }
        insert lstLead;
       
       
           LeadProcessor lp = new LeadProcessor();
           Database.executeBatch(lp);
      
    }
}