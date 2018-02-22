// /Apis/AdminAPI.swift
 

import Foundation

public class AdminAPI: APIBase { 
	/**
	  Login as admin using dashboard authentication or dashboard secret token(x-auth-token). x-auth-token has high priority than connect.sid if they are existing at the same time.
      
	  - parameter connectSid: (query) App name 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter groupId: (query)  (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter ct: (query) If the app is enterprise. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter xAuthToken: (query)  (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter email: (query)  (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func adminLogin360(connectSid: String , groupId: String? = nil , ct: String? = nil , xAuthToken: String? = nil , email: String? = nil ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		adminLogin360RequestBuilder(connectSid: connectSid, groupId: groupId, ct: ct, xAuthToken: xAuthToken, email: email).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Login as admin using dashboard authentication or dashboard secret token(x-auth-token). x-auth-token has high priority than connect.sid if they are existing at the same time.
      
	  - GET /admins/login360.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  connect.sid: (query) App name  
		- parameter  group_id: (query)  (optional) 
		- parameter  ct: (query) If the app is enterprise. (optional) 
		- parameter  x-auth-token: (query)  (optional) 
		- parameter  email: (query)  (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func adminLogin360RequestBuilder(connectSid: String,groupId: String? = nil,ct: String? = nil,xAuthToken: String? = nil,email: String? = nil) -> RequestBuilder<SuccessResponse> { 
		let path = "/admins/login360.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"connect.sid": connectSid as AnyObject, 
			"group_id": groupId as AnyObject, 
			"ct": ct as AnyObject, 
			"x-auth-token": xAuthToken as AnyObject, 
			"email": email as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
