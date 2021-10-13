public with sharing class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String name){
        
        list<list<sobject>> result = [FIND :name IN ALL FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];

        
        System.debug(result);
        return result;

    }
}