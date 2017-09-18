// /Apis/PushNotificationsAPI.swift
 

import Foundation

public class PushNotificationsAPI: APIBase { 
	/**
	  Channels Query
      Returns a list of push notification channels the user is subscribed to.

For application admins, if the `user_id` parameter is not specified, returns all channels
with subscribed users.

	  - parameter userId: (query) User to retrieve subscribed channels for.

Only application admins can query subscribed channels of a user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter count: (query) Set to `true` to return the total number of push channels in the `count` field of the
`meta` header.  Default is `false`.

Only valid for applications created with ArrowDB 1.1.8 or greater.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushNotificationsChannelsQuery(userId: String? = nil , page: Int32? = nil , perPage: Int32? = nil , prettyJson: Bool? = nil , count: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushNotificationsChannelsQueryRequestBuilder(userId: userId, page: page, perPage: perPage, prettyJson: prettyJson, count: count).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Channels Query
      Returns a list of push notification channels the user is subscribed to.

For application admins, if the `user_id` parameter is not specified, returns all channels
with subscribed users.

	  - GET /push_notification/channels/query.json
	  - Returns a list of push notification channels the user is subscribed to.

For application admins, if the `user_id` parameter is not specified, returns all channels
with subscribed users.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  user_id: (query) User to retrieve subscribed channels for.

Only application admins can query subscribed channels of a user.
 (optional) 
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  count: (query) Set to `true` to return the total number of push channels in the `count` field of the
`meta` header.  Default is `false`.

Only valid for applications created with ArrowDB 1.1.8 or greater.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushNotificationsChannelsQueryRequestBuilder(userId: String? = nil,page: Int32? = nil,perPage: Int32? = nil,prettyJson: Bool? = nil,count: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_notification/channels/query.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"user_id": userId as AnyObject, 
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"pretty_json": prettyJson as AnyObject, 
			"count": count as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Channels Show
      Returns the number of devices subscribed to the specified channel.

	  - parameter name: (query) Name of the push channel.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushNotificationsChannelsShow(name: String , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushNotificationsChannelsShowRequestBuilder(name: name, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Channels Show
      Returns the number of devices subscribed to the specified channel.

	  - GET /push_notification/channels/show.json
	  - Returns the number of devices subscribed to the specified channel.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (query) Name of the push channel.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
  
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushNotificationsChannelsShowRequestBuilder(name: String,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_notification/channels/show.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"name": name as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Retrieves the total number of devices subscribed to push notifications.
      Retrieves the total number of devices subscribed to push notifications.
	*/

	public class func pushNotificationsCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushNotificationsCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of devices subscribed to push notifications.
      Retrieves the total number of devices subscribed to push notifications.
	  - GET /push_notification/count.json
	  - Retrieves the total number of devices subscribed to push notifications.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushNotificationsCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/push_notification/count.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  notify
      Sends push notifications to one or more users who are subscribed to a channel.

Specify either `friends`, `to_ids` or `where`.
One of these parameters must be used. These parameters cannot be used simultaneously.

Application admins can set the `to_ids` parameter to `everyone` to send to all devices
subscribed to the identified channel.

The REST version of `notify` includes the push notification ID in its response.
See the REST example below.

	  - parameter channel: (formData) Name of the channel. For multiple channels, either comma-separate the list of channels
or use an array of strings.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter friends: (formData) If this parameter is specified (regardless of the parameter's value),
push notifications are sent to any of the user's {@link Friends} who are
subscribed to the identified channel.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter toIds: (formData) Comma-separated list of user IDs to send the notification to users who are subscribed
to the specified channel. Up to 1000 users can be specified.

You **cannot** use this parameter when using a location query with the `where` parameter.

Application admins can set this parameter to `everyone` to send to all devices
subscribed to the channel.

If you are using the web interface, you do not need to specify this parameter.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter payload: (formData) Payload to send with the push notification.

For a string, it will be sent as an alert (notification message).
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter options: (formData) Additional push options.

* *expire_after_seconds* (Number): Expiration time in seconds of when to stop sending the push notification.
  For example, if the push notification expiration time is for a day and the user's device
  is off for over a day, the user does not receive the push notification since it has expired.

For example, to specify a one day expiration period, use `options={'expire_after_seconds':86400}`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter where_: (formData) A JSON-encoded object that defines either the user or location query used to select the device
that will receive the notification. Up to 1000 users can be returned by the query.

If you are using a location query, you **cannot** use the `to_ids` parameter.

To specify a user query, set the `user` field to a custom query, for example, the
following query searches for all users with the first name of Joe:

    where={"user": {"first_name":"Joe">

To specify a location query, set the `loc` field to a
[MongoDB Geospatial Query](http://docs.mongodb.org/manual/reference/operator/query-geospatial/).
The following query searches for all users within 2 km of Oakland, CA, USA:

    where={"loc": { "$nearSphere" : { "$geometry" : { "type" : "Point" , "coordinates" : [-122.2708,37.8044] } , "$maxDistance" : 2000 >}

For details about using the `where` parameter, see the [Search and Query guide](#!/guide/search_query).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushNotificationsNotify(channel: String , friends: String? = nil , toIds: String? = nil , payload: String , options: String? = nil , where_: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushNotificationsNotifyRequestBuilder(channel: channel, friends: friends, toIds: toIds, payload: payload, options: options, where_: where_, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  notify
      Sends push notifications to one or more users who are subscribed to a channel.

Specify either `friends`, `to_ids` or `where`.
One of these parameters must be used. These parameters cannot be used simultaneously.

Application admins can set the `to_ids` parameter to `everyone` to send to all devices
subscribed to the identified channel.

The REST version of `notify` includes the push notification ID in its response.
See the REST example below.

	  - POST /push_notification/notify.json
	  - Sends push notifications to one or more users who are subscribed to a channel.

Specify either `friends`, `to_ids` or `where`.
One of these parameters must be used. These parameters cannot be used simultaneously.

Application admins can set the `to_ids` parameter to `everyone` to send to all devices
subscribed to the identified channel.

The REST version of `notify` includes the push notification ID in its response.
See the REST example below.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  channel: (formData) Name of the channel. For multiple channels, either comma-separate the list of channels
or use an array of strings.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
  
		- parameter  friends: (formData) If this parameter is specified (regardless of the parameter's value),
push notifications are sent to any of the user's {@link Friends} who are
subscribed to the identified channel.
 (optional) 
		- parameter  to_ids: (formData) Comma-separated list of user IDs to send the notification to users who are subscribed
to the specified channel. Up to 1000 users can be specified.

You **cannot** use this parameter when using a location query with the `where` parameter.

Application admins can set this parameter to `everyone` to send to all devices
subscribed to the channel.

If you are using the web interface, you do not need to specify this parameter.
 (optional) 
		- parameter  payload: (formData) Payload to send with the push notification.

For a string, it will be sent as an alert (notification message).
  
		- parameter  options: (formData) Additional push options.

* *expire_after_seconds* (Number): Expiration time in seconds of when to stop sending the push notification.
  For example, if the push notification expiration time is for a day and the user's device
  is off for over a day, the user does not receive the push notification since it has expired.

For example, to specify a one day expiration period, use `options={'expire_after_seconds':86400}`.
 (optional) 
		- parameter  where: (formData) A JSON-encoded object that defines either the user or location query used to select the device
that will receive the notification. Up to 1000 users can be returned by the query.

If you are using a location query, you **cannot** use the `to_ids` parameter.

To specify a user query, set the `user` field to a custom query, for example, the
following query searches for all users with the first name of Joe:

    where={"user": {"first_name":"Joe">

To specify a location query, set the `loc` field to a
[MongoDB Geospatial Query](http://docs.mongodb.org/manual/reference/operator/query-geospatial/).
The following query searches for all users within 2 km of Oakland, CA, USA:

    where={"loc": { "$nearSphere" : { "$geometry" : { "type" : "Point" , "coordinates" : [-122.2708,37.8044] } , "$maxDistance" : 2000 >}

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

	public class func pushNotificationsNotifyRequestBuilder(channel: String,friends: String? = nil,toIds: String? = nil,payload: String,options: String? = nil,where_: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_notification/notify.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"channel": channel as AnyObject , 
		 	"friends": friends as AnyObject , 
		 	"to_ids": toIds as AnyObject , 
		 	"payload": payload as AnyObject , 
		 	"options": options as AnyObject , 
		 	"where": where_ as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  notify_tokens
      Sends push notifications to one or more users who are subscribed to a channel.

Application admins can set the `to_tokens` parameter to `everyone` to send to all devices
subscribed to the identified channel.

If you use the `to_tokens` parameter, you **cannot** specify a location query using the `where`
parameter in the same API call.

	  - parameter channel: (formData) Name of the channel. For multiple channels, either comma-separate the list of channels
or use an array of strings.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter toTokens: (formData) Comma-separated list of device tokens. Sends push notification to the specified
tokens who are subscribed to the specified channel.

You **cannot** use this parameter with a location query using the `where` parameter.

Application admins can set this parameter to `everyone` to send to all devices
subscribed to the channel.

If you are using the web interface, you do not need to specify this parameter.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter payload: (formData) Payload to send with the push notification.

For a string, it will be sent as an alert (message notification).
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter options: (formData) Additional push options.

* *expire_after_seconds* (Number): Expiration time in seconds of when to stop sending the push notification.
  For example, if the push notification expiration time is for a day and the user's device
  is off for over a day, the user does not receive the push notification since it has expired.

For example, to specify a one day expiration period, use `options={'expire_after_seconds':86400}`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter where_: (formData) A JSON-encoded object that defines either the user or location query used to select the device
that will receive the notification. Up to 1000 users can be returned by the query.

If you are using the `to_tokens` parameter, you **cannot** specify a location query.

To specify a user query, set the `user` field to a custom query, for example, the
following query searches for all users with the first name of Joe:

    where={"user": {"first_name":"Joe">

To specify a location query, set the `loc` field to a
[MongoDB Geospatial Query](http://docs.mongodb.org/manual/reference/operator/query-geospatial/).
The following query searches for all users within 2 km of Oakland, CA, USA:

    where={"loc": { "$nearSphere" : { "$geometry" : { "type" : "Point" , "coordinates" : [-122.2708,37.8044] } , "$maxDistance" : 2000 >}

For details about using the `where` parameter,
see the [Search and Query guide](#!/guide/search_query).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushNotificationsNotifyTokens(channel: String , toTokens: String , payload: String , options: String? = nil , where_: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushNotificationsNotifyTokensRequestBuilder(channel: channel, toTokens: toTokens, payload: payload, options: options, where_: where_, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  notify_tokens
      Sends push notifications to one or more users who are subscribed to a channel.

Application admins can set the `to_tokens` parameter to `everyone` to send to all devices
subscribed to the identified channel.

If you use the `to_tokens` parameter, you **cannot** specify a location query using the `where`
parameter in the same API call.

	  - POST /push_notification/notify_tokens.json
	  - Sends push notifications to one or more users who are subscribed to a channel.

Application admins can set the `to_tokens` parameter to `everyone` to send to all devices
subscribed to the identified channel.

If you use the `to_tokens` parameter, you **cannot** specify a location query using the `where`
parameter in the same API call.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  channel: (formData) Name of the channel. For multiple channels, either comma-separate the list of channels
or use an array of strings.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
  
		- parameter  to_tokens: (formData) Comma-separated list of device tokens. Sends push notification to the specified
tokens who are subscribed to the specified channel.

You **cannot** use this parameter with a location query using the `where` parameter.

Application admins can set this parameter to `everyone` to send to all devices
subscribed to the channel.

If you are using the web interface, you do not need to specify this parameter.
  
		- parameter  payload: (formData) Payload to send with the push notification.

For a string, it will be sent as an alert (message notification).
  
		- parameter  options: (formData) Additional push options.

* *expire_after_seconds* (Number): Expiration time in seconds of when to stop sending the push notification.
  For example, if the push notification expiration time is for a day and the user's device
  is off for over a day, the user does not receive the push notification since it has expired.

For example, to specify a one day expiration period, use `options={'expire_after_seconds':86400}`.
 (optional) 
		- parameter  where: (formData) A JSON-encoded object that defines either the user or location query used to select the device
that will receive the notification. Up to 1000 users can be returned by the query.

If you are using the `to_tokens` parameter, you **cannot** specify a location query.

To specify a user query, set the `user` field to a custom query, for example, the
following query searches for all users with the first name of Joe:

    where={"user": {"first_name":"Joe">

To specify a location query, set the `loc` field to a
[MongoDB Geospatial Query](http://docs.mongodb.org/manual/reference/operator/query-geospatial/).
The following query searches for all users within 2 km of Oakland, CA, USA:

    where={"loc": { "$nearSphere" : { "$geometry" : { "type" : "Point" , "coordinates" : [-122.2708,37.8044] } , "$maxDistance" : 2000 >}

For details about using the `where` parameter,
see the [Search and Query guide](#!/guide/search_query).
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushNotificationsNotifyTokensRequestBuilder(channel: String,toTokens: String,payload: String,options: String? = nil,where_: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_notification/notify_tokens.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"channel": channel as AnyObject , 
		 	"to_tokens": toTokens as AnyObject , 
		 	"payload": payload as AnyObject , 
		 	"options": options as AnyObject , 
		 	"where": where_ as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Query
      **Note:** this API is only available for applications created with ArrowDB 1.1.7 or greater.

Custom query of push notification subscriptions with pagination. For regular (non-admin) application
users, this method returns the currently logged-in user's list of push notification subscriptions.
For app admins, the method returns a list of subscriptions for all users, or just those
for the user specified by as the method's `su_id` parameter.

You can paginate query results using `skip` and `limit` parameters, or `page` and `per_page`, 
but not both in the same query.

	  - parameter suId: (query) User ID of the user who has subscribed devices for push notification.
You must be an application admin to query another user's subscriptions.

If this parameter is not included, a list of subscriptions for all users is returned.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter channel: (query) Name of the push notification channel.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter deviceToken: (query) Apple or Android Device Token. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter type: (query) Selects the push type.

Set to `android` for Android devices usingGoogle Cloud Messaging
or `ios` for iOS devices using Apple Push Notification Service.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter limit: (query) Instead of using `page` and `per_page` for pagination, you can use `limit` and
`skip` to do your own pagination. `limit` is the maximum number of records to `skip`. 
The specified value must be greater than 0 and no greater than 1000, or an HTTP 400 
(Bad Request) error will be returned.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter skip: (query) Number of records to skip. Must be used together with `limit`. The specified value must not
be less than 0 or an HTTP 400 error will be returned.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushNotificationsQuery(suId: String? = nil , channel: String? = nil , deviceToken: String? = nil , type: String? = nil , page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushNotificationsQueryRequestBuilder(suId: suId, channel: channel, deviceToken: deviceToken, type: type, page: page, perPage: perPage, limit: limit, skip: skip, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Query
      **Note:** this API is only available for applications created with ArrowDB 1.1.7 or greater.

Custom query of push notification subscriptions with pagination. For regular (non-admin) application
users, this method returns the currently logged-in user's list of push notification subscriptions.
For app admins, the method returns a list of subscriptions for all users, or just those
for the user specified by as the method's `su_id` parameter.

You can paginate query results using `skip` and `limit` parameters, or `page` and `per_page`, 
but not both in the same query.

	  - GET /push_notification/query.json
	  - **Note:** this API is only available for applications created with ArrowDB 1.1.7 or greater.

Custom query of push notification subscriptions with pagination. For regular (non-admin) application
users, this method returns the currently logged-in user's list of push notification subscriptions.
For app admins, the method returns a list of subscriptions for all users, or just those
for the user specified by as the method's `su_id` parameter.

You can paginate query results using `skip` and `limit` parameters, or `page` and `per_page`, 
but not both in the same query.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  su_id: (query) User ID of the user who has subscribed devices for push notification.
You must be an application admin to query another user's subscriptions.

If this parameter is not included, a list of subscriptions for all users is returned.
 (optional) 
		- parameter  channel: (query) Name of the push notification channel.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
 (optional) 
		- parameter  device_token: (query) Apple or Android Device Token. (optional) 
		- parameter  type: (query) Selects the push type.

Set to `android` for Android devices usingGoogle Cloud Messaging
or `ios` for iOS devices using Apple Push Notification Service.
 (optional) 
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
		- parameter  limit: (query) Instead of using `page` and `per_page` for pagination, you can use `limit` and
`skip` to do your own pagination. `limit` is the maximum number of records to `skip`. 
The specified value must be greater than 0 and no greater than 1000, or an HTTP 400 
(Bad Request) error will be returned.
 (optional) 
		- parameter  skip: (query) Number of records to skip. Must be used together with `limit`. The specified value must not
be less than 0 or an HTTP 400 error will be returned.
 (optional) 
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushNotificationsQueryRequestBuilder(suId: String? = nil,channel: String? = nil,deviceToken: String? = nil,type: String? = nil,page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_notification/query.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"su_id": suId as AnyObject, 
			"channel": channel as AnyObject, 
			"device_token": deviceToken as AnyObject, 
			"type": type as AnyObject, 
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"limit": limit as AnyObject, 
			"skip": skip as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  reset_badge
      Sets the internally stored value of the badge to zero of a specific device.

This method only updates the internally stored value of the badge.  To update the badge value
on the iOS icon or Android notification center, send a push notification with the `badge` field defined.

If you are an application admin, you may omit the device token.

	  - parameter deviceToken: (formData) Device token. If you are an application admin, you may omit the device token.
 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushNotificationsResetBadge(deviceToken: String ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushNotificationsResetBadgeRequestBuilder(deviceToken: deviceToken).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  reset_badge
      Sets the internally stored value of the badge to zero of a specific device.

This method only updates the internally stored value of the badge.  To update the badge value
on the iOS icon or Android notification center, send a push notification with the `badge` field defined.

If you are an application admin, you may omit the device token.

	  - PUT /push_notification/reset_badge.json
	  - Sets the internally stored value of the badge to zero of a specific device.

This method only updates the internally stored value of the badge.  To update the badge value
on the iOS icon or Android notification center, send a push notification with the `badge` field defined.

If you are an application admin, you may omit the device token.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  device_token: (formData) Device token. If you are an application admin, you may omit the device token.
  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushNotificationsResetBadgeRequestBuilder(deviceToken: String) -> RequestBuilder<[String:Any]> { 
		let path = "/push_notification/reset_badge.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"device_token": deviceToken as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  set_badge
      Sets the value of the internally stored value of the badge.

This method only updates the internally stored value of the badge.  To update the badge value
on the iOS icon or Android notification center, send a push notification with the `badge` field defined.

	  - parameter deviceToken: (formData) Device token. Required if you are not an application admin.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter badgeNumber: (formData) Number to set as the badge on the application's icon.
Specify postive and negative values with the `+` and `-`
symbols to increment or decrement the current badge number, respectively.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushNotificationsSetBadge(deviceToken: String? = nil , badgeNumber: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushNotificationsSetBadgeRequestBuilder(deviceToken: deviceToken, badgeNumber: badgeNumber, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  set_badge
      Sets the value of the internally stored value of the badge.

This method only updates the internally stored value of the badge.  To update the badge value
on the iOS icon or Android notification center, send a push notification with the `badge` field defined.

	  - PUT /push_notification/set_badge.json
	  - Sets the value of the internally stored value of the badge.

This method only updates the internally stored value of the badge.  To update the badge value
on the iOS icon or Android notification center, send a push notification with the `badge` field defined.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  device_token: (formData) Device token. Required if you are not an application admin.
 (optional) 
		- parameter  badge_number: (formData) Number to set as the badge on the application's icon.
Specify postive and negative values with the `+` and `-`
symbols to increment or decrement the current badge number, respectively.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushNotificationsSetBadgeRequestBuilder(deviceToken: String? = nil,badgeNumber: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_notification/set_badge.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"device_token": deviceToken as AnyObject , 
		 	"badge_number": badgeNumber as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  subscribe
      Subscribes a mobile device to a push notifications channel. Developers can
create different channels for different types of push notifications. For
instance, a channel for friend request, a channel for chat, etc. Push
notifications currently only work on iOS and Andriod.

	  - parameter channel: (formData) Push notification channel to subscribe to. For multiple channels, comma separate the
list of channel names.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter deviceToken: (formData) Apple or Android Device Token. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter type: (formData) Selects the push type.

Set to `android` for Android devices using Google Cloud Messaging
or `ios` for iOS devices using Apple Push Notification Service.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to subscribe on behalf of.

Only application admins can subscribe to push notifications on behalf of other
users.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushNotificationsSubscribe(channel: String , deviceToken: String , type: String , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushNotificationsSubscribeRequestBuilder(channel: channel, deviceToken: deviceToken, type: type, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  subscribe
      Subscribes a mobile device to a push notifications channel. Developers can
create different channels for different types of push notifications. For
instance, a channel for friend request, a channel for chat, etc. Push
notifications currently only work on iOS and Andriod.

	  - POST /push_notification/subscribe.json
	  - Subscribes a mobile device to a push notifications channel. Developers can
create different channels for different types of push notifications. For
instance, a channel for friend request, a channel for chat, etc. Push
notifications currently only work on iOS and Andriod.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  channel: (formData) Push notification channel to subscribe to. For multiple channels, comma separate the
list of channel names.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
  
		- parameter  device_token: (formData) Apple or Android Device Token.  
		- parameter  type: (formData) Selects the push type.

Set to `android` for Android devices using Google Cloud Messaging
or `ios` for iOS devices using Apple Push Notification Service.
  
		- parameter  su_id: (formData) User ID to subscribe on behalf of.

Only application admins can subscribe to push notifications on behalf of other
users.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushNotificationsSubscribeRequestBuilder(channel: String,deviceToken: String,type: String,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_notification/subscribe.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"channel": channel as AnyObject , 
		 	"device_token": deviceToken as AnyObject , 
		 	"type": type as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
      Subscribes a mobile device to a push notifications channel.

Developers can create different channels for different types of push notifications, such as
a friend request, chat, etc.

	  - parameter deviceToken: (formData) Android or iOS device token.

For Android, the length is dynamic and is less than 4096 characters.

For iOS, the length is 64 characters.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter channel: (formData) Name of the channel. For multiple channels, comma separate the list of channel names.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter type: (formData) Selects the push type.

Set to `android` for Android devices using Google Cloud Messaging
or `ios` for iOS devices using Apple Push Notification Service.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushNotificationsSubscribeToken(deviceToken: String , channel: String , type: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushNotificationsSubscribeTokenRequestBuilder(deviceToken: deviceToken, channel: channel, type: type, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Subscribes a mobile device to a push notifications channel.

Developers can create different channels for different types of push notifications, such as
a friend request, chat, etc.

	  - POST /push_notification/subscribe_token.json
	  - Subscribes a mobile device to a push notifications channel.

Developers can create different channels for different types of push notifications, such as
a friend request, chat, etc.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  device_token: (formData) Android or iOS device token.

For Android, the length is dynamic and is less than 4096 characters.

For iOS, the length is 64 characters.
  
		- parameter  channel: (formData) Name of the channel. For multiple channels, comma separate the list of channel names.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
  
		- parameter  type: (formData) Selects the push type.

Set to `android` for Android devices using Google Cloud Messaging
or `ios` for iOS devices using Apple Push Notification Service.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushNotificationsSubscribeTokenRequestBuilder(deviceToken: String,channel: String,type: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_notification/subscribe_token.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"device_token": deviceToken as AnyObject , 
		 	"channel": channel as AnyObject , 
		 	"type": type as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Update the Subscription
      Updates the device's push channel subscription.

	  - parameter deviceToken: (formData) Apple or Android Device Token. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to update the subscription on behalf of. You must be logged in as an application administrator
to update another user's notification subscription.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter loc: (formData) The device's current location specified as an array with longitude as the first element, and latitude
as the second element (`[longitude,latitude]`).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushNotificationsSubscriptionUpdate(deviceToken: String , suId: String? = nil , loc: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushNotificationsSubscriptionUpdateRequestBuilder(deviceToken: deviceToken, suId: suId, loc: loc, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Update the Subscription
      Updates the device's push channel subscription.

	  - PUT /push_notification/subscription/update.json
	  - Updates the device's push channel subscription.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  device_token: (formData) Apple or Android Device Token.  
		- parameter  su_id: (formData) User ID to update the subscription on behalf of. You must be logged in as an application administrator
to update another user's notification subscription.
 (optional) 
		- parameter  loc: (formData) The device's current location specified as an array with longitude as the first element, and latitude
as the second element (`[longitude,latitude]`).
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushNotificationsSubscriptionUpdateRequestBuilder(deviceToken: String,suId: String? = nil,loc: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_notification/subscription/update.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"device_token": deviceToken as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"loc": loc as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  unsubscribe
      Unsubscribes one of the current user's devices from a push notification channel. If channel name is not
provided, unsubscribe the device from all channels.

When a user logs out from a device, you can cancel all subscriptions for the
device by passing the device's token to the {@link Users#logout} method.

	  - parameter channel: (formData) Name of the push notification channel. For multiple channels, comma separate the list of
channel names.

The name of the push channel cannot start with a hash symbol ('#') or contains a comma (',').
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter deviceToken: (formData) Apple or Android Device Token. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter userId: (formData) User ID to unsubscribe from push notifications.

Only application admins can unsubscribe another user from push notifications.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushNotificationsUnsubscribe(channel: String? = nil , deviceToken: String , userId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushNotificationsUnsubscribeRequestBuilder(channel: channel, deviceToken: deviceToken, userId: userId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  unsubscribe
      Unsubscribes one of the current user's devices from a push notification channel. If channel name is not
provided, unsubscribe the device from all channels.

When a user logs out from a device, you can cancel all subscriptions for the
device by passing the device's token to the {@link Users#logout} method.

	  - DELETE /push_notification/unsubscribe.json
	  - Unsubscribes one of the current user's devices from a push notification channel. If channel name is not
provided, unsubscribe the device from all channels.

When a user logs out from a device, you can cancel all subscriptions for the
device by passing the device's token to the {@link Users#logout} method.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  channel: (formData) Name of the push notification channel. For multiple channels, comma separate the list of
channel names.

The name of the push channel cannot start with a hash symbol ('#') or contains a comma (',').
 (optional) 
		- parameter  device_token: (formData) Apple or Android Device Token.  
		- parameter  user_id: (formData) User ID to unsubscribe from push notifications.

Only application admins can unsubscribe another user from push notifications.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushNotificationsUnsubscribeRequestBuilder(channel: String? = nil,deviceToken: String,userId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_notification/unsubscribe.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"channel": channel as AnyObject , 
		 	"device_token": deviceToken as AnyObject , 
		 	"user_id": userId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  unsubscribe_token
      Unsubscribes the specified device from a push notification channel.
If `channel` is not defined, unsubscribes the device from all channels.

	  - parameter channel: (formData) Name of the push notification channel. For multiple channels, comma separate the list of
channel names.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter deviceToken: (formData) Android or iOS device token. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func pushNotificationsUnsubscribeToken(channel: String? = nil , deviceToken: String , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		pushNotificationsUnsubscribeTokenRequestBuilder(channel: channel, deviceToken: deviceToken, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  unsubscribe_token
      Unsubscribes the specified device from a push notification channel.
If `channel` is not defined, unsubscribes the device from all channels.

	  - DELETE /push_notification/unsubscribe_token.json
	  - Unsubscribes the specified device from a push notification channel.
If `channel` is not defined, unsubscribes the device from all channels.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  channel: (formData) Name of the push notification channel. For multiple channels, comma separate the list of
channel names.

The name of the push channel cannot start with a hash symbol ('#') or contain a comma (',').
 (optional) 
		- parameter  device_token: (formData) Android or iOS device token.  
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func pushNotificationsUnsubscribeTokenRequestBuilder(channel: String? = nil,deviceToken: String,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/push_notification/unsubscribe_token.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"channel": channel as AnyObject , 
		 	"device_token": deviceToken as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
