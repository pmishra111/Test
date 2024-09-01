public class CustomAccountReports {
    public static void shareReport()
    {
        List<Account> accountList= new List<Account> ();
        // Access account record type from custom label
        String recordTypeID = System.Label.Partner_Account;
        // Access report recepients from custom label
        //String rUsers = System.Label.ReportRecipient;
       
        if(recordTypeID!= null){
            accountList = [Select id,name ,Owner.Name, BillingCountry from Account where ID not In (Select AccountId From Contact) and RecordTypeId=:recordTypeID];
            String columnName = 'Record Id, AccountName , Owner, BillingCountry \n';
            String finalString = columnName;
            if(accountList!= null && accountList.size()>0){
                for(Account eachAcc: accountList)
                {  
                    string dataString = eachAcc.id+','+eachAcc.Name+','+eachAcc.Owner.Name+','+eachAcc.BillingCountry +'\n';
                    finalString = finalString +dataString;
                }
            }
            
            // Send Email 
            List < Messaging.SingleEmailMessage > mails = new List < Messaging.SingleEmailMessage > ();
            Messaging.EmailFileAttachment csvAttachFile = new Messaging.EmailFileAttachment();
            blob csvBlob = Blob.valueOf(finalString);
            string csvname= 'AccountHavingNoContacts.csv';
            csvAttachFile.setFileName(csvname);
            csvAttachFile.setBody(csvBlob);
            Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
            String[] toAddresses = new list<string> {'pmishra@kloudrac.com'};
            String subject ='AccountHavingNoContacts CSV';
            email.setSubject(subject);
            if(toAddresses !=null){
                email.setToAddresses( toAddresses );
            }
            email.setPlainTextBody('PFA,');
            email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttachFile});
            //Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
            mails.add(email);
            if (mails.size() > 0) 
            {
                    Messaging.sendEmail(mails);
                    system.debug('mailsend' + mails);
            }
        }
    }
}