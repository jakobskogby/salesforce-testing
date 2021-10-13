trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Task> tasksToInsert = new List<Task>();
    for(Opportunity o : Trigger.New) {
       if(o.StageName == 'Closed Won'){

           Task taskToAdd = new Task(
           subject = 'Follow Up Test Task',
           WhatId = o.Id
           );

           tasksToInsert.add(taskToAdd);
       }
    }   
    insert tasksToInsert;
}