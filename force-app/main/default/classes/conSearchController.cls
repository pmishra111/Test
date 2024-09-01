public class conSearchController{

  public conSearchController(ApexPages.StandardSetController controller) {
  
     
  }
    public List<Contact> con {get;set;}
    public String searchString{get;set;}
    
    public void search(){
        String searchQuery ='select FirstName,LastName,AccountId,Phone,Email from Contact where  name like \'%'+ searchString+'%\' Limit 20';
        con=Database.query(searchQuery);
       
    }
}