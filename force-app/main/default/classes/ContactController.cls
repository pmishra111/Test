public class ContactController {
    public list<Contact> Con{get;set;}
     public integer totalRecs = 0;
public integer OffsetSize = 0;
public integer LimitSize= 15;
    public ContactController (){
         Con=[select FirstName,LastName,phone,Email,AccountId from Contact limit: LimitSize OFFSET :OffsetSize ];
      
        totalRecs =con.size();
    }
public void FirstPage()
{
OffsetSize = 0;
}
public void previous()
{
OffsetSize = OffsetSize-LimitSize;
}public void next()
{
OffsetSize = OffsetSize +LimitSize;
}public void LastPage()
{
OffsetSize = totalRecs - math.mod(totalRecs,LimitSize);
}
public boolean getprev()
{
if(OffsetSize == 0)
return true;
else
return false;
}
public boolean getnxt()
{
if((OffsetSize + LimitSize) > totalRecs)
return true;
else
return false;
}
}