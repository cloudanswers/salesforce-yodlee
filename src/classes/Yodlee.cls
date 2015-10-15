public with sharing class Yodlee {
    private String username;
    private String password;
    private String cobSessionToken;
    public Yodlee (String username, String password) {
        Map<String, Object> res = YodleeAPI.coblogin(username, password);
        Map<String, String> cobrandConversationCredentials = (Map<String, String>)res.get('cobrandConversationCredentials');
        cobSessionToken = (String)cobrandConversationCredentials.get('sessionToken');
    }
}