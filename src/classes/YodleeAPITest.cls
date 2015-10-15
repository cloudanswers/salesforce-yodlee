@isTest
public class YodleeAPITest {
    @isTest static void post () {
        Map<String, String> data = new Map<String, String> {'1' => 'a'};
        Test.setMock(HttpCalloutMock.class, new YodleeAPIMock(200, 'ok', 'echo', new Map<String, String>()));
        System.assertEquals('1=a', YodleeAPI.post('https://jsonecho', null, data).getBody());
    }
}