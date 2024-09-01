public class test1{    
    public test1(ApexPages.StandardController stdController)
{
}
       public PageReference test(){
        PageReference pageRef = new PageReference('/servlet/servlet.FileDownload?file=0156F00000GXuRR');
        pageRef.setRedirect(true);
        return pageRef ;       
    }
}