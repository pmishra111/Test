trigger trgDeleteContact on Opportunity (after update) 
{
     if(Trigger.isUpdate && Trigger.isAfter)
     {
   //      trg_helper_del_contact.updateAfterAction(Trigger.new);
     }
}