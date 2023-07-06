public class topXDesignationTriggerHelper {
    public static void afterInsert(List<Top_X_Designation__c> newList){
         
        map<id,opportunity> oppMap = new map<id,opportunity>();
        
        for(Top_X_Designation__c topRec : newList){
            if(topRec.Opportunity__c != NULL){
                if((topRec.Type__c == 'Handoff' && topRec.Document_Attached__c == True)){
                    opportunity opp = new opportunity();
                    opp.id = topRec.Opportunity__c;
                    opp.Handoff_Attached__c = 'Yes';
                    oppMap.put(opp.id,opp);
                }else{
                    opportunity opp = new opportunity();
                    opp.id = topRec.Opportunity__c;
                    opp.Handoff_Attached__c = 'No';
                    oppMap.put(opp.id,opp);
                }
            }
        }      
       
        
        update oppMap.values();
        
    }
}