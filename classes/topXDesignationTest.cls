@isTest
public class topXDesignationTest {
	@TestSetup
    public static void topXDataCreation(){
        
        opportunity opp = new opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Prospect';
        opp.CloseDate = System.today()+7;
        Insert opp;  
        
        Top_X_Designation__c topRec = new Top_X_Designation__c();
        topRec.Type__c = 'HandOff';
        topRec.Document_Attached__c = true;
        topRec.Opportunity__c = opp.Id;
        insert topRec;
                
        Top_X_Designation__c topRec1 = new Top_X_Designation__c();
        topRec1.Type__c = 'HandOff';
        topRec1.Document_Attached__c = False;
        topRec1.Opportunity__c = opp.Id;
        insert topRec1;
        
        
        
        
    }
     
    
    public static void topXExecutionMethod(){
        
		Opportunity opp = [SELECT id FROM Opportunity LIMIT 1]; 
        List<Top_X_Designation__c> topX = [SELECT Name,Type__c,Document_Attached__c,Opportunity__c FROM Top_X_Designation__c];
        
        test.startTest();
        topXDesignationTriggerHelper.afterInsert(topX);
        test.stopTest();
        
        
    }
    
    @isTest
    public static void topXExecutionMethod1(){
        
    }
}