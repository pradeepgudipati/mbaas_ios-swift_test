// /Apis/ACLsAPI.swift
 

import Foundation

public class ACLsAPI: APIBase { 
	/**
	  Add user(s) to an ACL.
      Adds one or more user(s) to an existing ACL object, identified by its `id` or `name`.

	  - parameter name: (formData) Name of the ACL object.

Either `name` or `id` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter iD: (formData) ID of the ACL oject.

Either `name` or `id` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter readerIds: (formData) Comma separated list of IDs identifying users who can read objects
controlled by this ACL.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter writerIds: (formData) Comma separated list of IDs identifying users who can update an object.
controlled by this ACL.
 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func aCLsAdd(name: String? = nil , iD: String? = nil , prettyJson: Bool? = nil , readerIds: String , writerIds: String ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		aCLsAddRequestBuilder(name: name, iD: iD, prettyJson: prettyJson, readerIds: readerIds, writerIds: writerIds).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Add user(s) to an ACL.
      Adds one or more user(s) to an existing ACL object, identified by its `id` or `name`.

	  - POST /acls/add.json
	  - Adds one or more user(s) to an existing ACL object, identified by its `id` or `name`.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) Name of the ACL object.

Either `name` or `id` must be specified.
 (optional) 
		- parameter  id: (formData) ID of the ACL oject.

Either `name` or `id` must be specified.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  reader_ids: (formData) Comma separated list of IDs identifying users who can read objects
controlled by this ACL.
  
		- parameter  writer_ids: (formData) Comma separated list of IDs identifying users who can update an object.
controlled by this ACL.
  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func aCLsAddRequestBuilder(name: String? = nil,iD: String? = nil,prettyJson: Bool? = nil,readerIds: String,writerIds: String) -> RequestBuilder<[String:Any]> { 
		let path = "/acls/add.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"name": name as AnyObject , 
		 	"id": iD as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject , 
		 	"reader_ids": readerIds as AnyObject , 
		 	"writer_ids": writerIds as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Checks a user's permission in an ACL.
      Checks the permissions a specified user is granted by a specified ACL.
In the response, "read_permission": "yes" means the user has read permission; if
this property is omitted or the value is not "yes", the user does not have read
permission.

Similarly, "write_permission": "yes" means the user has write permission. If the
property is omitted or the value is not "yes", the user does not have write
permission.

	  - parameter name: (query) Name of the ACL object.

Either `name` or `id` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter iD: (query) ID of the ACL oject.

Either `name` or `id` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter userId: (query) User ID of the user to check. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func aCLsCheck(name: String? = nil , iD: String? = nil , prettyJson: Bool? = nil , userId: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		aCLsCheckRequestBuilder(name: name, iD: iD, prettyJson: prettyJson, userId: userId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Checks a user's permission in an ACL.
      Checks the permissions a specified user is granted by a specified ACL.
In the response, "read_permission": "yes" means the user has read permission; if
this property is omitted or the value is not "yes", the user does not have read
permission.

Similarly, "write_permission": "yes" means the user has write permission. If the
property is omitted or the value is not "yes", the user does not have write
permission.

	  - GET /acls/check.json
	  - Checks the permissions a specified user is granted by a specified ACL.
In the response, "read_permission": "yes" means the user has read permission; if
this property is omitted or the value is not "yes", the user does not have read
permission.

Similarly, "write_permission": "yes" means the user has write permission. If the
property is omitted or the value is not "yes", the user does not have write
permission.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (query) Name of the ACL object.

Either `name` or `id` must be specified.
 (optional) 
		- parameter  id: (query) ID of the ACL oject.

Either `name` or `id` must be specified.
 (optional) 
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  user_id: (query) User ID of the user to check. (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func aCLsCheckRequestBuilder(name: String? = nil,iD: String? = nil,prettyJson: Bool? = nil,userId: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/acls/check.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"name": name as AnyObject, 
			"id": iD as AnyObject, 
			"pretty_json": prettyJson as AnyObject, 
			"user_id": userId as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Retrieves the total number of ACL objects.
      Retrieves the total number of ACL objects.
	*/

	public class func aCLsCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		aCLsCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of ACL objects.
      Retrieves the total number of ACL objects.
	  - GET /acls/count.json
	  - Retrieves the total number of ACL objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func aCLsCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/acls/count.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Create an access control list
      Creates an ACL object, which can be used to control access to ArrowDB objects.

	  - parameter name: (formData) Name of the ACL object.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter readerIds: (formData) Comma separated list of IDs identifying users who can read objects
controlled by this ACL.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter writerIds: (formData) Comma separated list of IDs identifying users who can update an object.
controlled by this ACL.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter publicRead: (formData) Determines whether objects controlled by this ArrowDB are publically readable.

Default is false.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter publicWrite: (formData) Determines whether objects controlled by this ArrowDB are publically writable.

Default is false.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) Specifies the owner of the new URL.

Only allowed if the current login user is an application admin. Otherwise, the
new ACL is always owned by the current login user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func aCLsCreate(name: String , readerIds: String? = nil , writerIds: String? = nil , prettyJson: Bool? = nil , publicRead: String? = nil , publicWrite: String? = nil , suId: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		aCLsCreateRequestBuilder(name: name, readerIds: readerIds, writerIds: writerIds, prettyJson: prettyJson, publicRead: publicRead, publicWrite: publicWrite, suId: suId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Create an access control list
      Creates an ACL object, which can be used to control access to ArrowDB objects.

	  - POST /acls/create.json
	  - Creates an ACL object, which can be used to control access to ArrowDB objects.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) Name of the ACL object.
  
		- parameter  reader_ids: (formData) Comma separated list of IDs identifying users who can read objects
controlled by this ACL.
 (optional) 
		- parameter  writer_ids: (formData) Comma separated list of IDs identifying users who can update an object.
controlled by this ACL.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  public_read: (formData) Determines whether objects controlled by this ArrowDB are publically readable.

Default is false.
 (optional) 
		- parameter  public_write: (formData) Determines whether objects controlled by this ArrowDB are publically writable.

Default is false.
 (optional) 
		- parameter  su_id: (formData) Specifies the owner of the new URL.

Only allowed if the current login user is an application admin. Otherwise, the
new ACL is always owned by the current login user.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func aCLsCreateRequestBuilder(name: String,readerIds: String? = nil,writerIds: String? = nil,prettyJson: Bool? = nil,publicRead: String? = nil,publicWrite: String? = nil,suId: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/acls/create.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"name": name as AnyObject , 
		 	"reader_ids": readerIds as AnyObject , 
		 	"writer_ids": writerIds as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject , 
		 	"public_read": publicRead as AnyObject , 
		 	"public_write": publicWrite as AnyObject , 
		 	"su_id": suId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Delete an ACL
      Deletes an ACL object with the given `id` or `name`.

An application admin can delete any ACL object.

	  - parameter iD: (formData) ID of the ACL oject to delete.

Either `name` or `id` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter name: (formData) Name of the ACL object to delete.

Either `name` or `id` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User to delete the ACL object on behalf of. The user must be the creator of the object.

The current user must be an application admin to remove an ACL on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func aCLsDelete(iD: String? = nil , name: String? = nil , prettyJson: Bool? = nil , suId: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		aCLsDeleteRequestBuilder(iD: iD, name: name, prettyJson: prettyJson, suId: suId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete an ACL
      Deletes an ACL object with the given `id` or `name`.

An application admin can delete any ACL object.

	  - DELETE /acls/delete.json
	  - Deletes an ACL object with the given `id` or `name`.

An application admin can delete any ACL object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  id: (formData) ID of the ACL oject to delete.

Either `name` or `id` must be specified.
 (optional) 
		- parameter  name: (formData) Name of the ACL object to delete.

Either `name` or `id` must be specified.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  su_id: (formData) User to delete the ACL object on behalf of. The user must be the creator of the object.

The current user must be an application admin to remove an ACL on
behalf of another user.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func aCLsDeleteRequestBuilder(iD: String? = nil,name: String? = nil,prettyJson: Bool? = nil,suId: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/acls/delete.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"id": iD as AnyObject , 
		 	"name": name as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject , 
		 	"su_id": suId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Performs a custom query of ACLs.
      Performs a custom query of ACLs. Regular application users can only query ACLs that they have created. 
Application admins can query ACLs for an arbitrary user by specifying the `user_id` method parameter.
(In applications created with ArrowDB 1.1.7 and earlier, any user can query another user's 
ACLs, regardless of whether they are an admin or not.)

<p class="note">The <code>name</code> field is not queryable.</p>

* Applications created with ArrowDB 1.1.5 and later can paginate query results using `skip` 
and `limit` parameters. For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).
* Currently you can not query or sort data stored inside an array or hash in custom fields.

For general information on queries, see [Search and Query guide](#!/guide/search_query).

	  - parameter count: (query) Used for paginating queries. If set to `true`, the response's `meta` object contains a 
`count` field that indicates the number of objects that matched the query constraints.
 (optional)
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
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
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
	  - parameter order: (query) Sort results by one or more fields.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter sel: (query) Selects the object fields to display. Do not use this parameter with `unsel`.
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
	  - parameter userId: (query) ID of the user whose ACLs should be returned. You must be an application admin to use this 
parameter.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func aCLsQuery(count: Bool? = nil , page: Int32? = nil , perPage: Int32? = nil , prettyJson: Bool? = nil , limit: Int32? = nil , skip: Int32? = nil , order: String? = nil , sel: String? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil , userId: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		aCLsQueryRequestBuilder(count: count, page: page, perPage: perPage, prettyJson: prettyJson, limit: limit, skip: skip, order: order, sel: sel, unsel: unsel, responseJsonDepth: responseJsonDepth, userId: userId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Performs a custom query of ACLs.
      Performs a custom query of ACLs. Regular application users can only query ACLs that they have created. 
Application admins can query ACLs for an arbitrary user by specifying the `user_id` method parameter.
(In applications created with ArrowDB 1.1.7 and earlier, any user can query another user's 
ACLs, regardless of whether they are an admin or not.)

<p class="note">The <code>name</code> field is not queryable.</p>

* Applications created with ArrowDB 1.1.5 and later can paginate query results using `skip` 
and `limit` parameters. For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).
* Currently you can not query or sort data stored inside an array or hash in custom fields.

For general information on queries, see [Search and Query guide](#!/guide/search_query).

	  - GET /acls/query.json
	  - Performs a custom query of ACLs. Regular application users can only query ACLs that they have created. 
Application admins can query ACLs for an arbitrary user by specifying the `user_id` method parameter.
(In applications created with ArrowDB 1.1.7 and earlier, any user can query another user's 
ACLs, regardless of whether they are an admin or not.)

<p class="note">The <code>name</code> field is not queryable.</p>

* Applications created with ArrowDB 1.1.5 and later can paginate query results using `skip` 
and `limit` parameters. For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).
* Currently you can not query or sort data stored inside an array or hash in custom fields.

For general information on queries, see [Search and Query guide](#!/guide/search_query).

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  count: (query) Used for paginating queries. If set to `true`, the response's `meta` object contains a 
`count` field that indicates the number of objects that matched the query constraints.
 (optional) 
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
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  limit: (query) The number of records to fetch. The value must be greater than 0, and no greater than 
1000, or an HTTP 400 (Bad Request) error will be returned. Default value of `limit` is 10.
 (optional) 
		- parameter  skip: (query) The number of records to skip. The value must be greater than or equal to 0, and no greater 
than 4999, or an HTTP 400 error will be returned. To skip 5000 records or more 
you need to perform a range-based query. See 
<a href="#!/guide/search_query-section-query-pagination">Query Pagination</a> for more information.</p>
 (optional) 
		- parameter  order: (query) Sort results by one or more fields.
 (optional) 
		- parameter  sel: (query) Selects the object fields to display. Do not use this parameter with `unsel`.
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
		- parameter  user_id: (query) ID of the user whose ACLs should be returned. You must be an application admin to use this 
parameter.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func aCLsQueryRequestBuilder(count: Bool? = nil,page: Int32? = nil,perPage: Int32? = nil,prettyJson: Bool? = nil,limit: Int32? = nil,skip: Int32? = nil,order: String? = nil,sel: String? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil,userId: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/acls/query.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"count": count as AnyObject, 
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"pretty_json": prettyJson as AnyObject, 
			"limit": limit as AnyObject, 
			"skip": skip as AnyObject, 
			"order": order as AnyObject, 
			"sel": sel as AnyObject, 
			"unsel": unsel as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"user_id": userId as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Remove user(s) from an ACL
      Removes one or more user(s) from an ACL object with the given `id` or `name`.

You can remove users from the `readers` list, which grants read permission, the
`writers` list, which grants update/delete permission, or both.

	  - parameter name: (formData) Name of the ACL object.

Either `name` or `id` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter iD: (formData) ID of the ACL oject.

Either `name` or `id` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter readerIds: (formData) Comma separated list of IDs to remove from the `readers` list.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter writerIds: (formData) Comma separated list of IDs to remove from the `writers` list.
 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func aCLsRemove(name: String? = nil , iD: String? = nil , prettyJson: Bool? = nil , readerIds: String , writerIds: String ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		aCLsRemoveRequestBuilder(name: name, iD: iD, prettyJson: prettyJson, readerIds: readerIds, writerIds: writerIds).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Remove user(s) from an ACL
      Removes one or more user(s) from an ACL object with the given `id` or `name`.

You can remove users from the `readers` list, which grants read permission, the
`writers` list, which grants update/delete permission, or both.

	  - DELETE /acls/remove.json
	  - Removes one or more user(s) from an ACL object with the given `id` or `name`.

You can remove users from the `readers` list, which grants read permission, the
`writers` list, which grants update/delete permission, or both.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) Name of the ACL object.

Either `name` or `id` must be specified.
 (optional) 
		- parameter  id: (formData) ID of the ACL oject.

Either `name` or `id` must be specified.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  reader_ids: (formData) Comma separated list of IDs to remove from the `readers` list.
  
		- parameter  writer_ids: (formData) Comma separated list of IDs to remove from the `writers` list.
  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func aCLsRemoveRequestBuilder(name: String? = nil,iD: String? = nil,prettyJson: Bool? = nil,readerIds: String,writerIds: String) -> RequestBuilder<[String:Any]> { 
		let path = "/acls/remove.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"name": name as AnyObject , 
		 	"id": iD as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject , 
		 	"reader_ids": readerIds as AnyObject , 
		 	"writer_ids": writerIds as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Show an ACL
      Shows the ACL object with the given `id` or `name`.

	  - parameter iD: (query) ID of the ACL oject.

Either `name` or `id` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter name: (query) Name of the ACL object.

Either `name` or `id` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func aCLsShow(iD: String? = nil , name: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		aCLsShowRequestBuilder(iD: iD, name: name, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show an ACL
      Shows the ACL object with the given `id` or `name`.

	  - GET /acls/show.json
	  - Shows the ACL object with the given `id` or `name`.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  id: (query) ID of the ACL oject.

Either `name` or `id` must be specified.
 (optional) 
		- parameter  name: (query) Name of the ACL object.

Either `name` or `id` must be specified.
 (optional) 
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func aCLsShowRequestBuilder(iD: String? = nil,name: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/acls/show.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"id": iD as AnyObject, 
			"name": name as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Update an ACL
      Updates an ACL object to change its access control list. When updating an ACL,
you can change the members of the `readers` list and the `writers` list, or change the value
of the `public_read` and `public_write` flags.

An application admin can update any ACL object.

	  - parameter iD: (formData) ID of the ACL oject.

Either `name` or `id` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter name: (formData) Name of the ACL object.

Either `name` or `id` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter readerIds: (formData) Comma separated list of IDs identifying users who can read objects
controlled by this ACL.

To remove all users from the `readers` list, simply set `reader_ids=""`.
This removes all users except for the owner from the list.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter writerIds: (formData) Comma separated list of IDs identifying users who can update an object.
controlled by this ACL.

To remove all users from the `writers` list, simply set `writer_ids=""`.
This removes all users except for the owner from the list.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter publicRead: (formData) Determines whether objects controlled by this ArrowDB are publically readable.

Default is false.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter publicWrite: (formData) Determines whether objects controlled by this ArrowDB are publically writable.

Default is false.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User to update the ACL object on behalf of. The user must be the creator of the object.

The current user must be an application admin to update an ACL object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func aCLsUpdate(iD: String? = nil , name: String? = nil , prettyJson: Bool? = nil , readerIds: String , writerIds: String , publicRead: String? = nil , publicWrite: String? = nil , suId: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		aCLsUpdateRequestBuilder(iD: iD, name: name, prettyJson: prettyJson, readerIds: readerIds, writerIds: writerIds, publicRead: publicRead, publicWrite: publicWrite, suId: suId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Update an ACL
      Updates an ACL object to change its access control list. When updating an ACL,
you can change the members of the `readers` list and the `writers` list, or change the value
of the `public_read` and `public_write` flags.

An application admin can update any ACL object.

	  - PUT /acls/update.json
	  - Updates an ACL object to change its access control list. When updating an ACL,
you can change the members of the `readers` list and the `writers` list, or change the value
of the `public_read` and `public_write` flags.

An application admin can update any ACL object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  id: (formData) ID of the ACL oject.

Either `name` or `id` must be specified.
 (optional) 
		- parameter  name: (formData) Name of the ACL object.

Either `name` or `id` must be specified.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  reader_ids: (formData) Comma separated list of IDs identifying users who can read objects
controlled by this ACL.

To remove all users from the `readers` list, simply set `reader_ids=""`.
This removes all users except for the owner from the list.
  
		- parameter  writer_ids: (formData) Comma separated list of IDs identifying users who can update an object.
controlled by this ACL.

To remove all users from the `writers` list, simply set `writer_ids=""`.
This removes all users except for the owner from the list.
  
		- parameter  public_read: (formData) Determines whether objects controlled by this ArrowDB are publically readable.

Default is false.
 (optional) 
		- parameter  public_write: (formData) Determines whether objects controlled by this ArrowDB are publically writable.

Default is false.
 (optional) 
		- parameter  su_id: (formData) User to update the ACL object on behalf of. The user must be the creator of the object.

The current user must be an application admin to update an ACL object on
behalf of another user.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func aCLsUpdateRequestBuilder(iD: String? = nil,name: String? = nil,prettyJson: Bool? = nil,readerIds: String,writerIds: String,publicRead: String? = nil,publicWrite: String? = nil,suId: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/acls/update.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"id": iD as AnyObject , 
		 	"name": name as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject , 
		 	"reader_ids": readerIds as AnyObject , 
		 	"writer_ids": writerIds as AnyObject , 
		 	"public_read": publicRead as AnyObject , 
		 	"public_write": publicWrite as AnyObject , 
		 	"su_id": suId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
