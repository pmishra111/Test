trigger mailToReg_Candidate on Candidate_Registration__c (after insert) {
    
    if(Trigger.isInsert)
    {
        if(Trigger.isAfter)
        {
            String body;
            String subject='Congratulations ! You are registered';
            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
            List<String> sendTo=new List<String>();
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            for(Candidate_Registration__c candReg:Trigger.new)
            {
              
                sendTo.add(candReg.Mobile_Number_or_Email_Address__c);
                mail.setToAddresses(sendTo);
                mail.setReplyTo('pmishra@kloudrac.com');
                mail.setSubject(subject);
                body='Hello'+Candidate_Registration__c.First_Name__c+'You are registered with us';
                mail.setHtmlBody(body);
                mails.add(mail);
                if(mails!=null)
                Messaging.sendEmail(mails);
            }
            
        }
    }
}