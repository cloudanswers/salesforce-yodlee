public with sharing class YodleeAPI {
	private Http h = new Http();
	public static Map<String, Object> coblogin (String username, String password) {
		// https://developer.yodlee.com/Aggregation_API/Aggregation_Services_Guide/Aggregation_REST_API_Reference/coblogin
		final String endpoint = 'https://rest.developer.yodlee.com/services/srest/restserver/v1.0/authenticate/coblogin';
		HttpResponse res = post(endpoint, null, new Map<String, String>{'cobrandLogin'=>username, 'cobrandPassword'=>password});
		// documentation does not detail what the http status code should be, so not checking it
		// documentation talks about exceptions but doesn't define if they are returned in json or how, so shouldn't depend on it
		return (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
	}
	private static HttpResponse post (String url, Map<String, String> headers, Map<String, String> data) {
		String body = '';
		for (String k : data.keySet()) {
			body += '&' + k + '=' + EncodingUtil.urlEncode(data.get(k), 'UTF-8');
		}
		body = body.substring(1);
		return post(url, headers, body);
	}
	private static HttpResponse post (String url, Map<String, String> headers, String body) {
		Http h = new Http();
		HttpRequest req = new HttpRequest();
		RestRequest restReq = RestContext.request;
		req.setMethod('POST');
		if (headers != null) {
			for (String k : headers.keySet()) {
				req.setHeader(k, headers.get(k));
			}
		}
		req.setEndpoint(url);
		req.setBody(body);
		HttpResponse res;
		return h.send(req);
	}
}