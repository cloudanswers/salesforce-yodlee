@isTest
public class YodleeAPIMock implements HttpCalloutMock {

    protected Integer code;
    protected String status;
    protected String body;
    protected Map<String, String> responseHeaders;

    public YodleeAPIMock(Integer code, String status, String body, Map<String, String> responseHeaders) {
        this.code = code;
        this.status = status;
        this.body = body;
        this.responseHeaders = responseHeaders;
    }

    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        if (responseHeaders != null)
        for (String key : responseHeaders.keySet()) {
            res.setHeader(key, responseHeaders.get(key));
        }
        if (body == 'echo') {
            res.setBody(req.getBody());
        } else {
            res.setBody(this.body);
        }
        res.setStatusCode(this.code);
        res.setStatus(this.status);
        return res;
    }

}