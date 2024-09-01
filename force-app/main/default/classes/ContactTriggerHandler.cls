public class ContactTriggerHandler {
    
    public static void preventToCreateContact(List<Contact> listContact){
        map<String,Contact> mapOfPresentContact = new map<String,Contact>();
        set<String> Emails = New set<String>();
        for(Contact con: listContact){
            Emails.add(con.Email);
        }
        List<Contact> listOfCon =[Select Id,Name,Email from Contact where Email IN:Emails];
        for(Contact conObj: listOfCon){
            mapOfPresentContact.put(conObj.Email,conObj);
        }
        for(Contact conOb: listContact){
            if(mapOfPresentContact != null && mapOfPresentContact.containskey(conOb.Email)){
                conOb.addError('Contact record already Present');
            }
            else{
                mapOfPresentContact.put(conOb.Email,conOb);
            }
        }
    }
    /*public static void UpdateCaseOwner(Map<Id,Contact>mapOfContact,List<Contact> listContact){
        for(Contact con : listContact){
            
        }
    }*/
        
}