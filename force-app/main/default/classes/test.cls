public class test {
public Contact con{get;set;}
public Test(){
    con=new Contact();}
    public void click(){
    insert con;}
 public pageReference Save()
 {
    return null;
 }


   String ISP = null;
   
   public List<SelectOption> getISPItems()
    {

       List<SelectOption> options = new List<SelectOption>();
       options.add(new SelectOption('None','Non'));
       options.add(new SelectOption('Yes','Yes'));
       options.add(new SelectOption('No','No')); 
       return options;
   }
   public String getISP()
   {
       return ISP;
   }
   public void setISP(String ISP)
   {
    this.ISP = ISP;
   }
}