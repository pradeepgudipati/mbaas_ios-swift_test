// /Apis/PushSchedulesAPI.swift
 

import Foundation

public class PushSchedulesAPI: APIBase { 
	/**
	  create
      Creates a scheduled push notification.  At minimum, you must specify the `start_time`,
and `payload` parameters. A push schedule can optionally define a location query so that
only devices in the specified geographic region will receive the push notification.

The current user must be an application admin to use this API.

	  - parameter schedule: (formData) Push notification to schedule. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter where_: (formData) A JSON-encoded object that defines a location query used to select the devices
that will receive the scheduled notification. Up to 1000 users can be returned by the query. To specify a location query, set the `loc` field to a
[MongoDB Geospatial Query](http://docs.mongodb.org/manual/reference/operator/query-geospatial/).
The following query searches for all users within 2 km of Oakland, CA, USA:

    where={
      "loc": {
        "$nearSphere" : { 
          "$geometry" : { 
            "type" : "Point" , 
            "coordinates" : [-122.2708,37.8044] } , 
            "$maxDistance" : 2000 
          }
        }
      }

For details about using the `where` parameter, see the [Search and Query guide](#!/guide/search_query).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushSchedulesCreate(schedule: String , where_: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushSchedulesCreateRequestBuilder(schedule: schedule, where_: where_, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  create
      Creates a scheduled push notification.  At minimum, you must specify the `start_time`,
and `payload` parameters. A push schedule can optionally define a location query so that
only devices in the specified geographic region will receive the push notification.

The current user must be an application admin to use this API.

	  - POST /push_schedule/create.json
	  - Creates a scheduled push notification.  At minimum, you must specify the `start_time`,
and `payload` parameters. A push schedule can optionally define a location query so that
only devices in the specified geographic region will receive the push notification.

The current user must be an application admin to use this API.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  schedule: (formData) Push notification to schedule.  
		- parameter  where: (formData) A JSON-encoded object that defines a location query used to select the devices
that will receive the scheduled notification. Up to 1000 users can be returned by the query. To specify a location query, set the `loc` field to a
[MongoDB Geospatial Query](http://docs.mongodb.org/manual/reference/operator/query-geospatial/).
The following query searches for all users within 2 km of Oakland, CA, USA:

    where={
      "loc": {
        "$nearSphere" : { 
          "$geometry" : { 
            "type" : "Point" , 
            "coordinates" : [-122.2708,37.8044] } , 
            "$maxDistance" : 2000 
          }
        }
      }

For details about using the `where` parameter, see the [Search and Query guide](#!/guide/search_query).
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushSchedulesCreateRequestBuilder(schedule: String,where_: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_schedule/create.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"schedule": schedule as AnyObject , 
		 	"where": where_ as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  delete
      Deletes a scheduled push notification.

The current user must be an application admin to use this API.

	  - parameter ids: (formData) Array of push schedule IDs to delete. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushSchedulesDelete(ids: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushSchedulesDeleteRequestBuilder(ids: ids, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  delete
      Deletes a scheduled push notification.

The current user must be an application admin to use this API.

	  - DELETE /push_schedule/delete.json
	  - Deletes a scheduled push notification.

The current user must be an application admin to use this API.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  ids: (formData) Array of push schedule IDs to delete. (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushSchedulesDeleteRequestBuilder(ids: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_schedule/delete.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"ids": ids as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  query
      Queries the list of scheduled push notifications.

The current logged-in user must be an application admin to use this API.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

	  - parameter name: (query) Name given to the scheduled push notification. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
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
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushSchedulesQuery(name: String? = nil , page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushSchedulesQueryRequestBuilder(name: name, page: page, perPage: perPage, limit: limit, skip: skip, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  query
      Queries the list of scheduled push notifications.

The current logged-in user must be an application admin to use this API.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

	  - GET /push_schedule/query.json
	  - Queries the list of scheduled push notifications.

The current logged-in user must be an application admin to use this API.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (query) Name given to the scheduled push notification. (optional) 
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
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushSchedulesQueryRequestBuilder(name: String? = nil,page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_schedule/query.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"name": name as AnyObject, 
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"limit": limit as AnyObject, 
			"skip": skip as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  update
      Updates a scheduled push notification. All parameters specified in the PushSchedules 
{@link PushSchedules#create} method can be updated, with the following exceptions:

  * The schedule's start time cannot be updated, and the `start_time` parameter is ignored, if provided.
  * When specifying a new `end_time` parameter, the new date and time must be greater than 
    the current time, and the previously specified `end_time` value must not have expired.

The current user must be an application administrator to invoke the command.

	  - parameter schedule: (formData) Push notification to schedule. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter iD: (formData) ID of the PushSchedule object returned by {@link PushSchedules#create}.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter where_: (formData) 
A JSON-encoded object that defines a location query used to select the devices
that will receive the scheduled notification. Up to 1000 users can be returned by the query. To specify a location query, set the `loc` field to a
[MongoDB Geospatial Query](http://docs.mongodb.org/manual/reference/operator/query-geospatial/).
The following query searches for all users within 2 km of Oakland, CA, USA:

    where={
      "loc": {
        "$nearSphere" : { 
          "$geometry" : { 
            "type" : "Point" , 
            "coordinates" : [-122.2708,37.8044] } , 
            "$maxDistance" : 2000 
          }
        }
      }

For an example of using this parameter, see the REST examples in the PushSchedules {@link PushSchedules#create} method.
For details about using the `where` parameter, see the [Search and Query guide](#!/guide/search_query).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushSchedulesUpdate(schedule: String , iD: String , where_: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushSchedulesUpdateRequestBuilder(schedule: schedule, iD: iD, where_: where_, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  update
      Updates a scheduled push notification. All parameters specified in the PushSchedules 
{@link PushSchedules#create} method can be updated, with the following exceptions:

  * The schedule's start time cannot be updated, and the `start_time` parameter is ignored, if provided.
  * When specifying a new `end_time` parameter, the new date and time must be greater than 
    the current time, and the previously specified `end_time` value must not have expired.

The current user must be an application administrator to invoke the command.

	  - POST /push_schedule/update.json
	  - Updates a scheduled push notification. All parameters specified in the PushSchedules 
{@link PushSchedules#create} method can be updated, with the following exceptions:

  * The schedule's start time cannot be updated, and the `start_time` parameter is ignored, if provided.
  * When specifying a new `end_time` parameter, the new date and time must be greater than 
    the current time, and the previously specified `end_time` value must not have expired.

The current user must be an application administrator to invoke the command.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  schedule: (formData) Push notification to schedule.  
		- parameter  id: (formData) ID of the PushSchedule object returned by {@link PushSchedules#create}.
  
		- parameter  where: (formData) 
A JSON-encoded object that defines a location query used to select the devices
that will receive the scheduled notification. Up to 1000 users can be returned by the query. To specify a location query, set the `loc` field to a
[MongoDB Geospatial Query](http://docs.mongodb.org/manual/reference/operator/query-geospatial/).
The following query searches for all users within 2 km of Oakland, CA, USA:

    where={
      "loc": {
        "$nearSphere" : { 
          "$geometry" : { 
            "type" : "Point" , 
            "coordinates" : [-122.2708,37.8044] } , 
            "$maxDistance" : 2000 
          }
        }
      }

For an example of using this parameter, see the REST examples in the PushSchedules {@link PushSchedules#create} method.
For details about using the `where` parameter, see the [Search and Query guide](#!/guide/search_query).
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushSchedulesUpdateRequestBuilder(schedule: String,iD: String,where_: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_schedule/update.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"schedule": schedule as AnyObject , 
		 	"id": iD as AnyObject , 
		 	"where": where_ as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
