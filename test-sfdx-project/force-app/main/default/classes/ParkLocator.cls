public with sharing class ParkLocator {
    public static List<String> country(String country){
        ParkService.ParksImplPort parkservice = new parkservice.ParksImplPort();
        return parkservice.byCountry(country);
    }


}