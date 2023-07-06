trigger topXDesignationTrigger on Top_X_Designation__c (After insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            topXDesignationTriggerHelper.afterInsert(Trigger.new);
        }
    }
}