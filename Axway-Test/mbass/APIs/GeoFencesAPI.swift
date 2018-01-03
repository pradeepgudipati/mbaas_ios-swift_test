// /Apis/GeoFencesAPI.swift
 

import Foundation

public class GeoFencesAPI: APIBase { 
	/**
	  Retrieves the total number of GeoFence objects.
      Retrieves the total number of GeoFence objects.
	*/

	public class func geoFencesCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		geoFencesCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of GeoFence objects.
      Retrieves the total number of GeoFence objects.
	  - GET /geo_fences/count.json
	  - Retrieves the total number of GeoFence objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func geoFencesCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/geo_fences/count.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Creates a Geofence.
      Creates a geo-fence object with an optional start and end time.

	  - parameter geoFence: (formData) JSON object describing the geographic perimeter, data payload, and start and end time
for the geo-fence object.  Specify the following propertes:

  * `loc` (Hash): **Required.** Geographic perimeter.  See {@link GeoFences#loc}.
  * `payload` (Hash): **Required.** JSON-encoded data to retrieve if a device intersects
    the geographic perimeter.
  * `start_time` (Date): Datetime to start the geo-fence.
  * `end_time` (Date): Datetime to end the geo-fence.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func geoFencesCreate(geoFence: String , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		geoFencesCreateRequestBuilder(geoFence: geoFence, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Creates a Geofence.
      Creates a geo-fence object with an optional start and end time.

	  - POST /geo_fences/create.json
	  - Creates a geo-fence object with an optional start and end time.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  geo_fence: (formData) JSON object describing the geographic perimeter, data payload, and start and end time
for the geo-fence object.  Specify the following propertes:

  * `loc` (Hash): **Required.** Geographic perimeter.  See {@link GeoFences#loc}.
  * `payload` (Hash): **Required.** JSON-encoded data to retrieve if a device intersects
    the geographic perimeter.
  * `start_time` (Date): Datetime to start the geo-fence.
  * `end_time` (Date): Datetime to end the geo-fence.
  
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func geoFencesCreateRequestBuilder(geoFence: String,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/geo_fences/create.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"geo_fence": geoFence as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Deletes a Geofence
      Deletes an existing geo-fence object.

	  - parameter iD: (formData) ID of the geo-fence object to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func geoFencesDelete(iD: String , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		geoFencesDeleteRequestBuilder(iD: iD, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Deletes a Geofence
      Deletes an existing geo-fence object.

	  - DELETE /geo_fences/delete.json
	  - Deletes an existing geo-fence object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  id: (formData) ID of the geo-fence object to delete.  
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func geoFencesDeleteRequestBuilder(iD: String,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/geo_fences/delete.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"id": iD as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Custom Query of Geofences
      Perform custom query of geofences with sorting and paginating.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).        

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - parameter page: (query) <p class="note">
Starting in ArrowDB 1.1.5, page and per_page are no longer supported in query operations. 
Applications should instead use <strong>skip</strong> and <strong>limit</strong> 
query parameters.
</p>
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) <p class="note">
Starting in ArrowDB 1.1.5, page and per_page are no longer supported in query operations. 
Applications should instead use <strong>skip</strong> and <strong>limit</strong> 
query parameters.
</p>
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter limit: (query) The number of records to fetch. The value must be greater than 0, and no greater than 
1000, or an HTTP 400 (Bad Request) error will be returned. Default value of `limit` is 10.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter skip: (query) The number of records to skip. The value must be greater than or equal to 0, and no greater 
than 4999, or an HTTP 400 error will be returned. To skip 5000 records or more 
you need to perform a range-based query. See 
<a href="#!/guide/search_query-section-query-pagination">Query Pagination</a> for more information.</p>
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level for response data.

Default is 1, valid range is 1 to 8.

Response data may include references to other objects, which the server performs
additional queries on to include in the response. To reduce server response time,
set this parameter to a lower value to reduce server API calls.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter where_: (query) A JSON-encoded object that defines the query used.

The following fields can be used for the query:

  * {@link GeoFences#start_time}
  * {@link GeoFences#end_time}
  * `loc` : For this property, specify a
    [MongoDB Geospatial Query](http://docs.mongodb.org/manual/reference/operator/query-geospatial/).

If `where` is not specified, `query` returns all objects.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func geoFencesQuery(page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , responseJsonDepth: Int32? = nil , where_: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		geoFencesQueryRequestBuilder(page: page, perPage: perPage, limit: limit, skip: skip, responseJsonDepth: responseJsonDepth, where_: where_, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Custom Query of Geofences
      Perform custom query of geofences with sorting and paginating.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).        

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /geo_fences/query.json
	  - Perform custom query of geofences with sorting and paginating.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).        

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  page: (query) <p class="note">
Starting in ArrowDB 1.1.5, page and per_page are no longer supported in query operations. 
Applications should instead use <strong>skip</strong> and <strong>limit</strong> 
query parameters.
</p>
 (optional) 
		- parameter  per_page: (query) <p class="note">
Starting in ArrowDB 1.1.5, page and per_page are no longer supported in query operations. 
Applications should instead use <strong>skip</strong> and <strong>limit</strong> 
query parameters.
</p>
 (optional) 
		- parameter  limit: (query) The number of records to fetch. The value must be greater than 0, and no greater than 
1000, or an HTTP 400 (Bad Request) error will be returned. Default value of `limit` is 10.
 (optional) 
		- parameter  skip: (query) The number of records to skip. The value must be greater than or equal to 0, and no greater 
than 4999, or an HTTP 400 error will be returned. To skip 5000 records or more 
you need to perform a range-based query. See 
<a href="#!/guide/search_query-section-query-pagination">Query Pagination</a> for more information.</p>
 (optional) 
		- parameter  response_json_depth: (query) Nested object depth level for response data.

Default is 1, valid range is 1 to 8.

Response data may include references to other objects, which the server performs
additional queries on to include in the response. To reduce server response time,
set this parameter to a lower value to reduce server API calls.
 (optional) 
		- parameter  where: (query) A JSON-encoded object that defines the query used.

The following fields can be used for the query:

  * {@link GeoFences#start_time}
  * {@link GeoFences#end_time}
  * `loc` : For this property, specify a
    [MongoDB Geospatial Query](http://docs.mongodb.org/manual/reference/operator/query-geospatial/).

If `where` is not specified, `query` returns all objects.
 (optional) 
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func geoFencesQueryRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,responseJsonDepth: Int32? = nil,where_: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/geo_fences/query.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"limit": limit as AnyObject, 
			"skip": skip as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"where": where_ as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Updates a Geofence
      Updates an existing geo-fence object.

	  - parameter iD: (formData) ID of the geo-fence object to update. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter geoFence: (formData) JSON object describing the geographic perimeter, data payload, and start and end time
for the geo-fence object.  Specify the following propertes:

  * `loc` (Hash): **Required.** Geographic perimeter.  See {@link GeoFences#loc}.
  * `payload` (Hash): JSON-encoded data to retrieve if a device intersects the geographic
    perimeter.
  * `start_time` (Date): Datetime to start the geo-fence.
  * `end_time` (Date): Datetime to end the geo-fence.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func geoFencesUpdate(iD: String , geoFence: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		geoFencesUpdateRequestBuilder(iD: iD, geoFence: geoFence, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Updates a Geofence
      Updates an existing geo-fence object.

	  - POST /geo_fences/update.json
	  - Updates an existing geo-fence object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  id: (formData) ID of the geo-fence object to update.  
		- parameter  geo_fence: (formData) JSON object describing the geographic perimeter, data payload, and start and end time
for the geo-fence object.  Specify the following propertes:

  * `loc` (Hash): **Required.** Geographic perimeter.  See {@link GeoFences#loc}.
  * `payload` (Hash): JSON-encoded data to retrieve if a device intersects the geographic
    perimeter.
  * `start_time` (Date): Datetime to start the geo-fence.
  * `end_time` (Date): Datetime to end the geo-fence.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func geoFencesUpdateRequestBuilder(iD: String,geoFence: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/geo_fences/update.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"id": iD as AnyObject , 
		 	"geo_fence": geoFence as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

        let customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
