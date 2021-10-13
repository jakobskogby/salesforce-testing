import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import {reduceErrors} from 'c/ldsUtils';


import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';

import EMAIL_FIELD from '@salesforce/schema/Contact.Email';



const COLUMNS = [
    { label: 'Contact Firstname', fieldName: FIRSTNAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Contact Lastname', fieldName: LASTNAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Email', fieldName: EMAIL_FIELD.fieldApiName, type: 'text' }
];


export default class ContactList extends LightningElement {

    columns = COLUMNS;

    @wire(getContacts) 
    conList;
    get errors() {
        return (this.conList.error) ?
            reduceErrors(this.conList.error) : [];
    }
    

    renderedCallback(){
        console.log('asdasd');
        console.log(this.conList.data);
    }



}