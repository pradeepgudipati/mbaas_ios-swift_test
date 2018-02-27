// /Apis/LikesAPI.swift
 

import Foundation

public class LikesAPI: APIBase { 
	/**
	  Create Like
      Adds a "like" to an object. Currently, likes can only be associated with one of
the following object types, and a user can only like an object once:

*   {@link Posts}
*   {@link Photos}
*   {@link Users}
*   {@link Events}
*   {@link Checkins}
*   {@link Places}
*   {@link CustomObjects}
*   {@link Statuses}
*   {@link Reviews}

Once an object has one or more likes attached to it, it will return a
total like count with the object:

    "likes_count": 2

You should specify one, and only one, ArrowDB object ID parameter to identify the target object.

	  - parameter postId: (formData) Post object to like. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) Photo object to like. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter userId: (formData) User object to like. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter eventId: (formData) Event object to like. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter placeId: (formData) Place object to like. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter checkinId: (formData) Checkin object to like. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter statusId: (formData) Status object to like. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter reviewId: (formData) Review object to like. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customObjectId: (formData) Custom object to like. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func likesCreate(postId: String? = nil , photoId: String? = nil , userId: String? = nil , eventId: String? = nil , placeId: String? = nil , checkinId: String? = nil , statusId: String? = nil , reviewId: String? = nil , customObjectId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		likesCreateRequestBuilder(postId: postId, photoId: photoId, userId: userId, eventId: eventId, placeId: placeId, checkinId: checkinId, statusId: statusId, reviewId: reviewId, customObjectId: customObjectId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Create Like
      Adds a "like" to an object. Currently, likes can only be associated with one of
the following object types, and a user can only like an object once:

*   {@link Posts}
*   {@link Photos}
*   {@link Users}
*   {@link Events}
*   {@link Checkins}
*   {@link Places}
*   {@link CustomObjects}
*   {@link Statuses}
*   {@link Reviews}

Once an object has one or more likes attached to it, it will return a
total like count with the object:

    "likes_count": 2

You should specify one, and only one, ArrowDB object ID parameter to identify the target object.

	  - POST /likes/create.json
	  - Adds a "like" to an object. Currently, likes can only be associated with one of
the following object types, and a user can only like an object once:

*   {@link Posts}
*   {@link Photos}
*   {@link Users}
*   {@link Events}
*   {@link Checkins}
*   {@link Places}
*   {@link CustomObjects}
*   {@link Statuses}
*   {@link Reviews}

Once an object has one or more likes attached to it, it will return a
total like count with the object:

    "likes_count": 2

You should specify one, and only one, ArrowDB object ID parameter to identify the target object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  post_id: (formData) Post object to like. (optional) 
		- parameter  photo_id: (formData) Photo object to like. (optional) 
		- parameter  user_id: (formData) User object to like. (optional) 
		- parameter  event_id: (formData) Event object to like. (optional) 
		- parameter  place_id: (formData) Place object to like. (optional) 
		- parameter  checkin_id: (formData) Checkin object to like. (optional) 
		- parameter  status_id: (formData) Status object to like. (optional) 
		- parameter  review_id: (formData) Review object to like. (optional) 
		- parameter  custom_object_id: (formData) Custom object to like. (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func likesCreateRequestBuilder(postId: String? = nil,photoId: String? = nil,userId: String? = nil,eventId: String? = nil,placeId: String? = nil,checkinId: String? = nil,statusId: String? = nil,reviewId: String? = nil,customObjectId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/likes/create.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"post_id": postId as AnyObject , 
		 	"photo_id": photoId as AnyObject , 
		 	"user_id": userId as AnyObject , 
		 	"event_id": eventId as AnyObject , 
		 	"place_id": placeId as AnyObject , 
		 	"checkin_id": checkinId as AnyObject , 
		 	"status_id": statusId as AnyObject , 
		 	"review_id": reviewId as AnyObject , 
		 	"custom_object_id": customObjectId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Delete a Like
      Delete the like from the target object. Only the original submitter can delete
the like.

Specify one and only one of the ID parameters to identify  the target object.

	  - parameter postId: (formData) Post object to delete "like" from. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) Photo object to delete "like" from. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter userId: (formData) User object to delete "like" from. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter eventId: (formData) Event object to delete "like" from. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter placeId: (formData) Place object to delete "like" from. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter checkinId: (formData) Checkin object to delete "like" from. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter statusId: (formData) Status object to delete "like" from. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter reviewId: (formData) Review object to delete "like" from. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customObjectId: (formData) Custom object to delete "like" from. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func likesDelete(postId: String? = nil , photoId: String? = nil , userId: String? = nil , eventId: String? = nil , placeId: String? = nil , checkinId: String? = nil , statusId: String? = nil , reviewId: String? = nil , customObjectId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		likesDeleteRequestBuilder(postId: postId, photoId: photoId, userId: userId, eventId: eventId, placeId: placeId, checkinId: checkinId, statusId: statusId, reviewId: reviewId, customObjectId: customObjectId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete a Like
      Delete the like from the target object. Only the original submitter can delete
the like.

Specify one and only one of the ID parameters to identify  the target object.

	  - DELETE /likes/delete.json
	  - Delete the like from the target object. Only the original submitter can delete
the like.

Specify one and only one of the ID parameters to identify  the target object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  post_id: (formData) Post object to delete "like" from. (optional) 
		- parameter  photo_id: (formData) Photo object to delete "like" from. (optional) 
		- parameter  user_id: (formData) User object to delete "like" from. (optional) 
		- parameter  event_id: (formData) Event object to delete "like" from. (optional) 
		- parameter  place_id: (formData) Place object to delete "like" from. (optional) 
		- parameter  checkin_id: (formData) Checkin object to delete "like" from. (optional) 
		- parameter  status_id: (formData) Status object to delete "like" from. (optional) 
		- parameter  review_id: (formData) Review object to delete "like" from. (optional) 
		- parameter  custom_object_id: (formData) Custom object to delete "like" from. (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func likesDeleteRequestBuilder(postId: String? = nil,photoId: String? = nil,userId: String? = nil,eventId: String? = nil,placeId: String? = nil,checkinId: String? = nil,statusId: String? = nil,reviewId: String? = nil,customObjectId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/likes/delete.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"post_id": postId as AnyObject , 
		 	"photo_id": photoId as AnyObject , 
		 	"user_id": userId as AnyObject , 
		 	"event_id": eventId as AnyObject , 
		 	"place_id": placeId as AnyObject , 
		 	"checkin_id": checkinId as AnyObject , 
		 	"status_id": statusId as AnyObject , 
		 	"review_id": reviewId as AnyObject , 
		 	"custom_object_id": customObjectId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Custom Query of Likes
      Performs custom query of likes with sorting and paginating.

You can either query the likes of an object using the object's ID,
such as the `post_id`, `photo_id`, etc. parameter, or the likes generated by a user,
by specifying the `user_id` parameter.

A non-administrator user can only retrieve results on the likes they generated.

Application administrators can retrieve results on the likes of all users and
query likes generated by other users by specifying the `user_id` parameter.

In addition to custom fields, the following pre-defined fields can be used to
query and sort likes:

*   `su_id` : `String`. User ID of the User that generated the likes.
    Only an application admininstrator can query likes of other users.
*   `likeable_type` : `String`. Object type of the like object, which is the name of the object,
    such as `Post`, `Photo`, etc.
*   `likeable_id` : `String`. Object ID of the like object.
*   `created_at` : `Date`. Timestamp when the like was created.
*   `updated_at` : `Date`. Timestamp when the like was last updated.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - parameter postId: (query) Limit query to likes on the identified Post object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (query) Limit query to likes on the identified Photo object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter eventId: (query) Limit query to likes on the identified Event object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter placeId: (query) Limit query to likes on the identified Place object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter checkinId: (query) Limit query to likes on the identified Checkin object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter reviewId: (query) Limit query to likes on the identified Review object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customObjectId: (query) Limit query to likes on the identified Custom object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter userObjectId: (query) Limit query to likes on the identified User object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (query) Limit query to likes generated by the identified User.
Only an application administrator can query likes generated by other users.
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

	public class func likesQuery(postId: String? = nil , photoId: String? = nil , eventId: String? = nil , placeId: String? = nil , checkinId: String? = nil , reviewId: String? = nil , customObjectId: String? = nil , userObjectId: String? = nil , suId: String? = nil , page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		likesQueryRequestBuilder(postId: postId, photoId: photoId, eventId: eventId, placeId: placeId, checkinId: checkinId, reviewId: reviewId, customObjectId: customObjectId, userObjectId: userObjectId, suId: suId, page: page, perPage: perPage, limit: limit, skip: skip, where_: where_, order: order, sel: sel, unsel: unsel, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Custom Query of Likes
      Performs custom query of likes with sorting and paginating.

You can either query the likes of an object using the object's ID,
such as the `post_id`, `photo_id`, etc. parameter, or the likes generated by a user,
by specifying the `user_id` parameter.

A non-administrator user can only retrieve results on the likes they generated.

Application administrators can retrieve results on the likes of all users and
query likes generated by other users by specifying the `user_id` parameter.

In addition to custom fields, the following pre-defined fields can be used to
query and sort likes:

*   `su_id` : `String`. User ID of the User that generated the likes.
    Only an application admininstrator can query likes of other users.
*   `likeable_type` : `String`. Object type of the like object, which is the name of the object,
    such as `Post`, `Photo`, etc.
*   `likeable_id` : `String`. Object ID of the like object.
*   `created_at` : `Date`. Timestamp when the like was created.
*   `updated_at` : `Date`. Timestamp when the like was last updated.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /likes/query.json
	  - Performs custom query of likes with sorting and paginating.

You can either query the likes of an object using the object's ID,
such as the `post_id`, `photo_id`, etc. parameter, or the likes generated by a user,
by specifying the `user_id` parameter.

A non-administrator user can only retrieve results on the likes they generated.

Application administrators can retrieve results on the likes of all users and
query likes generated by other users by specifying the `user_id` parameter.

In addition to custom fields, the following pre-defined fields can be used to
query and sort likes:

*   `su_id` : `String`. User ID of the User that generated the likes.
    Only an application admininstrator can query likes of other users.
*   `likeable_type` : `String`. Object type of the like object, which is the name of the object,
    such as `Post`, `Photo`, etc.
*   `likeable_id` : `String`. Object ID of the like object.
*   `created_at` : `Date`. Timestamp when the like was created.
*   `updated_at` : `Date`. Timestamp when the like was last updated.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  post_id: (query) Limit query to likes on the identified Post object. (optional) 
		- parameter  photo_id: (query) Limit query to likes on the identified Photo object. (optional) 
		- parameter  event_id: (query) Limit query to likes on the identified Event object. (optional) 
		- parameter  place_id: (query) Limit query to likes on the identified Place object. (optional) 
		- parameter  checkin_id: (query) Limit query to likes on the identified Checkin object. (optional) 
		- parameter  review_id: (query) Limit query to likes on the identified Review object. (optional) 
		- parameter  custom_object_id: (query) Limit query to likes on the identified Custom object. (optional) 
		- parameter  user_object_id: (query) Limit query to likes on the identified User object. (optional) 
		- parameter  su_id: (query) Limit query to likes generated by the identified User.
Only an application administrator can query likes generated by other users.
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

	public class func likesQueryRequestBuilder(postId: String? = nil,photoId: String? = nil,eventId: String? = nil,placeId: String? = nil,checkinId: String? = nil,reviewId: String? = nil,customObjectId: String? = nil,userObjectId: String? = nil,suId: String? = nil,page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/likes/query.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"post_id": postId as AnyObject, 
			"photo_id": photoId as AnyObject, 
			"event_id": eventId as AnyObject, 
			"place_id": placeId as AnyObject, 
			"checkin_id": checkinId as AnyObject, 
			"review_id": reviewId as AnyObject, 
			"custom_object_id": customObjectId as AnyObject, 
			"user_object_id": userObjectId as AnyObject, 
			"su_id": suId as AnyObject, 
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
}//
