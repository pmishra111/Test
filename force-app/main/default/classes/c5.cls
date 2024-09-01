public class c5{
public Contact con{get;set;}
public Boolean Flag{get;set;}
public c5()
{
Flag=true;
con = new Contact();
}
public PageReference save(){
Flag=false;   
insert con ;
return null;
}
public PageReference edit(){
Flag=True;  
return null;
}
}