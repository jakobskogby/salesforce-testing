public with sharing class AccountUtility {



    public static void viewAnnualRevenue(){
        List<Account> accountsList = new List<Account>();

        accountsList = [SELECT ID, Name, AnnualRevenue FROM Account];
        String acctRev;

        for(Integer i = 0; i < accountsList.size(); i++){
            acctRev = accountsList[i].Name + ' : ' + accountsList[i].AnnualRevenue;
            System.debug(acctRev);
        }

    }
}