public class LeadProcessor implements
    Database.Batchable<sObject>, Database.Stateful {
    public Integer recordsProcessed = 0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator(
        [SELECT LeadSource FROM Lead]
        );

    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records

        
        for(Lead l : scope){
            l.LeadSource = 'Dreamforce';
            scope.add(l);
            recordsProcessed += 1;
        }
        update scope;

    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations

        System.debug('Numb of recordsProcessed = ' + recordsProcessed);
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, CreatedBy.Email FROM AsyncApexJob WHERE Id = :bc.getJobId() ];
        
    }
}