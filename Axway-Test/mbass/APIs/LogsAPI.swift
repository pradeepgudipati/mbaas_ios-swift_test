// /Apis/LogsAPI.swift
 

import Foundation

public class LogsAPI: APIBase { 
	/**
	  Query details about a specific push notification log item.
      Performs a custom query for details about a specific Arrow push notification log item specified
in the query's `where` clause. Returns a {@link PushLogDetails} object for the specified log item.

	  - parameter where_: (query) Where clause whose value is JSON object consisting of the field name "push_id"
and the ID of the push notification log item to query for, for example:

    where={"push_id":"<PUSHLOG_ID>"}
 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func logsQuerypushlogdetails(where_: String ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		logsQuerypushlogdetailsRequestBuilder(where_: where_).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Query details about a specific push notification log item.
      Performs a custom query for details about a specific Arrow push notification log item specified
in the query's `where` clause. Returns a {@link PushLogDetails} object for the specified log item.

	  - GET /logs/querypushlogdetails.json
	  - Performs a custom query for details about a specific Arrow push notification log item specified
in the query's `where` clause. Returns a {@link PushLogDetails} object for the specified log item.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  where: (query) Where clause whose value is JSON object consisting of the field name "push_id"
and the ID of the push notification log item to query for, for example:

    where={"push_id":"<PUSHLOG_ID>"}
  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func logsQuerypushlogdetailsRequestBuilder(where_: String) -> RequestBuilder<[String:Any]> { 
		let path = "/logs/querypushlogdetails.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"where": where_ as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Query Arrow push notification logs.
      Performs a custom query of Arrow push notification logs with sorting and pagination. Returns
a list of {@link PushLogs} objects that matched the query parameters.

To get additional details about a specific PushLogs item, pass the value of PushLogs#_id to
a {@link Logs#querypushlogdetails} query.

	  - parameter where_: (query) Constraint values for fields. `where` should be JSON encoded.

If `where` is not specified, query returns all objects.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func logsQuerypushlogs(where_: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		logsQuerypushlogsRequestBuilder(where_: where_).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Query Arrow push notification logs.
      Performs a custom query of Arrow push notification logs with sorting and pagination. Returns
a list of {@link PushLogs} objects that matched the query parameters.

To get additional details about a specific PushLogs item, pass the value of PushLogs#_id to
a {@link Logs#querypushlogdetails} query.

	  - GET /logs/querypushlogs.json
	  - Performs a custom query of Arrow push notification logs with sorting and pagination. Returns
a list of {@link PushLogs} objects that matched the query parameters.

To get additional details about a specific PushLogs item, pass the value of PushLogs#_id to
a {@link Logs#querypushlogdetails} query.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  where: (query) Constraint values for fields. `where` should be JSON encoded.

If `where` is not specified, query returns all objects.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func logsQuerypushlogsRequestBuilder(where_: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/logs/querypushlogs.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"where": where_ as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
