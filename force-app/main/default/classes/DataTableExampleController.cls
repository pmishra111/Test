public class DataTableExampleController {
    public List<Contact> contactList {get; set; }
    
    public DataTableExampleController() {
            if (contactList == null)
                contactList = [SELECT Account.Name, FirstName, LastName, Phone FROM Contact limit 10000];
    }
}