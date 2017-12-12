public with sharing class CallWebserviceToOtherOrg {
	//Test Push
	public CallWebserviceToOtherOrg() {
		
	}
	public static void fireWebService(){
		String clientId = '3MVG9d8..z.hDcPJkMcqoTzM0tx0mdxN5FHvb0RHuFYFv4Aw86Wrum8HvhEQ5RYFvSUf1j_aMwXgFH.dZJEJv';
		String clientSecret = '3078054021535457564';
		String username='david.rexieaaron@salesforce.com';
		String password='Thinkas1'+'j1NGqTDEW9yzCMwSjezNoIjaQ';

		String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;

		Http h = new Http();
		HttpRequest req = new HttpRequest();
		req.setBody(reqbody);
		req.setMethod('POST');
		req.setEndpoint('https://login.salesforce.com'+'/services/oauth2/token');//Note if my domain is set up use the proper domain name else use login.salesforce.com for prod or developer or test.salesforce.com for sandbox instance

		HttpResponse res = h.send(req);
		System.debug('resbody ->'+res.getbody());
		OAuth2 objAuthenticationInfo = (OAuth2)JSON.deserialize(res.getbody(), OAuth2.class);

		System.debug('id -> '+objAuthenticationInfo.id);
		System.debug('issued_at -> '+objAuthenticationInfo.issued_at);
		System.debug('instance_url -> '+objAuthenticationInfo.instance_url);
		System.debug('signature -> '+objAuthenticationInfo.signature);
		System.debug('access_token -> '+objAuthenticationInfo.access_token);

		if(objAuthenticationInfo.access_token!=null){
		  Http h1 = new Http();
		  HttpRequest req1 = new HttpRequest();
		  //String jsonstr='{"Name":"'+ username +'"}';
		  req1.setHeader('Authorization','Bearer '+objAuthenticationInfo.access_token);
		  req1.setHeader('Content-Type','application/json');
		  req1.setHeader('accept','application/json');
		  req1.setMethod('GET');
		  //req1.setBody(jsonstr);
		  req1.setEndpoint(objAuthenticationInfo.instance_url+'/services/apexrest/AccountRestService?id=0017F000008mMCr');
		  HttpResponse res1 = h1.send(req1);
		  List<Account> deserializedInvoices = (List<Account>)JSON.deserialize(res1.getbody(), List<Account>.class);
		  system.debug('RESPONSE_BODY='+deserializedInvoices);
		}
	}
	/*To get aouthentication detail Wrapper*/
	public class OAuth2{
		public String id{get;set;}
		public String issued_at{get;set;}
		public String instance_url{get;set;}
		public String signature{get;set;}
		public String access_token{get;set;}    
	}
}