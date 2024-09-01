public class c3{
Account a = new Account();
public Account geta(){
return a;}
public PageReference save(){
insert a;
return null;
}
Public PageReference show(){
PageReference pg =Page.Page1;
pg.setRedirect(true);
return pg;
}
}