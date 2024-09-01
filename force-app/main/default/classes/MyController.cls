public with sharing class MyController
{
    public Account MyAccount {get; set;}

    public PageReference getAccount()
    {
        String accountName = Apexpages.currentPage().getParameters().get('accountName');
        MyAccount = [SELECT Name FROM Account WHERE Name = :accountName];
        return null;
    }
}