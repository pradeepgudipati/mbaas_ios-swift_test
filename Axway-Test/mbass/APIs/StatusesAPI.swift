// /Apis/StatusesAPI.swift
 

import Foundation

public class StatusesAPI: APIBase { 
	/**
	  Deletes multiple Statuses objects.
      Deletes Statuses objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Statuses objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process. The associated 
{@link #event Event}, {@link #photo Photo}, or {@link #place Place} of each matched object 
is not deleted.   

You must be an application admin to run this command.

	  - parameter where_: (formData) Encoded JSON object that specifies constraint values for Statuses objects to delete.
If not specified, all Statuses objects are deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func statusesBatchDelete(where_: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		statusesBatchDeleteRequestBuilder(where_: where_).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Deletes multiple Statuses objects.
      Deletes Statuses objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Statuses objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process. The associated 
{@link #event Event}, {@link #photo Photo}, or {@link #place Place} of each matched object 
is not deleted.   

You must be an application admin to run this command.

	  - DELETE /statuses/batch_delete.json
	  - Deletes Statuses objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Statuses objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process. The associated 
{@link #event Event}, {@link #photo Photo}, or {@link #place Place} of each matched object 
is not deleted.   

You must be an application admin to run this command.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  where: (formData) Encoded JSON object that specifies constraint values for Statuses objects to delete.
If not specified, all Statuses objects are deleted.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func statusesBatchDeleteRequestBuilder(where_: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/statuses/batch_delete.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"where": where_ as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Retrieves the total number of Status objects.
      Retrieves the total number of Status objects.
	*/

	public class func statusesCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		statusesCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of Status objects.
      Retrieves the total number of Status objects.
	  - GET /statuses/count.json
	  - Retrieves the total number of Status objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func statusesCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/statuses/count.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Create a Status
      Creates a status for the currenty logged in user. You can optionally associate a new status with 
either an existing {@link Places} object or an {@link Events} object, but not both.

Application admins can create a status on behalf of another user by including the
`su_id` field in the request.

	  - parameter message: (formData) Status message. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter placeId: (formData) ID of the {@link Places} object this status is associated with. You can associate the status 
either with a {@link Places} object or an {@link Events} object, but not both.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter eventId: (formData) ID of the {@link Events} object this status is associated with. You can associate the status 
either with an {@link Events} object or a {@link Places} object, but not both.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New photo to attach as the primary photo for this status.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of an existing photo to attach as the primary photo for this status.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma separated list of tags for this status.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this status.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this status.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to create the status on behalf of. You must be logged in as an application admin
to create a status on behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func statusesCreate(message: String , placeId: String? = nil , eventId: String? = nil , photo: NSURL? = nil , photoId: String? = nil , tags: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		statusesCreateRequestBuilder(message: message, placeId: placeId, eventId: eventId, photo: photo, photoId: photoId, tags: tags, customFields: customFields, aclName: aclName, aclId: aclId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Create a Status
      Creates a status for the currenty logged in user. You can optionally associate a new status with 
either an existing {@link Places} object or an {@link Events} object, but not both.

Application admins can create a status on behalf of another user by including the
`su_id` field in the request.

	  - POST /statuses/create.json
	  - Creates a status for the currenty logged in user. You can optionally associate a new status with 
either an existing {@link Places} object or an {@link Events} object, but not both.

Application admins can create a status on behalf of another user by including the
`su_id` field in the request.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  message: (formData) Status message.  
		- parameter  place_id: (formData) ID of the {@link Places} object this status is associated with. You can associate the status 
either with a {@link Places} object or an {@link Events} object, but not both.
 (optional) 
		- parameter  event_id: (formData) ID of the {@link Events} object this status is associated with. You can associate the status 
either with an {@link Events} object or a {@link Places} object, but not both.
 (optional) 
		- parameter  photo: (formData) New photo to attach as the primary photo for this status.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional) 
		- parameter  photo_id: (formData) ID of an existing photo to attach as the primary photo for this status.
 (optional) 
		- parameter  tags: (formData) Comma separated list of tags for this status.
 (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this status.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this status.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) User ID to create the status on behalf of. You must be logged in as an application admin
to create a status on behalf of another user.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func statusesCreateRequestBuilder(message: String,placeId: String? = nil,eventId: String? = nil,photo: NSURL? = nil,photoId: String? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/statuses/create.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"message": message as AnyObject , 
		 	"place_id": placeId as AnyObject , 
		 	"event_id": eventId as AnyObject , 
		 	"photo": photo as AnyObject , 
		 	"photo_id": photoId as AnyObject , 
		 	"tags": tags as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Delete a Status
      Deletes a status for the currenty logged in user.
The associated {@link #event Event}, {@link #photo Photo}, or {@link #place Place} is not deleted.

	  - parameter statusId: (formData) ID of the status to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to destroy the status on behalf of.

The current login user must be an application admin to destroy a status on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func statusesDelete(statusId: String , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		statusesDeleteRequestBuilder(statusId: statusId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete a Status
      Deletes a status for the currenty logged in user.
The associated {@link #event Event}, {@link #photo Photo}, or {@link #place Place} is not deleted.

	  - DELETE /statuses/delete.json
	  - Deletes a status for the currenty logged in user.
The associated {@link #event Event}, {@link #photo Photo}, or {@link #place Place} is not deleted.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  status_id: (formData) ID of the status to delete.  
		- parameter  su_id: (formData) User ID to destroy the status on behalf of.

The current login user must be an application admin to destroy a status on
behalf of another user.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func statusesDeleteRequestBuilder(statusId: String,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/statuses/delete.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"status_id": statusId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Custom Query Status
      Performs a custom query of statuses with sorting and pagination. Currently you
can not query or sort data stored inside array or hash in custom fields.


In addition to custom fields, the following pre-defined fields can be used to
query and sort statuses:

*   `user_id` : `String`.  Status owner's user ID.
*   `event_id` : `String`.  ID for the {@link Events} associated with this status.
*   `place_id` : `String`.  ID for the {@link Places Place} associated with this status.
*   `created_at` : `Date`.  Timestamp when the status was created.
*   `updated_at` : `Date`.  Timestamp when the status was last updated.

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
	  - parameter where_: (query) Constraint values for fields. `where` should be encoded JSON.

If `where` is not specified, `query` returns all objects.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter order: (query) Sort results by one or more fields.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter sel: (query) Selects the object fields to display. Do not use this parameter with `unsel`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter showUserLike: (query) If set to **true**, each Status object in the response includes `"current_user_liked: true"`
 if the current user has liked the object. If the user has not liked the object, the 
`current_user_liked` field is not included in the response.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter unsel: (query) Selects the object fields NOT to display. Do not use this parameter with `sel`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in the response JSON.  

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also 
some important data related to the returned objects, such as owners and
referenced objects.  

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func statusesQuery(page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , showUserLike: Bool? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		statusesQueryRequestBuilder(page: page, perPage: perPage, limit: limit, skip: skip, where_: where_, order: order, sel: sel, showUserLike: showUserLike, unsel: unsel, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Custom Query Status
      Performs a custom query of statuses with sorting and pagination. Currently you
can not query or sort data stored inside array or hash in custom fields.


In addition to custom fields, the following pre-defined fields can be used to
query and sort statuses:

*   `user_id` : `String`.  Status owner's user ID.
*   `event_id` : `String`.  ID for the {@link Events} associated with this status.
*   `place_id` : `String`.  ID for the {@link Places Place} associated with this status.
*   `created_at` : `Date`.  Timestamp when the status was created.
*   `updated_at` : `Date`.  Timestamp when the status was last updated.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /statuses/query.json
	  - Performs a custom query of statuses with sorting and pagination. Currently you
can not query or sort data stored inside array or hash in custom fields.


In addition to custom fields, the following pre-defined fields can be used to
query and sort statuses:

*   `user_id` : `String`.  Status owner's user ID.
*   `event_id` : `String`.  ID for the {@link Events} associated with this status.
*   `place_id` : `String`.  ID for the {@link Places Place} associated with this status.
*   `created_at` : `Date`.  Timestamp when the status was created.
*   `updated_at` : `Date`.  Timestamp when the status was last updated.

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
		- parameter  where: (query) Constraint values for fields. `where` should be encoded JSON.

If `where` is not specified, `query` returns all objects.
 (optional) 
		- parameter  order: (query) Sort results by one or more fields.
 (optional) 
		- parameter  sel: (query) Selects the object fields to display. Do not use this parameter with `unsel`.
 (optional) 
		- parameter  show_user_like: (query) If set to **true**, each Status object in the response includes `"current_user_liked: true"`
 if the current user has liked the object. If the user has not liked the object, the 
`current_user_liked` field is not included in the response.
 (optional) 
		- parameter  unsel: (query) Selects the object fields NOT to display. Do not use this parameter with `sel`.
 (optional) 
		- parameter  response_json_depth: (query) Nested object depth level counts in the response JSON.  

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also 
some important data related to the returned objects, such as owners and
referenced objects.  

Default is 1, valid range is 1 to 8.
 (optional) 
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func statusesQueryRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,showUserLike: Bool? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/statuses/query.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"limit": limit as AnyObject, 
			"skip": skip as AnyObject, 
			"where": where_ as AnyObject, 
			"order": order as AnyObject, 
			"sel": sel as AnyObject, 
			"show_user_like": showUserLike as AnyObject, 
			"unsel": unsel as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Show a status
      Returns the identified status message.

	  - parameter statusId: (query) ID of the status to show. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects such as object's owner or
referenced objects.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter showUserLike: (query) If set to **true** the Status object in the response will include `"current_user_liked: true"`
if the current user has liked the object. If the user has not liked the object, the 
`current_user_liked` field is not included in the response.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func statusesShow(statusId: String , responseJsonDepth: Int32? = nil , showUserLike: Bool? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		statusesShowRequestBuilder(statusId: statusId, responseJsonDepth: responseJsonDepth, showUserLike: showUserLike, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show a status
      Returns the identified status message.

	  - GET /statuses/show.json
	  - Returns the identified status message.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  status_id: (query) ID of the status to show.  
		- parameter  response_json_depth: (query) Nested object depth level counts in response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects such as object's owner or
referenced objects.

Default is 1, valid range is 1 to 8.
 (optional) 
		- parameter  show_user_like: (query) If set to **true** the Status object in the response will include `"current_user_liked: true"`
if the current user has liked the object. If the user has not liked the object, the 
`current_user_liked` field is not included in the response.
 (optional) 
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func statusesShowRequestBuilder(statusId: String,responseJsonDepth: Int32? = nil,showUserLike: Bool? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/statuses/show.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"status_id": statusId as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"show_user_like": showUserLike as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Updates a Status
      Updates a status for the currenty logged in user. You can optionally associate the updated status 
with either an existing {@link Places} object or an {@link Events} object, but not both.

Application admins can update another user's status on their behalf by including the
`su_id` field in the request.

	  - parameter statusId: (formData) ID of the status to update. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter message: (formData) Status message. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter placeId: (formData) ID of the {@link Places} object this status is associated with. You can associate the status 
either with a {@link Places} object or an {@link Events} object, but not both.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter eventId: (formData) ID of the {@link Events} object this status is associated with. You can associate the status 
either with an {@link Events} object or a {@link Places} object, but not both.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New photo to attach as the primary photo for this status.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of an existing photo to attach as the primary photo for this status.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma separated list of tags for this status.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this status.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this status.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to update the status on behalf of.

The current login user must be an application admin to update a status on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func statusesUpdate(statusId: String , message: String? = nil , placeId: String? = nil , eventId: String? = nil , photo: NSURL? = nil , photoId: String? = nil , tags: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		statusesUpdateRequestBuilder(statusId: statusId, message: message, placeId: placeId, eventId: eventId, photo: photo, photoId: photoId, tags: tags, customFields: customFields, aclName: aclName, aclId: aclId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Updates a Status
      Updates a status for the currenty logged in user. You can optionally associate the updated status 
with either an existing {@link Places} object or an {@link Events} object, but not both.

Application admins can update another user's status on their behalf by including the
`su_id` field in the request.

	  - PUT /statuses/update.json
	  - Updates a status for the currenty logged in user. You can optionally associate the updated status 
with either an existing {@link Places} object or an {@link Events} object, but not both.

Application admins can update another user's status on their behalf by including the
`su_id` field in the request.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  status_id: (formData) ID of the status to update.  
		- parameter  message: (formData) Status message. (optional) 
		- parameter  place_id: (formData) ID of the {@link Places} object this status is associated with. You can associate the status 
either with a {@link Places} object or an {@link Events} object, but not both.
 (optional) 
		- parameter  event_id: (formData) ID of the {@link Events} object this status is associated with. You can associate the status 
either with an {@link Events} object or a {@link Places} object, but not both.
 (optional) 
		- parameter  photo: (formData) New photo to attach as the primary photo for this status.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional) 
		- parameter  photo_id: (formData) ID of an existing photo to attach as the primary photo for this status.
 (optional) 
		- parameter  tags: (formData) Comma separated list of tags for this status.
 (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this status.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this status.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) User ID to update the status on behalf of.

The current login user must be an application admin to update a status on
behalf of another user.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func statusesUpdateRequestBuilder(statusId: String,message: String? = nil,placeId: String? = nil,eventId: String? = nil,photo: NSURL? = nil,photoId: String? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/statuses/update.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"status_id": statusId as AnyObject , 
		 	"message": message as AnyObject , 
		 	"place_id": placeId as AnyObject , 
		 	"event_id": eventId as AnyObject , 
		 	"photo": photo as AnyObject , 
		 	"photo_id": photoId as AnyObject , 
		 	"tags": tags as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
