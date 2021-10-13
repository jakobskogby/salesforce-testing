public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String lastname, String mail){
        List<Contact> conList = [SELECT  MailingPostalCode, LastName FROM Contact WHERE MailingPostalCode =: mail AND LastName =: lastname];
        return conList;
    }
}