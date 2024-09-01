trigger trgAppointment on Appointment__c (after insert,after update)
{
  if(Trigger.isInsert  || Trigger.isUpdate )
  {
      Set<id> SetOfDocId = new Set<id>();
      Map<Id,List<Appointment__c>> MapOfDocIdRelatedToAppointment = new  Map<id,List<Appointment__c>>();
      for(Appointment__c ap: Trigger.new)
      {   
               SetOfDocId.add(ap.DoctorLookup__c);
               if(!MapOfDocIdRelatedToAppointment.containsKey(ap.DoctorLookup__c))
            {
              
            }
            else
            {
              MapOfDocIdRelatedToAppointment.get(ap.DoctorLookup__c).add(ap);
            }
         
         
      }   
  }
}