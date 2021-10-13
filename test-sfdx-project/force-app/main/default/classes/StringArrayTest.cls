public with sharing class StringArrayTest {
    public static List<String> generateStringArray(Integer n){
        
        String stringToAdd;
        List<String> tempList = new List<String>();

        for(Integer i = 0; i < n; i++)  {
            stringToAdd = 'Test ' + String.valueOf(i);
            tempList.add(stringToAdd);
        }
        System.debug(tempList);
    return tempList;
    } 
}