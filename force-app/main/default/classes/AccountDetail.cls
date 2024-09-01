public class AccountDetail

{
    
    public List<Account> acct{get;set;}
    
    public string renderAsdoc{get;set;}
    
    public boolean pb1{get;set;}
     public String fileType{get;set;}
    public string renderAsExcel{get;set;}
    public string strKey {get;set;}
    public boolean check{get;set;}
    
    public string id = null;  
    
    public AccountDetail()
        
    {
        check=false;
        selectAccount();
        
    }
    public List<SelectOption> getIDItems()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--NONE--','--NONE--'));
        options.add(new SelectOption('XLS','XLS'));
        options.add(new SelectOption('CSV','CSV'));
        return options;
    }
    public String getID()
    {
        return id;
    }
    public void setID(String id)
    {
        this.id = id;
    }
    public PageReference selectAccount(){
        if(check == true)
        {
            String w = '%'+strKey+'%';
            acct=[Select Name,BillingCity,Phone,OwnerId from Account where name like :w limit 1000];
            
            pb1=true;
        }
        if(check == false)
        {
            acct=[Select Name,BillingCity,Phone,OwnerId from Account];
            pb1=true;
        }
        return null;
    }
    
    
    //Save as Excel
    
   
    
    // Save as CSV
    
    //Save as Excel
    
    
    public void search()
    {
        system.debug('strKey'+strKey);
        if( strKey != null && strKey !=''  )
        {
            check = true;
            selectAccount();
        }
        else
        {
            selectAccount();
        }
        
    }
    public String getfileType(){
        return fileType;
    }
    
    public void setfilType(String type){
        this.fileType=type;
    }
    
    public pagereference download(){
        System.debug(fileType);
        if(fileType=='xls'){
            renderAsExcel='application/vnd.ms-excel#Account Report.xls';    
        }
        
        return null;
    }
    

  
    
}