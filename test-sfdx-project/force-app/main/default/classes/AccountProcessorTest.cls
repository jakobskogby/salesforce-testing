@isTest
public with sharing class AccountProcessorTest {
    @isTest
    public static void countContactsTest() {
        Account testAcc = new Account();
        testAcc.Name = 'TrailheadTestAccount';
        insert testAcc;


        Contact testCon = new Contact();
        testCon.LastName = 'TestCon1';
        testCon.AccountId = testAcc.Id;
        insert testCon;

        List<Id> accIds = new List<Id>();
        accIds.add(testAcc.Id);

        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();

        Account acc = [SELECT Number_of_Contacts__c FROM Account WHERE id =: testAcc.Id];
        System.assertEquals(Integer.valueOf(acc.Number_of_Contacts__c), 1);

    }
}