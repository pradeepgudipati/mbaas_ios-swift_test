// /Apis/OrgAPI.swift
 

import Foundation

public class OrgAPI: APIBase { 
	/**
	  Set production apps as the package info in the global app db.
      Set production apps as the package info in the global app db.
	  - parameter orgId: (path) Set production apps as the package info in the global app db. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter packageInfo: (formData) A hash string which must include 'apiRateMinute' and 'allowProduction', the 'type' of 'packageInfo' can be 'free', 'starter', 'trial', 'professional', or 'enterprise'. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter xAuthToken: (header) The dashboard access token. 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func orgOrgUpdate(orgId: String , xAuthToken: String , packageInfo: String ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		orgOrgUpdateRequestBuilder(orgId: orgId, xAuthToken: xAuthToken, packageInfo: packageInfo).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Set production apps as the package info in the global app db.
      Set production apps as the package info in the global app db.
	  - PUT /org/{org_id}
	  - Set production apps as the package info in the global app db.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  org_id: (path) Set production apps as the package info in the global app db.  
		- parameter  packageInfo: (formData) A hash string which must include 'apiRateMinute' and 'allowProduction', the 'type' of 'packageInfo' can be 'free', 'starter', 'trial', 'professional', or 'enterprise'.  
		- parameter  x-auth-token: (header) The dashboard access token.  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func orgOrgUpdateRequestBuilder(orgId: String,xAuthToken: String?,packageInfo: String) -> RequestBuilder<[String:Any]> {
		var path = "/org/{org_id}"
		path = path.replacingOccurrences(of: "{org_id}", with: "\(orgId)", options: String.CompareOptions.literal, range: nil)
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"packageInfo": packageInfo as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]

		  if let xAuthToken = xAuthToken {
            customHeadersDict["x-auth-token"] = xAuthToken
        }

		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Used to disable the production apps according to setting the 'status' to 1 in the global_apps collection.
      Used to disable the production apps according to setting the 'status' to 1 in the global_apps collection.
	  - parameter orgId: (path) Used to disable the production apps according to setting the 'status' to 1 in the global_apps collection. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter xAuthToken: (header) The dashboard access token. 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func orgOrgDelete(orgId: String , xAuthToken: String ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		orgOrgDeleteRequestBuilder(orgId: orgId, xAuthToken: xAuthToken).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Used to disable the production apps according to setting the 'status' to 1 in the global_apps collection.
      Used to disable the production apps according to setting the 'status' to 1 in the global_apps collection.
	  - DELETE /org/{org_id}
	  - Used to disable the production apps according to setting the 'status' to 1 in the global_apps collection.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  org_id: (path) Used to disable the production apps according to setting the 'status' to 1 in the global_apps collection.  
		- parameter  x-auth-token: (header) The dashboard access token.  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func orgOrgDeleteRequestBuilder(orgId: String,xAuthToken: String?) -> RequestBuilder<[String:Any]> { 
		var path = "/org/{org_id}"
		path = path.replacingOccurrences(of: "{org_id}", with: "\(orgId)", options: String.CompareOptions.literal, range: nil)
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]

		  if let xAuthToken = xAuthToken {
            customHeadersDict["x-auth-token"] = xAuthToken
        }

		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}
