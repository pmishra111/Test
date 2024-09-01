public class ContactController1 {
    public string strKey {get;set;}
    public integer counter{get;set;}  
    public integer list_size{get;set;} 
    public integer total_size; 
    public list<Contact> lstOfCon{get;set;}
    public integer var{get;set;}
    public list<Contact> lstOfSelectedContact{get;set;}
    public boolean check{get;set;}
    public ContactController1() {
        list_size =5;
        counter = 0;
        var = 0;
        check = false;
        selectContact();
        total_size = [select count() from Contact]; 
    }
 

    public list<SelectOption> getOptions()
    {
        
        list<SelectOption> lstOfOption = new list<SelectOption>();
        lstOfOption.add(new selectOption('5','5'));
        lstOfOption.add(new selectOption('10','10'));
        lstOfOption.add(new selectOption('20','20'));
        lstOfOption.add(new selectOption('50','50'));
        lstOfOption.add(new selectOption('100','100'));
        return lstOfOption; 
        
    }
    public pageReference selectContact() {
        try {
            system.debug('list_size'+list_size);
            if(check == false)
            {
                lstOfCon = [select FirstName,LastName,Phone,Email,AccountId from Contact limit :list_size offset :counter];
            }
            if(check == true)
            {
                String w = '%'+strKey+'%';
                lstOfCon = [select FirstName,LastName,phone,Email,AccountId from Contact where name like :w limit :list_size offset :counter ] ;
            }
            system.debug('counter'+counter);
            var = lstOfCon.size()+counter;    
            return null;
        } catch (QueryException e) {
            ApexPages.addMessages(e);   
            return null;
        }
    }
    
    public PageReference Beginning() {
        counter = 0;
        selectContact();
        return null;
    }
    
    public PageReference Previous() {
        if(Counter>0)
        counter -= list_size;
        selectContact();
        return null;
    }
    
    public PageReference Next() { 
        counter += list_size;
        selectContact();
        return null;
    }
    
    public PageReference End() { 
        counter = total_size - math.mod(total_size, list_size);
        selectContact();
        return null;
    }
    
    public Boolean getDisablePrevious() { 
        if (counter>0) 
            return false; 
        else 
            return true;
    }
    
    public Boolean getDisableNext() {
        if (counter + list_size < total_size) 
            return false; 
        else 
            return true;
    }
    
    public Integer getTotal_size() { 
        return total_size;
    }
    
    public Integer getPageNumber() {  
        return counter/list_size + 1;
    }
    
    public Integer getTotalPages() {
        if (math.mod(total_size, list_size) > 0) {
            return total_size/list_size + 1;
        } else {
            return (total_size/list_size);
        }
    }
    public void search()
    {
        system.debug('strKey'+strKey);
        if( strKey != null && strKey !=''  )
        {
            check = true;
            selectContact();
        }
        else
        {
           selectContact();  
        }
        
    }
}