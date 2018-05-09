// /Apis/CheckinsAPI.swift
 

import Foundation

public class CheckinsAPI: APIBase { 
	/**
	  Deletes multiple Checkin objects.
      Deletes Checkin objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Checkin objects are deleted. Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process. The {@link #place Place}, 
{@link #event Event}, or {@link #photo Photo} associated with any of the matched objects is 
not deleted.

You must be an application admin to run this command.

	  - parameter where_: (formData) Encoded JSON object that specifies constraint values for Checkins objects to delete.
If not specified, all Checkins objects are deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func checkinsBatchDelete(where_: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		checkinsBatchDeleteRequestBuilder(where_: where_).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Deletes multiple Checkin objects.
      Deletes Checkin objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Checkin objects are deleted. Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process. The {@link #place Place}, 
{@link #event Event}, or {@link #photo Photo} associated with any of the matched objects is 
not deleted.

You must be an application admin to run this command.

	  - DELETE /checkins/batch_delete.json
	  - Deletes Checkin objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Checkin objects are deleted. Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process. The {@link #place Place}, 
{@link #event Event}, or {@link #photo Photo} associated with any of the matched objects is 
not deleted.

You must be an application admin to run this command.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  where: (formData) Encoded JSON object that specifies constraint values for Checkins objects to delete.
If not specified, all Checkins objects are deleted.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func checkinsBatchDeleteRequestBuilder(where_: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/checkins/batch_delete.json"
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
	  Retrieves the total number of Checkin objects.
      Retrieves the total number of Checkin objects.
	*/

	public class func checkinsCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		checkinsCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of Checkin objects.
      Retrieves the total number of Checkin objects.
	  - GET /checkins/count.json
	  - Retrieves the total number of Checkin objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func checkinsCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/checkins/count.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Checkin to a Place or Event
      Creates a checkin associated with either a {@link Places} or {@link Events} object. 

You should specify either a Places or Events object, but not both. If both are
provided, the Places object will be used.

A checkin message is optional. The optional photo parameter contains the
binary data stream representing the photo included with the checkin. If a
photo is included, the response includes a "processed" flag which indicates if
the photo has been resized and stored reliably in the Appcelerator Cloud
Services storage engine. This will be false initially be false.

	  - parameter placeId: (formData) ID of the {@link Places} to check in to.

You can associate a checkin with either a {@link Places} or {@link Events} object but not both.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter eventId: (formData) ID of the {@link Events} to check in to.

You can associate a checkin with either a {@link Places} or {@link Events} object but not both.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter message: (formData) Message to attach to the checkin. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New photo to attach as the primary photo for the checkin.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of an existing photo to attach as the primary photo for the checkin.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (formData) Nested object depth level counts in response json.

In order to reduce server API calls from an application, the JSON response may
include not just the objects that are being queried/searched, but also
important data related to the queried objects, such as the object's owner or
referencing objects.

Default depth is 1. Valid values are 1-8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma separated list of tags for this checkin.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this checkin object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this checkin object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to create the checkin on behalf of.

The current login user must be an application admin to create a checkin on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func checkinsCreate(placeId: String? = nil , eventId: String? = nil , message: String? = nil , photo: NSURL? = nil , photoId: String? = nil , prettyJson: Bool? = nil , responseJsonDepth: Int32? = nil , tags: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		checkinsCreateRequestBuilder(placeId: placeId, eventId: eventId, message: message, photo: photo, photoId: photoId, prettyJson: prettyJson, responseJsonDepth: responseJsonDepth, tags: tags, customFields: customFields, aclName: aclName, aclId: aclId, suId: suId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Checkin to a Place or Event
      Creates a checkin associated with either a {@link Places} or {@link Events} object. 

You should specify either a Places or Events object, but not both. If both are
provided, the Places object will be used.

A checkin message is optional. The optional photo parameter contains the
binary data stream representing the photo included with the checkin. If a
photo is included, the response includes a "processed" flag which indicates if
the photo has been resized and stored reliably in the Appcelerator Cloud
Services storage engine. This will be false initially be false.

	  - POST /checkins/create.json
	  - Creates a checkin associated with either a {@link Places} or {@link Events} object. 

You should specify either a Places or Events object, but not both. If both are
provided, the Places object will be used.

A checkin message is optional. The optional photo parameter contains the
binary data stream representing the photo included with the checkin. If a
photo is included, the response includes a "processed" flag which indicates if
the photo has been resized and stored reliably in the Appcelerator Cloud
Services storage engine. This will be false initially be false.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  place_id: (formData) ID of the {@link Places} to check in to.

You can associate a checkin with either a {@link Places} or {@link Events} object but not both.
 (optional) 
		- parameter  event_id: (formData) ID of the {@link Events} to check in to.

You can associate a checkin with either a {@link Places} or {@link Events} object but not both.
 (optional) 
		- parameter  message: (formData) Message to attach to the checkin. (optional) 
		- parameter  photo: (formData) New photo to attach as the primary photo for the checkin.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional) 
		- parameter  photo_id: (formData) ID of an existing photo to attach as the primary photo for the checkin.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  response_json_depth: (formData) Nested object depth level counts in response json.

In order to reduce server API calls from an application, the JSON response may
include not just the objects that are being queried/searched, but also
important data related to the queried objects, such as the object's owner or
referencing objects.

Default depth is 1. Valid values are 1-8.
 (optional) 
		- parameter  tags: (formData) Comma separated list of tags for this checkin.
 (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this checkin object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this checkin object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) User ID to create the checkin on behalf of.

The current login user must be an application admin to create a checkin on
behalf of another user.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func checkinsCreateRequestBuilder(placeId: String? = nil,eventId: String? = nil,message: String? = nil,photo: NSURL? = nil,photoId: String? = nil,prettyJson: Bool? = nil,responseJsonDepth: Int32? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/checkins/create.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"place_id": placeId as AnyObject , 
		 	"event_id": eventId as AnyObject , 
		 	"message": message as AnyObject , 
		 	"photo": photo as AnyObject , 
		 	"photo_id": photoId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject , 
		 	"response_json_depth": responseJsonDepth as AnyObject , 
		 	"tags": tags as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"su_id": suId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Delete a Checkin
      Deletes a checkin. 

The {@link #place Place}, {@link #event Event}, or {@link #photo Photo} associated with the checkin
is not deleted.

An application admin can delete any Checkin object.

	  - parameter checkinId: (formData) ID of the checkin to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User to delete the Checkin object on behalf of. The user must be the creator of the object.

The current user must be an application admin to delete a Checkin object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func checkinsDelete(checkinId: String , prettyJson: Bool? = nil , suId: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		checkinsDeleteRequestBuilder(checkinId: checkinId, prettyJson: prettyJson, suId: suId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete a Checkin
      Deletes a checkin. 

The {@link #place Place}, {@link #event Event}, or {@link #photo Photo} associated with the checkin
is not deleted.

An application admin can delete any Checkin object.

	  - DELETE /checkins/delete.json
	  - Deletes a checkin. 

The {@link #place Place}, {@link #event Event}, or {@link #photo Photo} associated with the checkin
is not deleted.

An application admin can delete any Checkin object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  checkin_id: (formData) ID of the checkin to delete.  
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  su_id: (formData) User to delete the Checkin object on behalf of. The user must be the creator of the object.

The current user must be an application admin to delete a Checkin object on
behalf of another user.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func checkinsDeleteRequestBuilder(checkinId: String,prettyJson: Bool? = nil,suId: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/checkins/delete.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"checkin_id": checkinId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject , 
		 	"su_id": suId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Custom Query Checkins
      Performs a custom query of checkins with sorting and pagination. Currently you
can not query or sort data stored inside array or hash in custom fields.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - parameter page: (query) Request page number, default is 1.

<p class="note">This parameter is only available to ArrowDB applications created before ArrowDB 1.1.5. 
Applications created with ArrowDB 1.1.5 and later must use <a href="#!/guide/search_query-section-query-pagination">ranged-based queries</a> queries
to paginate their queries.</p>
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10.

<p class="note">This parameter is only available to ArrowDB applications created before ArrowDB 1.1.5. 
Applications created with ArrowDB 1.1.5 and later must use <a href="#!/guide/search_query-section-query-pagination">ranged-based queries</a> queries
to paginate their queries.</p>
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
	  - parameter showUserLike: (query) If set to **true**, each Checkin object in the response includes "current_user_liked: true"`
if the current user has liked the object. If the user has not liked the object, the
`current_user_liked` field is not included in the response.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter unsel: (query) Selects the object fields NOT to display. Do not use this parameter with `sel`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in response json.
In order to reduce server API calls from an application, the response json may
include not just the objects that are being queried/searched, but also with
some important data related to the returning objects such as object's owner or
referencing objects.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func checkinsQuery(page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , showUserLike: Bool? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		checkinsQueryRequestBuilder(page: page, perPage: perPage, limit: limit, skip: skip, where_: where_, order: order, sel: sel, showUserLike: showUserLike, unsel: unsel, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Custom Query Checkins
      Performs a custom query of checkins with sorting and pagination. Currently you
can not query or sort data stored inside array or hash in custom fields.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /checkins/query.json
	  - Performs a custom query of checkins with sorting and pagination. Currently you
can not query or sort data stored inside array or hash in custom fields.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  page: (query) Request page number, default is 1.

<p class="note">This parameter is only available to ArrowDB applications created before ArrowDB 1.1.5. 
Applications created with ArrowDB 1.1.5 and later must use <a href="#!/guide/search_query-section-query-pagination">ranged-based queries</a> queries
to paginate their queries.</p>
 (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10.

<p class="note">This parameter is only available to ArrowDB applications created before ArrowDB 1.1.5. 
Applications created with ArrowDB 1.1.5 and later must use <a href="#!/guide/search_query-section-query-pagination">ranged-based queries</a> queries
to paginate their queries.</p>
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
		- parameter  show_user_like: (query) If set to **true**, each Checkin object in the response includes "current_user_liked: true"`
if the current user has liked the object. If the user has not liked the object, the
`current_user_liked` field is not included in the response.
 (optional) 
		- parameter  unsel: (query) Selects the object fields NOT to display. Do not use this parameter with `sel`.
 (optional) 
		- parameter  response_json_depth: (query) Nested object depth level counts in response json.
In order to reduce server API calls from an application, the response json may
include not just the objects that are being queried/searched, but also with
some important data related to the returning objects such as object's owner or
referencing objects.

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

	public class func checkinsQueryRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,showUserLike: Bool? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/checkins/query.json"
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
	  Show a Checkin
      Returns the contents of the identified checkin.
	  - parameter checkinId: (query) ID of the checkin to show. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in response json.
In order to reduce server API calls from an application, the response json may
include not just the objects that are being queried/searched, but also with
some important data related to the returning objects such as object's owner or
referencing objects.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter showUserLike: (query) If set to **true** the Checkin object in the response will include `"current_user_liked: true"`
if the current user has liked the object. If the user has not liked the object, the
`current_user_liked` field is not included in the response.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func checkinsShow(checkinId: String , responseJsonDepth: Int32? = nil , showUserLike: Bool? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		checkinsShowRequestBuilder(checkinId: checkinId, responseJsonDepth: responseJsonDepth, showUserLike: showUserLike, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show a Checkin
      Returns the contents of the identified checkin.
	  - GET /checkins/show.json
	  - Returns the contents of the identified checkin.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  checkin_id: (query) ID of the checkin to show.  
		- parameter  response_json_depth: (query) Nested object depth level counts in response json.
In order to reduce server API calls from an application, the response json may
include not just the objects that are being queried/searched, but also with
some important data related to the returning objects such as object's owner or
referencing objects.
 (optional) 
		- parameter  show_user_like: (query) If set to **true** the Checkin object in the response will include `"current_user_liked: true"`
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

	public class func checkinsShowRequestBuilder(checkinId: String,responseJsonDepth: Int32? = nil,showUserLike: Bool? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/checkins/show.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"checkin_id": checkinId as AnyObject, 
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
      Updates a checkin for the currenty logged in user.

Application admins can update another user's checkin on their behalf by including the
`su_id` field in the request.

	  - parameter checkinId: (formData) ID of the {@link Checkins} to update.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter placeId: (formData) ID of the {@link Places} to check in to.

You can associate a checkin with either a {@link Places} or {@link Events} object but not both.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter eventId: (formData) ID of the {@link Events} to check in to.

You can associate a checkin with either a {@link Places} or {@link Events} object but not both.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter message: (formData) Message to attach to the checkin. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New {@link Photos} object to attach as the primary photo for the checkin.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of an existing {@link Photos} object to attach as the primary photo for the checkin.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma-separated list of tags for this checkin.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this checkin object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this checkin object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) ID of {@link Users} to update the checkin on behalf of.

The current login user must be an application admin to create a checkin on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func checkinsUpdate(checkinId: String , placeId: String? = nil , eventId: String? = nil , message: String? = nil , photo: NSURL? = nil , photoId: String? = nil , prettyJson: Bool? = nil , tags: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		checkinsUpdateRequestBuilder(checkinId: checkinId, placeId: placeId, eventId: eventId, message: message, photo: photo, photoId: photoId, prettyJson: prettyJson, tags: tags, customFields: customFields, aclName: aclName, aclId: aclId, suId: suId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Updates a checkin for the currenty logged in user.

Application admins can update another user's checkin on their behalf by including the
`su_id` field in the request.

	  - PUT /checkins/update.json
	  - Updates a checkin for the currenty logged in user.

Application admins can update another user's checkin on their behalf by including the
`su_id` field in the request.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  checkin_id: (formData) ID of the {@link Checkins} to update.
  
		- parameter  place_id: (formData) ID of the {@link Places} to check in to.

You can associate a checkin with either a {@link Places} or {@link Events} object but not both.
 (optional) 
		- parameter  event_id: (formData) ID of the {@link Events} to check in to.

You can associate a checkin with either a {@link Places} or {@link Events} object but not both.
 (optional) 
		- parameter  message: (formData) Message to attach to the checkin. (optional) 
		- parameter  photo: (formData) New {@link Photos} object to attach as the primary photo for the checkin.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional) 
		- parameter  photo_id: (formData) ID of an existing {@link Photos} object to attach as the primary photo for the checkin.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  tags: (formData) Comma-separated list of tags for this checkin.
 (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this checkin object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this checkin object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) ID of {@link Users} to update the checkin on behalf of.

The current login user must be an application admin to create a checkin on
behalf of another user.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func checkinsUpdateRequestBuilder(checkinId: String,placeId: String? = nil,eventId: String? = nil,message: String? = nil,photo: NSURL? = nil,photoId: String? = nil,prettyJson: Bool? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/checkins/update.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"checkin_id": checkinId as AnyObject , 
		 	"place_id": placeId as AnyObject , 
		 	"event_id": eventId as AnyObject , 
		 	"message": message as AnyObject , 
		 	"photo": photo as AnyObject , 
		 	"photo_id": photoId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject , 
		 	"tags": tags as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"su_id": suId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
