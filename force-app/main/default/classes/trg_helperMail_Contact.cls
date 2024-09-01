public class trg_helperMail_Contact 
{
        public static void afterInsertAction(List<Contact> IstCon)
        {
        sendMail(IstCon);
        }
        public static void sendMail(List<Contact> IstCon)
        {
           Set<id> accid=new Set<id>();
           List<String> sendTo =new List<String>();
           List<Messaging.SingleEmailMessage> Emails = new List<Messaging.SingleEmailMessage>();
           String subject='A contact has been inserted';
           Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
           if(IstCon!=null && IstCon.size()>0)
           {
              for(Contact c : IstCon)
                {
                accid.add(c.AccountId);
                }
           Account ac=[select Owner.Email from Account where Id in : accid];
               sendTo.add(ac.Owner.Email);
               mail.setToAddresses(sendTo);
               mail.setReplyTo('pmishra@kloudrac.com');
               mail.setSubject(subject);
               mail.setPlainTextBody('hello owner an account is inserted under you.');
               Emails.add(mail);
               if(Emails!=null)
               Messaging.sendEmail(Emails);
           }
            
       }
}