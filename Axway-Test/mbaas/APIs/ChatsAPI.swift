// /Apis/ChatsAPI.swift
 

import Foundation

public class ChatsAPI: APIBase { 
	/**
	  List Chat Groups
      Lists chat groups.

If user A sends chat message to user B and C, users A, B and C automatically
form a chat group. Use this API to get a list of chat groups the current user
belongs to.

	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter where_: (query) Constraint values for fields. `where` should be encoded JSON.

If `where` is not specified, `query` returns all objects.
See the [Search and Query guide](#!/guide/search_query) for more information.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter order: (query) Sort results by one or more fields.
See the [Search and Query guide](#!/guide/search_query) for more information.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in JSON response.
To reduce server API calls the JSON response may
include, in addition to the objects returned by the query, other important data related 
to the returned objects, such as object's owner or referencing objects.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func chatsGetChatGroups(page: Int32? = nil , perPage: Int32? = nil , where_: String? = nil , order: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		chatsGetChatGroupsRequestBuilder(page: page, perPage: perPage, where_: where_, order: order, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  List Chat Groups
      Lists chat groups.

If user A sends chat message to user B and C, users A, B and C automatically
form a chat group. Use this API to get a list of chat groups the current user
belongs to.

	  - GET /chats/get_chat_groups.json
	  - Lists chat groups.

If user A sends chat message to user B and C, users A, B and C automatically
form a chat group. Use this API to get a list of chat groups the current user
belongs to.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
		- parameter  where: (query) Constraint values for fields. `where` should be encoded JSON.

If `where` is not specified, `query` returns all objects.
See the [Search and Query guide](#!/guide/search_query) for more information.
 (optional) 
		- parameter  order: (query) Sort results by one or more fields.
See the [Search and Query guide](#!/guide/search_query) for more information.
 (optional) 
		- parameter  response_json_depth: (query) Nested object depth level counts in JSON response.
To reduce server API calls the JSON response may
include, in addition to the objects returned by the query, other important data related 
to the returned objects, such as object's owner or referencing objects.

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

	public class func chatsGetChatGroupsRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,where_: String? = nil,order: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/chats/get_chat_groups.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"where": where_ as AnyObject, 
			"order": order as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Retrieves the total number of Chat objects.
      Retrieves the total number of Chat objects.
	*/

	public class func chatsCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		chatsCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of Chat objects.
      Retrieves the total number of Chat objects.
	  - GET /chats/count.json
	  - Retrieves the total number of Chat objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func chatsCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/chats/count.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Create a Chat Message
      Sends a chat message to another user or a group of users.

Sending a message creates a new chat group if there is no existing chat group
containing the current user and the designated recipients.

To generate a push notification, include the `channel` and
`payload` parameters.

	  - parameter toIds: (formData) Comma-separated list of user ID(s) to receive the message. The current user ID and `to_ids`
together determine which chat group a message belongs to. The chat group is
created if necessary.

You must specify either a `to_ids` list or the `chat_group_id` for an existing
chat group.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter chatGroupId: (formData) Identifies an existing chat group by ID. If you already know the id
of a {@link Chats#property-chatgroup chat group}, you can use it to specify
which chat group this message should go to.

You must specify either a `to_ids` list or the `chat_group_id` for an existing
chat group.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter message: (formData) Message to send. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New photo to attach to the chat message.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of an existing photo to attach to the chat message.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter channel: (formData) Channel for a push notification.

To send a push notification to the recipients after a new chat
message is created, you can pass in the `channel` and `payload` parameters.
For more information, see {@link PushNotifications#notify}.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter payload: (formData) Message payload for push notification.


The message defined in `payload` will be delivered to all the recipients as long
as they have {@link PushNotifications#subscribe subscribed} to the specified channel.

For example, if all of your app's users are subscribed to channel "Chat", then
you can pass channel -- "Chat", and payload:

    {
        "from": "sender user_id",
        "message": "Hello everyone!",
        "sound": "default",
         "alert" : "From Joe: Hello everyone!"
    }
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) Send on behalf of the identified user.

Current user must be an application admin to send a message on behalf of
another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (formData) To receive a list of participant IDs, set `response_json_depth` to **2**.
If you have already cached all the user objects participating
in the chat group and wish to receive a smaller JSON response, you can set
`response_json_depth` to **1** to remove participant user's info from chat group in
the JSON response.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func chatsCreate(toIds: String? = nil , chatGroupId: String? = nil , message: String , photo: NSURL? = nil , photoId: String? = nil , customFields: String? = nil , channel: String? = nil , payload: String? = nil , suId: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		chatsCreateRequestBuilder(toIds: toIds, chatGroupId: chatGroupId, message: message, photo: photo, photoId: photoId, customFields: customFields, channel: channel, payload: payload, suId: suId, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Create a Chat Message
      Sends a chat message to another user or a group of users.

Sending a message creates a new chat group if there is no existing chat group
containing the current user and the designated recipients.

To generate a push notification, include the `channel` and
`payload` parameters.

	  - POST /chats/create.json
	  - Sends a chat message to another user or a group of users.

Sending a message creates a new chat group if there is no existing chat group
containing the current user and the designated recipients.

To generate a push notification, include the `channel` and
`payload` parameters.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  to_ids: (formData) Comma-separated list of user ID(s) to receive the message. The current user ID and `to_ids`
together determine which chat group a message belongs to. The chat group is
created if necessary.

You must specify either a `to_ids` list or the `chat_group_id` for an existing
chat group.
 (optional) 
		- parameter  chat_group_id: (formData) Identifies an existing chat group by ID. If you already know the id
of a {@link Chats#property-chatgroup chat group}, you can use it to specify
which chat group this message should go to.

You must specify either a `to_ids` list or the `chat_group_id` for an existing
chat group.
 (optional) 
		- parameter  message: (formData) Message to send.  
		- parameter  photo: (formData) New photo to attach to the chat message.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional) 
		- parameter  photo_id: (formData) ID of an existing photo to attach to the chat message.
 (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  channel: (formData) Channel for a push notification.

To send a push notification to the recipients after a new chat
message is created, you can pass in the `channel` and `payload` parameters.
For more information, see {@link PushNotifications#notify}.
 (optional) 
		- parameter  payload: (formData) Message payload for push notification.


The message defined in `payload` will be delivered to all the recipients as long
as they have {@link PushNotifications#subscribe subscribed} to the specified channel.

For example, if all of your app's users are subscribed to channel "Chat", then
you can pass channel -- "Chat", and payload:

    {
        "from": "sender user_id",
        "message": "Hello everyone!",
        "sound": "default",
         "alert" : "From Joe: Hello everyone!"
    }
 (optional) 
		- parameter  su_id: (formData) Send on behalf of the identified user.

Current user must be an application admin to send a message on behalf of
another user.
 (optional) 
		- parameter  response_json_depth: (formData) To receive a list of participant IDs, set `response_json_depth` to **2**.
If you have already cached all the user objects participating
in the chat group and wish to receive a smaller JSON response, you can set
`response_json_depth` to **1** to remove participant user's info from chat group in
the JSON response.

Default is 1, valid range is 1 to 8.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func chatsCreateRequestBuilder(toIds: String? = nil,chatGroupId: String? = nil,message: String,photo: NSURL? = nil,photoId: String? = nil,customFields: String? = nil,channel: String? = nil,payload: String? = nil,suId: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/chats/create.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"to_ids": toIds as AnyObject , 
		 	"chat_group_id": chatGroupId as AnyObject , 
		 	"message": message as AnyObject , 
		 	"photo": photo as AnyObject , 
		 	"photo_id": photoId as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"channel": channel as AnyObject , 
		 	"payload": payload as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"response_json_depth": responseJsonDepth as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Delete a Chat.
      Deletes a chat message.

	  - parameter chatId: (formData) ID of the chat message to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User to delete the Chat object on behalf of. The user must be the sender of the chat
message.

Current user must be an application admin to send a message on behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func chatsDelete(chatId: String , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		chatsDeleteRequestBuilder(chatId: chatId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete a Chat.
      Deletes a chat message.

	  - DELETE /chats/delete.json
	  - Deletes a chat message.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  chat_id: (formData) ID of the chat message to delete.  
		- parameter  su_id: (formData) User to delete the Chat object on behalf of. The user must be the sender of the chat
message.

Current user must be an application admin to send a message on behalf of another user.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func chatsDeleteRequestBuilder(chatId: String,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/chats/delete.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"chat_id": chatId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Custom Query Chat Messages
      Performs a custom query of chat messages with sorting and pagination. Currently you can
not query or sort data stored inside array or hash in custom fields.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).        

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - parameter participateIds: (query) Comma-separated list of user ID(s) of the users belonging to a chat group. You can use
this field to narrow down a query to a certain chat group. The current user can
only query chat messages in chat groups he or she is participating in.

For example, suppose that users A, B and C form one chat group, and users B and C form a second chat group without A.
User A does not have permission to query chats in the chat group that consists of
only users B and C.

You must specify either a `participate_ids` list or the `chat_group_id` of an existing
chat group to query.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter chatGroupId: (query) A chat group's id. Instead of using a `participate_ids` list, if you already
know the id of a chat group, you can use it to narrow down a query.

You must specify either a `participate_ids` list or the `chat_group_id` of an existing
chat group to query.
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
	  - parameter where_: (query) Constraint values for fields. `where` should be encoded JSON.

You can query any of the standard values for a Chat object, as well as any
custom fields that contain simple values, such as String, Number or Boolean
values.

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
	*/

	public class func chatsQuery(participateIds: String? = nil , chatGroupId: String? = nil , page: Int32? = nil , perPage: Int32? = nil , prettyJson: Bool? = nil , limit: Int32? = nil , skip: Int32? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		chatsQueryRequestBuilder(participateIds: participateIds, chatGroupId: chatGroupId, page: page, perPage: perPage, prettyJson: prettyJson, limit: limit, skip: skip, where_: where_, order: order, sel: sel, unsel: unsel, responseJsonDepth: responseJsonDepth).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Custom Query Chat Messages
      Performs a custom query of chat messages with sorting and pagination. Currently you can
not query or sort data stored inside array or hash in custom fields.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).        

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /chats/query.json
	  - Performs a custom query of chat messages with sorting and pagination. Currently you can
not query or sort data stored inside array or hash in custom fields.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).        

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  participate_ids: (query) Comma-separated list of user ID(s) of the users belonging to a chat group. You can use
this field to narrow down a query to a certain chat group. The current user can
only query chat messages in chat groups he or she is participating in.

For example, suppose that users A, B and C form one chat group, and users B and C form a second chat group without A.
User A does not have permission to query chats in the chat group that consists of
only users B and C.

You must specify either a `participate_ids` list or the `chat_group_id` of an existing
chat group to query.
 (optional) 
		- parameter  chat_group_id: (query) A chat group's id. Instead of using a `participate_ids` list, if you already
know the id of a chat group, you can use it to narrow down a query.

You must specify either a `participate_ids` list or the `chat_group_id` of an existing
chat group to query.
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
		- parameter  where: (query) Constraint values for fields. `where` should be encoded JSON.

You can query any of the standard values for a Chat object, as well as any
custom fields that contain simple values, such as String, Number or Boolean
values.

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
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func chatsQueryRequestBuilder(participateIds: String? = nil,chatGroupId: String? = nil,page: Int32? = nil,perPage: Int32? = nil,prettyJson: Bool? = nil,limit: Int32? = nil,skip: Int32? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/chats/query.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"participate_ids": participateIds as AnyObject, 
			"chat_group_id": chatGroupId as AnyObject, 
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"pretty_json": prettyJson as AnyObject, 
			"limit": limit as AnyObject, 
			"skip": skip as AnyObject, 
			"where": where_ as AnyObject, 
			"order": order as AnyObject, 
			"sel": sel as AnyObject, 
			"unsel": unsel as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
