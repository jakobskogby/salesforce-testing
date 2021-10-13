public with sharing class PropertyUtility {
 
 
 
    public static void newListedProperties(){
        List<Property__c> newPropList = new List<Property__c>();
        newPropList = [SELECT Id, Name, Broker__r.Email__c, Days_On_Market__c FROM Property__c WHERE Days_On_Market__c < 31];

        String propEmail;

        for(Integer i; i < newPropList.size(); i++){
            propEmail = newPropList[i].Name + ':' + newPropList[i].Broker__r.Email__c;
            System.debug(propEmail);
        }

    }

}