public with sharing class ContactController {
    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContacts() {
        System.debug([SELECT id, FirstName, LastName, Email FROM Contact LIMIT 20]);

        try{
            return [SELECT id, FirstName, LastName  FROM Contact WHERE Email = 'asd' LIMIT 20 ];
        } catch (Exception e){
            throw new AuraHandledException(e.getMessage());
        }
        
    }
}