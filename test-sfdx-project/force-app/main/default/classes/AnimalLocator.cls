public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + Id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
            // Deserialize the JSON string into collections of primitive data types.
            JSONParser parser = JSON.createParser(response.getBody());
            AnimalResponse res = (AnimalResponse) parser.readValueAs(AnimalResponse.class);
            System.debug(response.getBody());
            System.debug(res.animal.name);
            return res.animal.name;
        
    }


    public class Animal{
        public String id;
        public String name;
        public String eats;
        public String says;
    }
    public class AnimalResponse{
        public Animal animal;
    }
}