import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import SPECIAL_OBJECT from '@salesforce/schema/SpecialObject__c';
import SPECIAL_NAME from '@salesforce/schema/SpecialObject__c.Name';
import SPECIAL_DESCRIPTION from '@salesforce/schema/SpecialObject__c.Description__c';

export default class CreateObject extends LightningElement {
    objectApiName = SPECIAL_OBJECT;
    fields = [SPECIAL_NAME, SPECIAL_DESCRIPTION];
    
    handleSuccess(event){
        console.log(event.detail);
    }

}