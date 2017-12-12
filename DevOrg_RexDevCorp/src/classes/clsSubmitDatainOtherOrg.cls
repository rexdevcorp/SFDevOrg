//Source
public class clsSubmitDatainOtherOrg {

	// we'll be making Oauth Request first to get token,
	// One we've token we'll make Rest API call to get data updated in target Org.
	public Integer depositAmount{get;set;}
	public string AccountId{get;set;}

	// This four variables are required for authentication to Oauth Token
	String clientId = '3MVG9d8..z.hDcPJkMcqoTzM0tx0mdxN5FHvb0RHuFYFv4Aw86Wrum8HvhEQ5RYFvSUf1j_aMwXgFH.dZJEJv' ;
	String clientSecret = '3078054021535457564';
	String username= 'david.rexieaaron@salesforce.com';
	String password= 'Thinkas1';

	//This method is called form VF page on Submit
	public PageReference SubmitDataUsingGet() {

		//using this request body we'll make API call
		String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;

		Http h = new Http();
		HttpRequest req = new HttpRequest();
		req.setBody(reqbody);
		req.setMethod('POST');
		req.setEndpoint('https://login.salesforce.com/services/oauth2');

		//Note if my domain is set,use the proper domain name else use login.salesforce.com
		// for prod or developer environment, and test.salesforce.com for sandbox

		HttpResponse res = h.send(req);
		//OAuth2 objAuthenticationInfo =(OAuth2)JSON.deserialize(res.getbody(), OAuth2.class);

		// proceed further only if you get token
		//if(objAuthenticationInfo.access_token!=null){

			// First create http and req object and set EndPoint
			// Note Endpt, this part is common' https://ap1.salesforce.com/services/apexrest/
			//'getAccountData' name is URLMapping you set while creating Rest 
			//resource in Receiving org.

			//Http h1 = new Http();
			//HttpRequest req1 = new HttpRequest();
			//string EndPt = 'https://ap1.salesforce.com/services/apexrest/getAccountData?' + 'AccountId='+AccountId+'&amount='+depositAmount ;

			//// Set request header to send token, setMethod, and set Endpoint
			//req1.setHeader('Authorization','Bearer ');//+objAuthenticationInfo.access_token);
			//req1.setMethod('GET');
			//req1.setEndpoint(EndPt);


			////finally make a call
			//HttpResponse res1 = h1.send(req1);
			//system.debug('RESPONSE_BODY'+res1);
		//}
		return null;
	}
}