public class trg_Opp {
    public static void beforeInsertAction(List<Opportunity> opp){
        updateWhatId(opp);
    }
    public static void updateWhatId(List<Opportunity> opp){
        List<Task> dotask= new List<Task>();
        for(Opportunity o : opp){
            
            if(o.StageName=='Closed Won')
            {
            	Task t=new Task(WhatId=o.Id,Subject='Follow Up Test Task');
                dotask.add(t);
            }
        }
        insert dotask;
    }
}