// /Apis/MessagesAPI.swift
 

import Foundation

public class MessagesAPI: APIBase { 
	/**
	  Retrieves the total number of Message objects.
      Retrieves the total number of Message objects.
	*/

	public class func messagesCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		messagesCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of Message objects.
      Retrieves the total number of Message objects.
	  - GET /messages/count.json
	  - Retrieves the total number of Message objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func messagesCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/messages/count.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
      Sends a message with an optional subject to one or more specified users. The `thread_id` of
the first outgoing message is its own id. Replies to the first or subsequent messages in
the thread will all use the id of the first message as their `thread_id`. The output of this
API method is the copy of the message saved to the sender's sent mail.

	  - parameter toIds: (formData) Comma-separated list of one or more IDs of {@link Users} to send the message to. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter body: (formData) The body of the message. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter subject: (formData) Message subject. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User-defined data. See [Custom Objects and Custom Fields](/#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) ID of the {@link Users} to send message on behalf of.

The current login user must be the application admin, in order to send a
message on behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func messagesCreate(toIds: String , body: String , subject: String? = nil , customFields: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		messagesCreateRequestBuilder(toIds: toIds, body: body, subject: subject, customFields: customFields, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Sends a message with an optional subject to one or more specified users. The `thread_id` of
the first outgoing message is its own id. Replies to the first or subsequent messages in
the thread will all use the id of the first message as their `thread_id`. The output of this
API method is the copy of the message saved to the sender's sent mail.

	  - POST /messages/create.json
	  - Sends a message with an optional subject to one or more specified users. The `thread_id` of
the first outgoing message is its own id. Replies to the first or subsequent messages in
the thread will all use the id of the first message as their `thread_id`. The output of this
API method is the copy of the message saved to the sender's sent mail.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  to_ids: (formData) Comma-separated list of one or more IDs of {@link Users} to send the message to.  
		- parameter  body: (formData) The body of the message.  
		- parameter  subject: (formData) Message subject. (optional) 
		- parameter  custom_fields: (formData) User-defined data. See [Custom Objects and Custom Fields](/#!/guide/customfields). (optional) 
		- parameter  su_id: (formData) ID of the {@link Users} to send message on behalf of.

The current login user must be the application admin, in order to send a
message on behalf of another user.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func messagesCreateRequestBuilder(toIds: String,body: String,subject: String? = nil,customFields: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/messages/create.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"to_ids": toIds as AnyObject , 
		 	"body": body as AnyObject , 
		 	"subject": subject as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
      Delete the message with the given `id`. The message must be in the current
user's inbox or sent mail. There is currently no trash folder and deletion is
permanent.

Application Admin can delete any Message object.

	  - parameter messageId: (formData) ID of the message to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User to delete the Message object on behalf of. The user needs to be either the sender
or recipient of the message.

The current user must be an application admin to delete a Message object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func messagesDelete(messageId: String , suId: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		messagesDeleteRequestBuilder(messageId: messageId, suId: suId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Delete the message with the given `id`. The message must be in the current
user's inbox or sent mail. There is currently no trash folder and deletion is
permanent.

Application Admin can delete any Message object.

	  - DELETE /messages/delete.json
	  - Delete the message with the given `id`. The message must be in the current
user's inbox or sent mail. There is currently no trash folder and deletion is
permanent.

Application Admin can delete any Message object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  message_id: (formData) ID of the message to delete.  
		- parameter  su_id: (formData) User to delete the Message object on behalf of. The user needs to be either the sender
or recipient of the message.

The current user must be an application admin to delete a Message object on
behalf of another user.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func messagesDeleteRequestBuilder(messageId: String,suId: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/messages/delete.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"message_id": messageId as AnyObject , 
		 	"su_id": suId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
      Delete all messages in a thread with the given `thread_id`. The thread must be
in the current user's inbox or sent mail. There is currently no trash folder
and deletion is permanent.

	  - parameter threadId: (formData) Thread ID of the message thread to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func messagesDeleteThread(threadId: String ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		messagesDeleteThreadRequestBuilder(threadId: threadId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Delete all messages in a thread with the given `thread_id`. The thread must be
in the current user's inbox or sent mail. There is currently no trash folder
and deletion is permanent.

	  - DELETE /messages/delete/thread.json
	  - Delete all messages in a thread with the given `thread_id`. The thread must be
in the current user's inbox or sent mail. There is currently no trash folder
and deletion is permanent.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  thread_id: (formData) Thread ID of the message thread to delete.  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func messagesDeleteThreadRequestBuilder(threadId: String) -> RequestBuilder<[String:Any]> { 
		let path = "/messages/delete/thread.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"thread_id": threadId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Performs a custom query of Messages.
      Performs a custom query of Messages. Currently you can not query or sort data stored inside 
an array or hash in custom fields.

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
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter where_: (query) Constraint values for fields. `where` should be encoded JSON.

You can query any of the standard values for an ACL object, as well as any
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

	public class func messagesQuery(page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , prettyJson: Bool? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		messagesQueryRequestBuilder(page: page, perPage: perPage, limit: limit, skip: skip, prettyJson: prettyJson, where_: where_, order: order, sel: sel, unsel: unsel, responseJsonDepth: responseJsonDepth).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Performs a custom query of Messages.
      Performs a custom query of Messages. Currently you can not query or sort data stored inside 
an array or hash in custom fields.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).        

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /messages/query.json
	  - Performs a custom query of Messages. Currently you can not query or sort data stored inside 
an array or hash in custom fields.

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
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  where: (query) Constraint values for fields. `where` should be encoded JSON.

You can query any of the standard values for an ACL object, as well as any
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

	public class func messagesQueryRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,prettyJson: Bool? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/messages/query.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"limit": limit as AnyObject, 
			"skip": skip as AnyObject, 
			"pretty_json": prettyJson as AnyObject, 
			"where": where_ as AnyObject, 
			"order": order as AnyObject, 
			"sel": sel as AnyObject, 
			"unsel": unsel as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
      Replies to all recipients of the given message `id`. The status of the message
will be changed to `replied`.

	  - parameter messageId: (formData) ID of the message to reply to. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter body: (formData) Reply message body text. 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func messagesReply(messageId: String , body: String ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		messagesReplyRequestBuilder(messageId: messageId, body: body).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Replies to all recipients of the given message `id`. The status of the message
will be changed to `replied`.

	  - POST /messages/reply.json
	  - Replies to all recipients of the given message `id`. The status of the message
will be changed to `replied`.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  message_id: (formData) ID of the message to reply to.  
		- parameter  body: (formData) Reply message body text.  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func messagesReplyRequestBuilder(messageId: String,body: String) -> RequestBuilder<[String:Any]> { 
		let path = "/messages/reply.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"message_id": messageId as AnyObject , 
		 	"body": body as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
      Shows a message in the user's mailbox.
	  - parameter messageId: (query) ID of the message. 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func messagesShow(messageId: String ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		messagesShowRequestBuilder(messageId: messageId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Shows a message in the user's mailbox.
	  - GET /messages/show.json
	  - Shows a message in the user's mailbox.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  message_id: (query) ID of the message.  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func messagesShowRequestBuilder(messageId: String) -> RequestBuilder<[String:Any]> { 
		let path = "/messages/show.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"message_id": messageId as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
      Shows messages in the current user's inbox. Messages in the inbox have the
status of `unread`, `read`, or `replied`.

	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func messagesShowInbox(page: Int32? = nil , perPage: Int32? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		messagesShowInboxRequestBuilder(page: page, perPage: perPage).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Shows messages in the current user's inbox. Messages in the inbox have the
status of `unread`, `read`, or `replied`.

	  - GET /messages/show/inbox.json
	  - Shows messages in the current user's inbox. Messages in the inbox have the
status of `unread`, `read`, or `replied`.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func messagesShowInboxRequestBuilder(page: Int32? = nil,perPage: Int32? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/messages/show/inbox.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
      Shows messages in the current user's sent messages.
	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func messagesShowSent(page: Int32? = nil , perPage: Int32? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		messagesShowSentRequestBuilder(page: page, perPage: perPage).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Shows messages in the current user's sent messages.
	  - GET /messages/show/sent.json
	  - Shows messages in the current user's sent messages.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func messagesShowSentRequestBuilder(page: Int32? = nil,perPage: Int32? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/messages/show/sent.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
      Show messages with the given `thread_id` from the user's inbox. If the status
of any of the returned messages is `unread`, it will be changed to `read`.

	  - parameter threadId: (query) ID of the thread to show messages from. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func messagesShowThread(threadId: String? = nil , page: Int32? = nil , perPage: Int32? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		messagesShowThreadRequestBuilder(threadId: threadId, page: page, perPage: perPage).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Show messages with the given `thread_id` from the user's inbox. If the status
of any of the returned messages is `unread`, it will be changed to `read`.

	  - GET /messages/show/thread.json
	  - Show messages with the given `thread_id` from the user's inbox. If the status
of any of the returned messages is `unread`, it will be changed to `read`.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  thread_id: (query) ID of the thread to show messages from. (optional) 
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func messagesShowThreadRequestBuilder(threadId: String? = nil,page: Int32? = nil,perPage: Int32? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/messages/show/thread.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"thread_id": threadId as AnyObject, 
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
      Shows the first message in each of the most recent threads in the user's inbox.
	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func messagesShowThreads(page: Int32? = nil , perPage: Int32? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		messagesShowThreadsRequestBuilder(page: page, perPage: perPage).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Shows the first message in each of the most recent threads in the user's inbox.
	  - GET /messages/show/threads.json
	  - Shows the first message in each of the most recent threads in the user's inbox.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func messagesShowThreadsRequestBuilder(page: Int32? = nil,perPage: Int32? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/messages/show/threads.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
