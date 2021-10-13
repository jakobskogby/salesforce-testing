public with sharing class AccountProcessor {
    @future
    public static void countContacts (List<Id> accountIds){
        // Creating a list that will contain all those accounts that are referenced through the accounIDs list.
        List<Account> accounts = [SELECT Id, Number_of_Contacts__c, (SELECT id FROM Contacts) FROM Account where id in :accountIDs];
     
        //Assigment from the total contact number to the Number_of_Contacts__c field for each account at accounts list.
        for( Account account : accounts ) {
          account.Number_of_Contacts__c = account.contacts.size();
        }

        //Updating all accounts in list
        update accounts;
      }    
}