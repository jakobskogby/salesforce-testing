public with sharing class AccountHandler {
    public static Account insertNewAccount(String accName){
            try{
                Account newAcc = new Account();
                newAcc.Name = accName;
                insert newAcc;
                System.debug('newAcc: ' + newAcc);
                return newAcc;
            } catch(DmlException e){
                System.debug('Something with the insert went wrong. Error msg: '+ e);
                return null;
            }

        }
}