@isTest
public with sharing class LeadProcessorTest {
    @isTest
    
    public static void testLeadProcessorBatch(){
        List<Lead> leads = new List<Lead>();
        Account acc = new Account(name = 'LeadAccount');
        insert acc;
        for(Integer i = 0; i<200; i++){
            leads.add(new Lead(lastName='Lead ' + i, Company = acc.Id));
        }
        insert leads;

        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();

        System.assertEquals(200,[SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce'] );
    }
}