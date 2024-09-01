public class c1{
Account[] acts;
public Account[] getacts(){
return acts;
}
public Pagereference show(){

acts=[Select Name,fax,AccountNumber from Account];
return null;
}
public Pagereference details(){
acts=[Select Name,fax,AccountNumber,Type from Account where Type='Customer - Direct'];
return null;
}
}