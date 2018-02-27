// /Apis/SystemAPI.swift
 

import Foundation

public class SystemAPI: APIBase { 
	/**
	  Check the status of ArrowDB
      
	  - parameter ct: (query) If the app is enterprise. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func systemPing(ct: String? = nil ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		systemPingRequestBuilder(ct: ct).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Check the status of ArrowDB
      
	  - GET /admins/ping.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  ct: (query) If the app is enterprise. (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func systemPingRequestBuilder(ct: String? = nil) -> RequestBuilder<SuccessResponse> { 
		let path = "/admins/ping.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"ct": ct as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
