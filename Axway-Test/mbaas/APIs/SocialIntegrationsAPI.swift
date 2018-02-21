// /Apis/SocialIntegrationsAPI.swift
 

import Foundation

public class SocialIntegrationsAPI: APIBase { 
	/**
	  Find Facebook Friends
      Find the current user's Facebook Friends who also registered in the same App.

	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func socialIntegrationsFacebookSearchFriends(prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		socialIntegrationsFacebookSearchFriendsRequestBuilder(prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Find Facebook Friends
      Find the current user's Facebook Friends who also registered in the same App.

	  - GET /social/facebook/search_friends.json
	  - Find the current user's Facebook Friends who also registered in the same App.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func socialIntegrationsFacebookSearchFriendsRequestBuilder(prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/social/facebook/search_friends.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Link an external Account
      Associates an external account with an existing Appcelerator Cloud Services
user account. Registered and logged in Appcelerator Cloud Services users can
link one or more external accounts to their existing account. Once linked, the
user can login using either Appcelerator Cloud Services account or any of the
linked external accounts.

	  - parameter iD: (formData) External account's user ID. Optional for Facebook; if ID is missing and `type`
is `facebook`, Appcelerator Cloud Services uses the Facebook token to obtain
the user ID.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter type: (formData) Type of the external account, for example, "facebook", "linkedin", or
"twitter".
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter token: (formData) Token provided by the external account. Currently only Facebook tokens are
validated  by the Appcelerator Cloud Services server.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func socialIntegrationsExternalAccountLink(iD: String , type: String , token: String , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		socialIntegrationsExternalAccountLinkRequestBuilder(iD: iD, type: type, token: token, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Link an external Account
      Associates an external account with an existing Appcelerator Cloud Services
user account. Registered and logged in Appcelerator Cloud Services users can
link one or more external accounts to their existing account. Once linked, the
user can login using either Appcelerator Cloud Services account or any of the
linked external accounts.

	  - POST /users/external_account_link.json
	  - Associates an external account with an existing Appcelerator Cloud Services
user account. Registered and logged in Appcelerator Cloud Services users can
link one or more external accounts to their existing account. Once linked, the
user can login using either Appcelerator Cloud Services account or any of the
linked external accounts.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  id: (formData) External account's user ID. Optional for Facebook; if ID is missing and `type`
is `facebook`, Appcelerator Cloud Services uses the Facebook token to obtain
the user ID.
  
		- parameter  type: (formData) Type of the external account, for example, "facebook", "linkedin", or
"twitter".
  
		- parameter  token: (formData) Token provided by the external account. Currently only Facebook tokens are
validated  by the Appcelerator Cloud Services server.
  
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func socialIntegrationsExternalAccountLinkRequestBuilder(iD: String,type: String,token: String,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/users/external_account_link.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"id": iD as AnyObject , 
		 	"type": type as AnyObject , 
		 	"token": token as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Login with external account
      Users can login using an external account such as Facebook, Twitter,
Linkedin, etc without creating an account with Appcelerator Cloud Services
ahead of time. The external account login creates a Appcelerator Cloud
Services account if it hasn't been created, otherwise, it will login using the
user who has the matching external account info.

	  - parameter iD: (formData) External account's user ID. Optional for Facebook; if ID is missing and `type`
is `facebook`, Appcelerator Cloud Services uses the Facebook token to obtain
the user ID.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter type: (formData) Type of the external account, for example, "facebook", "linkedin", or
"twitter".
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter token: (formData) Token provided by the external account. Currently only Facebook tokens are
validated  by the Appcelerator Cloud Services server.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func socialIntegrationsExternalAccountLogin(iD: String , type: String , token: String , aclName: String? = nil , aclId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		socialIntegrationsExternalAccountLoginRequestBuilder(iD: iD, type: type, token: token, aclName: aclName, aclId: aclId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Login with external account
      Users can login using an external account such as Facebook, Twitter,
Linkedin, etc without creating an account with Appcelerator Cloud Services
ahead of time. The external account login creates a Appcelerator Cloud
Services account if it hasn't been created, otherwise, it will login using the
user who has the matching external account info.

	  - POST /users/external_account_login.json
	  - Users can login using an external account such as Facebook, Twitter,
Linkedin, etc without creating an account with Appcelerator Cloud Services
ahead of time. The external account login creates a Appcelerator Cloud
Services account if it hasn't been created, otherwise, it will login using the
user who has the matching external account info.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  id: (formData) External account's user ID. Optional for Facebook; if ID is missing and `type`
is `facebook`, Appcelerator Cloud Services uses the Facebook token to obtain
the user ID.
  
		- parameter  type: (formData) Type of the external account, for example, "facebook", "linkedin", or
"twitter".
  
		- parameter  token: (formData) Token provided by the external account. Currently only Facebook tokens are
validated  by the Appcelerator Cloud Services server.
  
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func socialIntegrationsExternalAccountLoginRequestBuilder(iD: String,type: String,token: String,aclName: String? = nil,aclId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/users/external_account_login.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"id": iD as AnyObject , 
		 	"type": type as AnyObject , 
		 	"token": token as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Unlink an external account
      Disassociate an external account from a Appcelerator Cloud Services user
account.

	  - parameter iD: (formData) External account's user ID.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter type: (formData) Type of the external account, for example, "facebook", "linkedin", or
"twitter".
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func socialIntegrationsExternalAccountUnlink(iD: String , type: String , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		socialIntegrationsExternalAccountUnlinkRequestBuilder(iD: iD, type: type, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Unlink an external account
      Disassociate an external account from a Appcelerator Cloud Services user
account.

	  - DELETE /users/external_account_unlink.json
	  - Disassociate an external account from a Appcelerator Cloud Services user
account.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  id: (formData) External account's user ID.
  
		- parameter  type: (formData) Type of the external account, for example, "facebook", "linkedin", or
"twitter".
  
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func socialIntegrationsExternalAccountUnlinkRequestBuilder(iD: String,type: String,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/users/external_account_unlink.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"id": iD as AnyObject , 
		 	"type": type as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
