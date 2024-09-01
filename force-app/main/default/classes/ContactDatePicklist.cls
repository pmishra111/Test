public class ContactDatePicklist {
    public String selectDate{get;set;}
    public List<Contact> conList{get;set;}
    Public List<Selectoption> getselectedDateFields(){
            List<Selectoption> datename = new List<selectoption>();
             datename.add(new selectOption('', '- None -'));
            for(Contact con :[SELECT id,name,CreatedDate FROM Contact limit 10]){
             datename.add(new selectoption(con.id,con.name));
            }
            return  datename;
        }
    public PageReference showContacts(){
        conList=[select name,phone,Email from Contact limit 10 ];
        return null;
    }
      public pageReference cancel(){

  pageReference pg=new PageReference(ApexPages.currentPage().getURL());

  pg.setRedirect(true);

  return pg;

  }
}