// /Apis/EventsAPI.swift
 

import Foundation

public class EventsAPI: APIBase { 
	/**
	  Deletes multiple Events objects.
      Deletes Events objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Events objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.

Any {@link #place Place} associated with the matched objects are not deleted.

You must be an application admin to run this command.

	  - parameter where_: (formData) Encoded JSON object that specifies constraint values for Events objects to delete.
If not specified, all Events objects are deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func eventsBatchDelete(where_: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		eventsBatchDeleteRequestBuilder(where_: where_).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Deletes multiple Events objects.
      Deletes Events objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Events objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.

Any {@link #place Place} associated with the matched objects are not deleted.

You must be an application admin to run this command.

	  - DELETE /events/batch_delete.json
	  - Deletes Events objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Events objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.

Any {@link #place Place} associated with the matched objects are not deleted.

You must be an application admin to run this command.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  where: (formData) Encoded JSON object that specifies constraint values for Events objects to delete.
If not specified, all Events objects are deleted.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func eventsBatchDeleteRequestBuilder(where_: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/events/batch_delete.json"
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
	  Retrieves the total number of Event objects.
      Retrieves the total number of Event objects.
	*/

	public class func eventsCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		eventsCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of Event objects.
      Retrieves the total number of Event objects.
	  - GET /events/count.json
	  - Retrieves the total number of Event objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func eventsCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/events/count.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
      Create an event. Times given with time zones other than UTC (for example PST
during daylight savings is -0700) will be converted to UTC. An ical string
will be returned to represent the occurrences of the event.

For the event that is set as a recurring event, once created, there will be
several "event occurrences" created associating with the event object on
server side, one "event occurrence" represents a single occurrence of the
recurring event. An "event occurrence" contains start and end time of the
event's occurrence which are calculated according to the "recurring" settings
of the event object.

Instead of computing actual individual occurrences of a recurring event on the
client side, you can use event occurrences query api to get a list of
occurrences associated of a repeating event.

To get all occurrences for a recurring event object, you can call {@link Events#show_occurrences}
event occurrence](/docs/api/v1/events/show_occurrences) and pass in the
event's `id`.

	  - parameter name: (formData) Event name. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter startTime: (formData) Event start time. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter details: (formData) Description of the event. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter duration: (formData) Event duration, in seconds. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter recurring: (formData) Recurrance schedule. Can take the following values: "daily", "weekly", "monthly", or "yearly".

Must be used together with `recurring_count` or `recurring_until` to limit the
number of occurances. The total number of occurrences of an event in either
case is limited to 1000.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter recurringCount: (formData) Number of occurrences for the event. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter recurringUntil: (formData) Date of last recurrance. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter placeId: (formData) ID for the {@link Places} where the event takes place. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New photo to attach as the primary photo for the event.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of an existing photo to attach as the primary photo for the event.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this event.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this event.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma-separated list of tags associated with this event. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to create the event on behalf of.

The current login user must be an application admin to create an event on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func eventsCreate(name: String , startTime: Date , details: String? = nil , duration: Int32? = nil , recurring: String? = nil , recurringCount: Int32? = nil , recurringUntil: String? = nil , placeId: String? = nil , photo: NSURL? = nil , photoId: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , tags: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		eventsCreateRequestBuilder(name: name, startTime: startTime, details: details, duration: duration, recurring: recurring, recurringCount: recurringCount, recurringUntil: recurringUntil, placeId: placeId, photo: photo, photoId: photoId, customFields: customFields, aclName: aclName, aclId: aclId, tags: tags, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Create an event. Times given with time zones other than UTC (for example PST
during daylight savings is -0700) will be converted to UTC. An ical string
will be returned to represent the occurrences of the event.

For the event that is set as a recurring event, once created, there will be
several "event occurrences" created associating with the event object on
server side, one "event occurrence" represents a single occurrence of the
recurring event. An "event occurrence" contains start and end time of the
event's occurrence which are calculated according to the "recurring" settings
of the event object.

Instead of computing actual individual occurrences of a recurring event on the
client side, you can use event occurrences query api to get a list of
occurrences associated of a repeating event.

To get all occurrences for a recurring event object, you can call {@link Events#show_occurrences}
event occurrence](/docs/api/v1/events/show_occurrences) and pass in the
event's `id`.

	  - POST /events/create.json
	  - Create an event. Times given with time zones other than UTC (for example PST
during daylight savings is -0700) will be converted to UTC. An ical string
will be returned to represent the occurrences of the event.

For the event that is set as a recurring event, once created, there will be
several "event occurrences" created associating with the event object on
server side, one "event occurrence" represents a single occurrence of the
recurring event. An "event occurrence" contains start and end time of the
event's occurrence which are calculated according to the "recurring" settings
of the event object.

Instead of computing actual individual occurrences of a recurring event on the
client side, you can use event occurrences query api to get a list of
occurrences associated of a repeating event.

To get all occurrences for a recurring event object, you can call {@link Events#show_occurrences}
event occurrence](/docs/api/v1/events/show_occurrences) and pass in the
event's `id`.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) Event name.  
		- parameter  start_time: (formData) Event start time.  
		- parameter  details: (formData) Description of the event. (optional) 
		- parameter  duration: (formData) Event duration, in seconds. (optional) 
		- parameter  recurring: (formData) Recurrance schedule. Can take the following values: "daily", "weekly", "monthly", or "yearly".

Must be used together with `recurring_count` or `recurring_until` to limit the
number of occurances. The total number of occurrences of an event in either
case is limited to 1000.
 (optional) 
		- parameter  recurring_count: (formData) Number of occurrences for the event. (optional) 
		- parameter  recurring_until: (formData) Date of last recurrance. (optional) 
		- parameter  place_id: (formData) ID for the {@link Places} where the event takes place. (optional) 
		- parameter  photo: (formData) New photo to attach as the primary photo for the event.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional) 
		- parameter  photo_id: (formData) ID of an existing photo to attach as the primary photo for the event.
 (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this event.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this event.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  tags: (formData) Comma-separated list of tags associated with this event. (optional) 
		- parameter  su_id: (formData) User ID to create the event on behalf of.

The current login user must be an application admin to create an event on
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

	public class func eventsCreateRequestBuilder(name: String,startTime: Date,details: String? = nil,duration: Int32? = nil,recurring: String? = nil,recurringCount: Int32? = nil,recurringUntil: String? = nil,placeId: String? = nil,photo: NSURL? = nil,photoId: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,tags: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/events/create.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"name": name as AnyObject , 
		 	"start_time": startTime as AnyObject , 
		 	"details": details as AnyObject , 
		 	"duration": duration as AnyObject , 
		 	"recurring": recurring as AnyObject , 
		 	"recurring_count": recurringCount as AnyObject , 
		 	"recurring_until": recurringUntil as AnyObject , 
		 	"place_id": placeId as AnyObject , 
		 	"photo": photo as AnyObject , 
		 	"photo_id": photoId as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"tags": tags as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Delete an Event
      Delete the event with the given `id`. Only the original submitter can delete
the event.

The {@link #place Place} associated with the object is not deleted.

Application Admin can delete any Event object.

	  - parameter eventId: (formData) ID of the event to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User to delete the Event object on behalf of. The user must be the creator of the object.

The current user must be an application admin to delete an Event object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func eventsDelete(eventId: String , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		eventsDeleteRequestBuilder(eventId: eventId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete an Event
      Delete the event with the given `id`. Only the original submitter can delete
the event.

The {@link #place Place} associated with the object is not deleted.

Application Admin can delete any Event object.

	  - DELETE /events/delete.json
	  - Delete the event with the given `id`. Only the original submitter can delete
the event.

The {@link #place Place} associated with the object is not deleted.

Application Admin can delete any Event object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  event_id: (formData) ID of the event to delete.  
		- parameter  su_id: (formData) User to delete the Event object on behalf of. The user must be the creator of the object.

The current user must be an application admin to delete an Event object on
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

	public class func eventsDeleteRequestBuilder(eventId: String,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/events/delete.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"event_id": eventId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Custom Query Events
      Perform custom query of events with sorting and paginating. Currently you can
not query or sort data stored inside array or hash in custom fields.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

In addition to the custom fields, you can query the following event fields:

<table>
    <tr>
        <th>Name</th>
    <th>Type</th>
        <th>Summary</th>
    </tr>
  <tr>
    <td><code>name</code></td>
    <td>String</td>
    <td>Event's name</td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>String</td>
    <td>Event owner's user ID</td>
  </tr>
  <tr>
    <td><code>place_id</code></td>
    <td>String</td>
    <td>If an event belongs to a place, the associated place_id</td>
  </tr>
  <tr>
    <td><code>tags_array</code></td>
    <td>Array</td>
    <td>Array of tags assigned to the Event.</td>
  </tr>
  <tr>
    <td><code>start_time</code></td>
    <td>Time</td>
    <td>Start time of an event</td>
  </tr>
  <tr>
    <td><code>num_occurences</code></td>
    <td>Integer</td>
    <td>Number of time the event repeats</td>
  </tr>
  <tr>
    <td><code>lnglat</code></td>
    <td>Geo location array - [longitude, latitude]</td>
    <td>If an event belongs to a place, you can use <code>lnglat</code> to query events by place location</td>
  </tr>
  <tr>
    <td><code>created_at</code></td>
    <td>Date</td>
    <td>Timestamp when the event was created</td>
  </tr>
  <tr>
    <td><code>updated_at</code></td>
    <td>Date</td>
    <td>Timestamp when the event was last updated</td>
  </tr>
</table>

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
	  - parameter showUserLike: (query) If set to **true**, each Event in the response includes `"current_user_liked: true"`
 if the current user has liked the object. If the current user has not liked the object, the
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

	public class func eventsQuery(page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , showUserLike: Bool? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		eventsQueryRequestBuilder(page: page, perPage: perPage, limit: limit, skip: skip, where_: where_, order: order, sel: sel, showUserLike: showUserLike, unsel: unsel, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Custom Query Events
      Perform custom query of events with sorting and paginating. Currently you can
not query or sort data stored inside array or hash in custom fields.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

In addition to the custom fields, you can query the following event fields:

<table>
    <tr>
        <th>Name</th>
    <th>Type</th>
        <th>Summary</th>
    </tr>
  <tr>
    <td><code>name</code></td>
    <td>String</td>
    <td>Event's name</td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>String</td>
    <td>Event owner's user ID</td>
  </tr>
  <tr>
    <td><code>place_id</code></td>
    <td>String</td>
    <td>If an event belongs to a place, the associated place_id</td>
  </tr>
  <tr>
    <td><code>tags_array</code></td>
    <td>Array</td>
    <td>Array of tags assigned to the Event.</td>
  </tr>
  <tr>
    <td><code>start_time</code></td>
    <td>Time</td>
    <td>Start time of an event</td>
  </tr>
  <tr>
    <td><code>num_occurences</code></td>
    <td>Integer</td>
    <td>Number of time the event repeats</td>
  </tr>
  <tr>
    <td><code>lnglat</code></td>
    <td>Geo location array - [longitude, latitude]</td>
    <td>If an event belongs to a place, you can use <code>lnglat</code> to query events by place location</td>
  </tr>
  <tr>
    <td><code>created_at</code></td>
    <td>Date</td>
    <td>Timestamp when the event was created</td>
  </tr>
  <tr>
    <td><code>updated_at</code></td>
    <td>Date</td>
    <td>Timestamp when the event was last updated</td>
  </tr>
</table>

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /events/query.json
	  - Perform custom query of events with sorting and paginating. Currently you can
not query or sort data stored inside array or hash in custom fields.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

In addition to the custom fields, you can query the following event fields:

<table>
    <tr>
        <th>Name</th>
    <th>Type</th>
        <th>Summary</th>
    </tr>
  <tr>
    <td><code>name</code></td>
    <td>String</td>
    <td>Event's name</td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>String</td>
    <td>Event owner's user ID</td>
  </tr>
  <tr>
    <td><code>place_id</code></td>
    <td>String</td>
    <td>If an event belongs to a place, the associated place_id</td>
  </tr>
  <tr>
    <td><code>tags_array</code></td>
    <td>Array</td>
    <td>Array of tags assigned to the Event.</td>
  </tr>
  <tr>
    <td><code>start_time</code></td>
    <td>Time</td>
    <td>Start time of an event</td>
  </tr>
  <tr>
    <td><code>num_occurences</code></td>
    <td>Integer</td>
    <td>Number of time the event repeats</td>
  </tr>
  <tr>
    <td><code>lnglat</code></td>
    <td>Geo location array - [longitude, latitude]</td>
    <td>If an event belongs to a place, you can use <code>lnglat</code> to query events by place location</td>
  </tr>
  <tr>
    <td><code>created_at</code></td>
    <td>Date</td>
    <td>Timestamp when the event was created</td>
  </tr>
  <tr>
    <td><code>updated_at</code></td>
    <td>Date</td>
    <td>Timestamp when the event was last updated</td>
  </tr>
</table>

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
		- parameter  show_user_like: (query) If set to **true**, each Event in the response includes `"current_user_liked: true"`
 if the current user has liked the object. If the current user has not liked the object, the
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

	public class func eventsQueryRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,showUserLike: Bool? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/events/query.json"
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
	  Custom Query Event Occurrences
      Perform custom query of event occurrences with sorting and paginating.

Currently, you can not query or sort data stored inside array or hash in custom
fields.

In addition to custom fields, you can query the following fields:

<table class="doc_content_table">
    <tr>
        <th>Name</th>
    <th>Type</th>
        <th>Summary</th>
    </tr>
  <tr>
    <td><code>name</code></td>
    <td>String</td>
    <td>Event's name</td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>String</td>
    <td>Event owner's user id</td>
  </tr>
  <tr>
    <td><code>place_id</code></td>
    <td>String</td>
    <td>If an event belongs to a place, the associated place_id</td>
  </tr>
  <tr>
    <td><code>start_time</code></td>
    <td>Time</td>
    <td>Start time of an event occurrence</td>
  </tr>
  <tr>
    <td><code>end_time</code></td>
    <td>Time</td>
    <td>End time of an event occurrence</td>
  </tr>
  <tr>
    <td><code>lnglat</code></td>
    <td>Geo location array - [longitude, latitude]</td>
    <td>If an event belongs to a place, you can use <code>lnglat</code> to query events by place location</td>
  </tr>
</table>

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
1000, or an HTTP 400 (Bad Request) error will be returned.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter skip: (query) Number of records to skip. Must be used together with `limit`.
The specified value must not be less than 0 or an HTTP 400 error will be returned.
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

	public class func eventsQueryOccurrences(page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		eventsQueryOccurrencesRequestBuilder(page: page, perPage: perPage, limit: limit, skip: skip, where_: where_, order: order, sel: sel, unsel: unsel, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Custom Query Event Occurrences
      Perform custom query of event occurrences with sorting and paginating.

Currently, you can not query or sort data stored inside array or hash in custom
fields.

In addition to custom fields, you can query the following fields:

<table class="doc_content_table">
    <tr>
        <th>Name</th>
    <th>Type</th>
        <th>Summary</th>
    </tr>
  <tr>
    <td><code>name</code></td>
    <td>String</td>
    <td>Event's name</td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>String</td>
    <td>Event owner's user id</td>
  </tr>
  <tr>
    <td><code>place_id</code></td>
    <td>String</td>
    <td>If an event belongs to a place, the associated place_id</td>
  </tr>
  <tr>
    <td><code>start_time</code></td>
    <td>Time</td>
    <td>Start time of an event occurrence</td>
  </tr>
  <tr>
    <td><code>end_time</code></td>
    <td>Time</td>
    <td>End time of an event occurrence</td>
  </tr>
  <tr>
    <td><code>lnglat</code></td>
    <td>Geo location array - [longitude, latitude]</td>
    <td>If an event belongs to a place, you can use <code>lnglat</code> to query events by place location</td>
  </tr>
</table>

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /events/query/occurrences.json
	  - Perform custom query of event occurrences with sorting and paginating.

Currently, you can not query or sort data stored inside array or hash in custom
fields.

In addition to custom fields, you can query the following fields:

<table class="doc_content_table">
    <tr>
        <th>Name</th>
    <th>Type</th>
        <th>Summary</th>
    </tr>
  <tr>
    <td><code>name</code></td>
    <td>String</td>
    <td>Event's name</td>
  </tr>
  <tr>
    <td><code>user_id</code></td>
    <td>String</td>
    <td>Event owner's user id</td>
  </tr>
  <tr>
    <td><code>place_id</code></td>
    <td>String</td>
    <td>If an event belongs to a place, the associated place_id</td>
  </tr>
  <tr>
    <td><code>start_time</code></td>
    <td>Time</td>
    <td>Start time of an event occurrence</td>
  </tr>
  <tr>
    <td><code>end_time</code></td>
    <td>Time</td>
    <td>End time of an event occurrence</td>
  </tr>
  <tr>
    <td><code>lnglat</code></td>
    <td>Geo location array - [longitude, latitude]</td>
    <td>If an event belongs to a place, you can use <code>lnglat</code> to query events by place location</td>
  </tr>
</table>

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
1000, or an HTTP 400 (Bad Request) error will be returned.
 (optional) 
		- parameter  skip: (query) Number of records to skip. Must be used together with `limit`.
The specified value must not be less than 0 or an HTTP 400 error will be returned.
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

	public class func eventsQueryOccurrencesRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/events/query/occurrences.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
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
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Search for Events
      Full text search of events.

Optionally, `latitude` and `longitude` can be given to return the list of
events starting from a particular location (location is retrieved from place
if the event is associated with a place). To bound the results within a
certain radius (in km) from the starting coordinates, add the `distance`
parameter. `q` can be given to search by event name.

	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter placeId: (query) Restrict search results to events located in the identified {@link Places}. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter userId: (query) Restrict search results to events owned by the identified {@link Users}. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter latitude: (query) Latitude of the search starting point. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter longitude: (query) Longitude of the search starting point. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter distance: (query) Maximum distance in km from the starting point identified by
`longitude`, latitude`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter startTime: (query) Only return events that start on or after `start_time`. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter q: (query) Space-separated list of keywords, used to perform full text search on event
name and tags.
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

	public class func eventsSearch(page: Int32? = nil , perPage: Int32? = nil , placeId: String? = nil , userId: String? = nil , latitude: Double? = nil , longitude: Double? = nil , distance: Double? = nil , startTime: Date? = nil , q: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		eventsSearchRequestBuilder(page: page, perPage: perPage, placeId: placeId, userId: userId, latitude: latitude, longitude: longitude, distance: distance, startTime: startTime, q: q, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Search for Events
      Full text search of events.

Optionally, `latitude` and `longitude` can be given to return the list of
events starting from a particular location (location is retrieved from place
if the event is associated with a place). To bound the results within a
certain radius (in km) from the starting coordinates, add the `distance`
parameter. `q` can be given to search by event name.

	  - GET /events/search.json
	  - Full text search of events.

Optionally, `latitude` and `longitude` can be given to return the list of
events starting from a particular location (location is retrieved from place
if the event is associated with a place). To bound the results within a
certain radius (in km) from the starting coordinates, add the `distance`
parameter. `q` can be given to search by event name.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
		- parameter  place_id: (query) Restrict search results to events located in the identified {@link Places}. (optional) 
		- parameter  user_id: (query) Restrict search results to events owned by the identified {@link Users}. (optional) 
		- parameter  latitude: (query) Latitude of the search starting point. (optional) 
		- parameter  longitude: (query) Longitude of the search starting point. (optional) 
		- parameter  distance: (query) Maximum distance in km from the starting point identified by
`longitude`, latitude`.
 (optional) 
		- parameter  start_time: (query) Only return events that start on or after `start_time`. (optional) 
		- parameter  q: (query) Space-separated list of keywords, used to perform full text search on event
name and tags.
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

	public class func eventsSearchRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,placeId: String? = nil,userId: String? = nil,latitude: Double? = nil,longitude: Double? = nil,distance: Double? = nil,startTime: Date? = nil,q: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/events/search.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"place_id": placeId as AnyObject, 
			"user_id": userId as AnyObject, 
			"latitude": latitude as AnyObject, 
			"longitude": longitude as AnyObject, 
			"distance": distance as AnyObject, 
			"start_time": startTime as AnyObject, 
			"q": q as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Seach for Event Occurrences
      Full text search of event occurrences.

Optionally, `latitude` and `longitude` can be given to return the list of
event occurrences starting from a particular location (location is retrieved
from place if the event is associated with a place). To bound the results
within a certain radius (in km) from the starting coordinates, add the
`distance` parameter. `q` can be given to search by event name.

	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter placeId: (query) Restrict search results to events located in the identified {@link Places}. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter userId: (query) Restrict search results to events owned by the identified {@link Users}. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter latitude: (query) Latitude of the search starting point. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter longitude: (query) Longitude of the search starting point. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter distance: (query) Maximum distance in km from the starting point identified by
`longitude`, latitude`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter startTime: (query) Only return events that start on or after `start_time`. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter endTime: (query) Only return events that end on or before `end_time`. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter q: (query) Space-separated list of keywords, used to perform full text search on event
name and tags.
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

	public class func eventsSearchOccurrences(page: Int32? = nil , perPage: Int32? = nil , placeId: String? = nil , userId: String? = nil , latitude: Double? = nil , longitude: Double? = nil , distance: Double? = nil , startTime: Date? = nil , endTime: Date? = nil , q: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		eventsSearchOccurrencesRequestBuilder(page: page, perPage: perPage, placeId: placeId, userId: userId, latitude: latitude, longitude: longitude, distance: distance, startTime: startTime, endTime: endTime, q: q, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Seach for Event Occurrences
      Full text search of event occurrences.

Optionally, `latitude` and `longitude` can be given to return the list of
event occurrences starting from a particular location (location is retrieved
from place if the event is associated with a place). To bound the results
within a certain radius (in km) from the starting coordinates, add the
`distance` parameter. `q` can be given to search by event name.

	  - GET /events/search/occurrences.json
	  - Full text search of event occurrences.

Optionally, `latitude` and `longitude` can be given to return the list of
event occurrences starting from a particular location (location is retrieved
from place if the event is associated with a place). To bound the results
within a certain radius (in km) from the starting coordinates, add the
`distance` parameter. `q` can be given to search by event name.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
		- parameter  place_id: (query) Restrict search results to events located in the identified {@link Places}. (optional) 
		- parameter  user_id: (query) Restrict search results to events owned by the identified {@link Users}. (optional) 
		- parameter  latitude: (query) Latitude of the search starting point. (optional) 
		- parameter  longitude: (query) Longitude of the search starting point. (optional) 
		- parameter  distance: (query) Maximum distance in km from the starting point identified by
`longitude`, latitude`.
 (optional) 
		- parameter  start_time: (query) Only return events that start on or after `start_time`. (optional) 
		- parameter  end_time: (query) Only return events that end on or before `end_time`. (optional) 
		- parameter  q: (query) Space-separated list of keywords, used to perform full text search on event
name and tags.
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

	public class func eventsSearchOccurrencesRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,placeId: String? = nil,userId: String? = nil,latitude: Double? = nil,longitude: Double? = nil,distance: Double? = nil,startTime: Date? = nil,endTime: Date? = nil,q: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/events/search/occurrences.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"place_id": placeId as AnyObject, 
			"user_id": userId as AnyObject, 
			"latitude": latitude as AnyObject, 
			"longitude": longitude as AnyObject, 
			"distance": distance as AnyObject, 
			"start_time": startTime as AnyObject, 
			"end_time": endTime as AnyObject, 
			"q": q as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Show Event
      Show event(s) with the given IDs.

	  - parameter eventId: (query) ID of the event to delete.

Either `event_id` or `event_ids` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter eventIds: (query) Comma-separated list of event IDs to show. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the identified objects, but also some important data related
to the returning objects such as object's owner or referenced objects.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter showUserLike: (query) If set to **true** the Event object in the response will include `"current_user_liked: true"`
if the current user has liked the object. If the user has not liked the object, the 
`current_user_liked` field is not included in the response.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func eventsShow(eventId: String? = nil , eventIds: String? = nil , responseJsonDepth: Int32? = nil , showUserLike: Bool? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		eventsShowRequestBuilder(eventId: eventId, eventIds: eventIds, responseJsonDepth: responseJsonDepth, showUserLike: showUserLike, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show Event
      Show event(s) with the given IDs.

	  - GET /events/show.json
	  - Show event(s) with the given IDs.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  event_id: (query) ID of the event to delete.

Either `event_id` or `event_ids` must be specified.
 (optional) 
		- parameter  event_ids: (query) Comma-separated list of event IDs to show. (optional) 
		- parameter  response_json_depth: (query) Nested object depth level counts in response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the identified objects, but also some important data related
to the returning objects such as object's owner or referenced objects.

Default is 1, valid range is 1 to 8.
 (optional) 
		- parameter  show_user_like: (query) If set to **true** the Event object in the response will include `"current_user_liked: true"`
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

	public class func eventsShowRequestBuilder(eventId: String? = nil,eventIds: String? = nil,responseJsonDepth: Int32? = nil,showUserLike: Bool? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/events/show.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"event_id": eventId as AnyObject, 
			"event_ids": eventIds as AnyObject, 
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
	  Show Event Occurrences
      Show the event occurrences of an event with the given `event_id`.

	  - parameter eventId: (query) ID of the event to show occurrences of. 
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

	public class func eventsShowOccurrences(eventId: String , page: Int32? = nil , perPage: Int32? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		eventsShowOccurrencesRequestBuilder(eventId: eventId, page: page, perPage: perPage, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show Event Occurrences
      Show the event occurrences of an event with the given `event_id`.

	  - GET /events/show/occurrences.json
	  - Show the event occurrences of an event with the given `event_id`.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  event_id: (query) ID of the event to show occurrences of.  
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

	public class func eventsShowOccurrencesRequestBuilder(eventId: String,page: Int32? = nil,perPage: Int32? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/events/show/occurrences.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"event_id": eventId as AnyObject, 
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
      Update the event with the given `id`. Only the original submitter can update
the event.

For the event that is set as a recurring event, once created, there will be
several "event occurrences" created associating with the event object on
server side, one "event occurrence" represents a single occurrence of the
recurring event. An "event occurrence" contains start and end time of the
event's occurrence which are calulated according to the "recurring" settings
of the event object.

Instead of computing actual individual occurrences of a recurring event on the
client side, you can use event occurrences query API to get a list of
occurrences associated with a repeating event.

To get all "event occurrence" of an recurring event object, you can use
{@link Events#show_occurrences} with the event's `id`.

All the event occurrences will be recomputed if there is any change to the
start_time, duration and/or recurring.

An application admin can update any Event object.

	  - parameter eventId: (formData) ID of the event to update. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter name: (formData) Updated event name. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter startTime: (formData) Updated event start time. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter duration: (formData) Updated event duration, in seconds. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter recurring: (formData) New recurrance schedule. Can take the following values: "daily", "weekly", "monthly", or "yearly".
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter recurringCount: (formData) Updated number of occurrences for the event. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter recurringUntil: (formData) Updated date of last recurrance. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter details: (formData) Updated description of the event. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter placeId: (formData) ID of the place where this event takes place. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New photo to assign as the event's primary photo.

When you use `photo` parameter to attach a new photo, you can use it with
[custom resize and sync options](/docs/photosizes)

To remove primary photo, simply set "photo=" or "photo_id=". If the original
photo was created by using `photo` parameter, the photo will be deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of an existing photo to use as the event's primary photo.

To remove primary photo, simply set "photo=" or "photo_id=". If the original
photo was created by using `photo` parameter, the photo will be deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma-separated list of tags associated with this event. (optional)
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
	  - parameter suId: (formData) User to update the Event object on behalf of. The user must be the creator of the object.

The current user must be an application admin to update the Event object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func eventsUpdate(eventId: String , name: String? = nil , startTime: Date? = nil , duration: Int32? = nil , recurring: String? = nil , recurringCount: Int32? = nil , recurringUntil: String? = nil , details: String? = nil , placeId: String? = nil , photo: NSURL? = nil , photoId: String? = nil , tags: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		eventsUpdateRequestBuilder(eventId: eventId, name: name, startTime: startTime, duration: duration, recurring: recurring, recurringCount: recurringCount, recurringUntil: recurringUntil, details: details, placeId: placeId, photo: photo, photoId: photoId, tags: tags, customFields: customFields, aclName: aclName, aclId: aclId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Update the event with the given `id`. Only the original submitter can update
the event.

For the event that is set as a recurring event, once created, there will be
several "event occurrences" created associating with the event object on
server side, one "event occurrence" represents a single occurrence of the
recurring event. An "event occurrence" contains start and end time of the
event's occurrence which are calulated according to the "recurring" settings
of the event object.

Instead of computing actual individual occurrences of a recurring event on the
client side, you can use event occurrences query API to get a list of
occurrences associated with a repeating event.

To get all "event occurrence" of an recurring event object, you can use
{@link Events#show_occurrences} with the event's `id`.

All the event occurrences will be recomputed if there is any change to the
start_time, duration and/or recurring.

An application admin can update any Event object.

	  - PUT /events/update.json
	  - Update the event with the given `id`. Only the original submitter can update
the event.

For the event that is set as a recurring event, once created, there will be
several "event occurrences" created associating with the event object on
server side, one "event occurrence" represents a single occurrence of the
recurring event. An "event occurrence" contains start and end time of the
event's occurrence which are calulated according to the "recurring" settings
of the event object.

Instead of computing actual individual occurrences of a recurring event on the
client side, you can use event occurrences query API to get a list of
occurrences associated with a repeating event.

To get all "event occurrence" of an recurring event object, you can use
{@link Events#show_occurrences} with the event's `id`.

All the event occurrences will be recomputed if there is any change to the
start_time, duration and/or recurring.

An application admin can update any Event object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  event_id: (formData) ID of the event to update.  
		- parameter  name: (formData) Updated event name. (optional) 
		- parameter  start_time: (formData) Updated event start time. (optional) 
		- parameter  duration: (formData) Updated event duration, in seconds. (optional) 
		- parameter  recurring: (formData) New recurrance schedule. Can take the following values: "daily", "weekly", "monthly", or "yearly".
 (optional) 
		- parameter  recurring_count: (formData) Updated number of occurrences for the event. (optional) 
		- parameter  recurring_until: (formData) Updated date of last recurrance. (optional) 
		- parameter  details: (formData) Updated description of the event. (optional) 
		- parameter  place_id: (formData) ID of the place where this event takes place. (optional) 
		- parameter  photo: (formData) New photo to assign as the event's primary photo.

When you use `photo` parameter to attach a new photo, you can use it with
[custom resize and sync options](/docs/photosizes)

To remove primary photo, simply set "photo=" or "photo_id=". If the original
photo was created by using `photo` parameter, the photo will be deleted.
 (optional) 
		- parameter  photo_id: (formData) ID of an existing photo to use as the event's primary photo.

To remove primary photo, simply set "photo=" or "photo_id=". If the original
photo was created by using `photo` parameter, the photo will be deleted.
 (optional) 
		- parameter  tags: (formData) Comma-separated list of tags associated with this event. (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this checkin object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this checkin object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) User to update the Event object on behalf of. The user must be the creator of the object.

The current user must be an application admin to update the Event object on
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

	public class func eventsUpdateRequestBuilder(eventId: String,name: String? = nil,startTime: Date? = nil,duration: Int32? = nil,recurring: String? = nil,recurringCount: Int32? = nil,recurringUntil: String? = nil,details: String? = nil,placeId: String? = nil,photo: NSURL? = nil,photoId: String? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/events/update.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"event_id": eventId as AnyObject , 
		 	"name": name as AnyObject , 
		 	"start_time": startTime as AnyObject , 
		 	"duration": duration as AnyObject , 
		 	"recurring": recurring as AnyObject , 
		 	"recurring_count": recurringCount as AnyObject , 
		 	"recurring_until": recurringUntil as AnyObject , 
		 	"details": details as AnyObject , 
		 	"place_id": placeId as AnyObject , 
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
