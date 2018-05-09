// /Apis/FriendsAPI.swift
 

import Foundation

public class FriendsAPI: APIBase { 
	/**
	  Add Friends
      Add friends to the current user. By default the friend request is two-way
(like Facebook), so after a friend request is made and approved both users
will show up in each others' friend lists. This default can be changed to one-
way following (like Twitter) in the App Settings for each of your apps.

Two-way or one-way friend requests must be approved by the recipient unless
`approval_required=false` is also sent with the request. This allows the user
to add any user as a friend without requiring approval.

	  - parameter userIds: (formData) Comma-separated list consisting of IDs of one or more users to add as
friends to the current user. A user cannot add himself or herself as a friend.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter approvalRequired: (formData) Indicates whether the friend request requires
approval by the other users.

Default: `true`
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func friendsAdd(userIds: String , approvalRequired: Bool? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		friendsAddRequestBuilder(userIds: userIds, approvalRequired: approvalRequired, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Add Friends
      Add friends to the current user. By default the friend request is two-way
(like Facebook), so after a friend request is made and approved both users
will show up in each others' friend lists. This default can be changed to one-
way following (like Twitter) in the App Settings for each of your apps.

Two-way or one-way friend requests must be approved by the recipient unless
`approval_required=false` is also sent with the request. This allows the user
to add any user as a friend without requiring approval.

	  - POST /friends/add.json
	  - Add friends to the current user. By default the friend request is two-way
(like Facebook), so after a friend request is made and approved both users
will show up in each others' friend lists. This default can be changed to one-
way following (like Twitter) in the App Settings for each of your apps.

Two-way or one-way friend requests must be approved by the recipient unless
`approval_required=false` is also sent with the request. This allows the user
to add any user as a friend without requiring approval.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  user_ids: (formData) Comma-separated list consisting of IDs of one or more users to add as
friends to the current user. A user cannot add himself or herself as a friend.
  
		- parameter  approval_required: (formData) Indicates whether the friend request requires
approval by the other users.

Default: `true`
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func friendsAddRequestBuilder(userIds: String,approvalRequired: Bool? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/friends/add.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"user_ids": userIds as AnyObject , 
		 	"approval_required": approvalRequired as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Approve Friend Requests
      Approve an existing friend request. Each user will be added to the other's
friend list.

	  - parameter userIds: (formData) Comma-separated list consisting of IDs of one or more users to approve as
friends to the current user.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func friendsApprove(userIds: String , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		friendsApproveRequestBuilder(userIds: userIds, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Approve Friend Requests
      Approve an existing friend request. Each user will be added to the other's
friend list.

	  - PUT /friends/approve.json
	  - Approve an existing friend request. Each user will be added to the other's
friend list.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  user_ids: (formData) Comma-separated list consisting of IDs of one or more users to approve as
friends to the current user.
  
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func friendsApproveRequestBuilder(userIds: String,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/friends/approve.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"user_ids": userIds as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Custom Query of Friends
      Performs custom query of Friends objects with sorting and paginating of the current
logged-in user or the specified user.  Only an application admin can perform a query against
a specified user using the `su_id` field.

If one-way friendship is enabled, the query returns the users being followed.  To return
the user's followers, set the `followers` field to true.

You can query or sort based on the data in any of the standard Friend fields.
You can also query and sort data based on the values of any custom fields,
if the values are simple JSON values.

Currently you **cannot** sort or query based on data stored inside array or hash
objects in custom fields.

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - parameter suId: (query) ID of the user to search for friends. If friendship is set to one way, by default it
searches against users that the identified user is following. You can pass
`followers=true` to search the user's followers.
You must be an application admin to use this field.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter followers: (query) If set to true and one-way friendship is enabled, returns the user's followers instead
of the users being followed.
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

	public class func friendsQuery(suId: String? = nil , followers: Bool? = nil , page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		friendsQueryRequestBuilder(suId: suId, followers: followers, page: page, perPage: perPage, limit: limit, skip: skip, where_: where_, order: order, sel: sel, unsel: unsel, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Custom Query of Friends
      Performs custom query of Friends objects with sorting and paginating of the current
logged-in user or the specified user.  Only an application admin can perform a query against
a specified user using the `su_id` field.

If one-way friendship is enabled, the query returns the users being followed.  To return
the user's followers, set the `followers` field to true.

You can query or sort based on the data in any of the standard Friend fields.
You can also query and sort data based on the values of any custom fields,
if the values are simple JSON values.

Currently you **cannot** sort or query based on data stored inside array or hash
objects in custom fields.

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /friends/query.json
	  - Performs custom query of Friends objects with sorting and paginating of the current
logged-in user or the specified user.  Only an application admin can perform a query against
a specified user using the `su_id` field.

If one-way friendship is enabled, the query returns the users being followed.  To return
the user's followers, set the `followers` field to true.

You can query or sort based on the data in any of the standard Friend fields.
You can also query and sort data based on the values of any custom fields,
if the values are simple JSON values.

Currently you **cannot** sort or query based on data stored inside array or hash
objects in custom fields.

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  su_id: (query) ID of the user to search for friends. If friendship is set to one way, by default it
searches against users that the identified user is following. You can pass
`followers=true` to search the user's followers.
You must be an application admin to use this field.
 (optional) 
		- parameter  followers: (query) If set to true and one-way friendship is enabled, returns the user's followers instead
of the users being followed.
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

	public class func friendsQueryRequestBuilder(suId: String? = nil,followers: Bool? = nil,page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/friends/query.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"su_id": suId as AnyObject, 
			"followers": followers as AnyObject, 
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"limit": limit as AnyObject, 
			"skip": skip as AnyObject, 
			"where": where_ as AnyObject, 
			"order": order as AnyObject, 
			"sel": sel as AnyObject, 
			"unsel": unsel as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Remove Friends
      Removes one or more friends from the user's friends list.

	  - parameter userIds: (formData) Comma-separated list consisting of IDs of one or more users to remove from the current user.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func friendsRemove(userIds: String , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		friendsRemoveRequestBuilder(userIds: userIds, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Remove Friends
      Removes one or more friends from the user's friends list.

	  - DELETE /friends/remove.json
	  - Removes one or more friends from the user's friends list.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  user_ids: (formData) Comma-separated list consisting of IDs of one or more users to remove from the current user.
  
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func friendsRemoveRequestBuilder(userIds: String,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/friends/remove.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"user_ids": userIds as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Show Friend Requests
      View pending friend requests.

	  - parameter requestsTo: (query) If set to true, returns the users requesting the current user as a friend
rather than the pending friend requests that the user needs to approve.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being referred to, but also
some important data related to the returned objects such as object's owner or
referenced objects.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func friendsRequests(requestsTo: Bool? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		friendsRequestsRequestBuilder(requestsTo: requestsTo, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show Friend Requests
      View pending friend requests.

	  - GET /friends/requests.json
	  - View pending friend requests.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  requests_to: (query) If set to true, returns the users requesting the current user as a friend
rather than the pending friend requests that the user needs to approve.
 (optional) 
		- parameter  response_json_depth: (query) Nested object depth level counts in response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being referred to, but also
some important data related to the returned objects such as object's owner or
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

	public class func friendsRequestsRequestBuilder(requestsTo: Bool? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/friends/requests.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"requests_to": requestsTo as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Search Friends
      Performs a search for users who are friends of the currently logged-in user. An application admin
can search for friends of an arbitrary user by specifing the the `user_id` field.

Specifying the optional `q` parameter allows searching by first name, last name, email address,
or username. If no `q` parameter is specified, all friends of the specified user are returned.

If one-way friendship is enabled, the search returns the users being followed. To return
the user's followers, set the `followers` field to true.

	  - parameter userId: (query) ID of the user to search for friends. **You must be an application admin to use this field.**

If friendship is set to one way,
by default it searches against users that the identified user is **following**. You can
pass `followers=true` to search the user's followers.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter followers: (query) If you have friends set to one way, pass `followers=true` to query user's
followers.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter q: (query) Space-separated list of keywords used to perform full text search on first name, last name,
email address, username and tags.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
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

	public class func friendsSearch(userId: String? = nil , followers: Bool? = nil , q: String? = nil , page: Int32? = nil , perPage: Int32? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		friendsSearchRequestBuilder(userId: userId, followers: followers, q: q, page: page, perPage: perPage, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Search Friends
      Performs a search for users who are friends of the currently logged-in user. An application admin
can search for friends of an arbitrary user by specifing the the `user_id` field.

Specifying the optional `q` parameter allows searching by first name, last name, email address,
or username. If no `q` parameter is specified, all friends of the specified user are returned.

If one-way friendship is enabled, the search returns the users being followed. To return
the user's followers, set the `followers` field to true.

	  - GET /friends/search.json
	  - Performs a search for users who are friends of the currently logged-in user. An application admin
can search for friends of an arbitrary user by specifing the the `user_id` field.

Specifying the optional `q` parameter allows searching by first name, last name, email address,
or username. If no `q` parameter is specified, all friends of the specified user are returned.

If one-way friendship is enabled, the search returns the users being followed. To return
the user's followers, set the `followers` field to true.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  user_id: (query) ID of the user to search for friends. **You must be an application admin to use this field.**

If friendship is set to one way,
by default it searches against users that the identified user is **following**. You can
pass `followers=true` to search the user's followers.
 (optional) 
		- parameter  followers: (query) If you have friends set to one way, pass `followers=true` to query user's
followers.
 (optional) 
		- parameter  q: (query) Space-separated list of keywords used to perform full text search on first name, last name,
email address, username and tags.
 (optional) 
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
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

	public class func friendsSearchRequestBuilder(userId: String? = nil,followers: Bool? = nil,q: String? = nil,page: Int32? = nil,perPage: Int32? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/friends/search.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"user_id": userId as AnyObject, 
			"followers": followers as AnyObject, 
			"q": q as AnyObject, 
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
