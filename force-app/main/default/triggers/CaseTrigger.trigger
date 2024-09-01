trigger CaseTrigger on Case (before update) {

  for (Case c : Trigger.new) {
    if (c.text1__c != null && Trigger.oldMap.get(c.id).text1__c != null) {
      c.addError('Field not updatable');
    }      
  }

}