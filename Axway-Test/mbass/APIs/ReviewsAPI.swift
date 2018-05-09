// /Apis/ReviewsAPI.swift
 

import Foundation

public class ReviewsAPI: APIBase { 
	/**
	  Deletes multiple Reviews objects.
      Deletes Reviews objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Reviews objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.              

The reviewed object ({@link #post Post}, {@link #photo Photo}, {@link #user User}, {@link #event Event}, 
{@link #checkin Checkin}, {@link #place Place}, {@link #custom_object CustomObject}, 
{@link #status Status}, or {@link #review Review}) of each matched object is not deleted.

You must be an application admin to run this command.

	  - parameter where_: (formData) Encoded JSON object that specifies constraint values for Reviews objects to delete.
If not specified, all Reviews objects are deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func reviewsBatchDelete(where_: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		reviewsBatchDeleteRequestBuilder(where_: where_).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Deletes multiple Reviews objects.
      Deletes Reviews objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Reviews objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.              

The reviewed object ({@link #post Post}, {@link #photo Photo}, {@link #user User}, {@link #event Event}, 
{@link #checkin Checkin}, {@link #place Place}, {@link #custom_object CustomObject}, 
{@link #status Status}, or {@link #review Review}) of each matched object is not deleted.

You must be an application admin to run this command.

	  - DELETE /reviews/batch_delete.json
	  - Deletes Reviews objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Reviews objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.              

The reviewed object ({@link #post Post}, {@link #photo Photo}, {@link #user User}, {@link #event Event}, 
{@link #checkin Checkin}, {@link #place Place}, {@link #custom_object CustomObject}, 
{@link #status Status}, or {@link #review Review}) of each matched object is not deleted.

You must be an application admin to run this command.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  where: (formData) Encoded JSON object that specifies constraint values for Reviews objects to delete.
If not specified, all Reviews objects are deleted.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func reviewsBatchDeleteRequestBuilder(where_: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/reviews/batch_delete.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"where": where_ as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Retrieves the total number of Review objects.
      Retrieves the total number of Review objects.
	*/

	public class func reviewsCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		reviewsCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of Review objects.
      Retrieves the total number of Review objects.
	  - GET /reviews/count.json
	  - Retrieves the total number of Review objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func reviewsCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/reviews/count.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Create Review/Comment/Rating/Like
      Adds a review with an optional integer rating. You can also use this API to add
comments or likes.

Once an object has one or more reviews (comments) attached to it, it will
return a total review count, rating_count, average rating and a breakdown of
each rating value:

    "reviews_count": 2,
    "ratings_count": 2,
    "ratings_average": 150.0,
    "ratings_summary": {
      "100": 1,
      "200": 1
    },

To create a review, you must specify a target object using one of the `<object>_id` parameters, 
such as `photo_id` or `post_id`. Only one `<object>_id` parameter may be specified in a request.
To specify a {@link Users User} to review, use the the `user_object_id` parameter.

An application admin can create a review on behalf of another user by 
specifying that user's ID in the `user_id` method parameter. 

A review must include either `content` or `rating`. It can also include both.

	  - parameter postId: (formData) ID of the {@link Posts} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of the {@link Photos} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter userObjectId: (formData) ID of the {@link Users} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter eventId: (formData) ID of the {@link Events} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter placeId: (formData) ID of the {@link Places} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter checkinId: (formData) ID of the {@link Checkins} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter reviewId: (formData) ID of the {@link Reviews} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customObjectId: (formData) ID of the {@link CustomObjects} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter statusId: (formData) ID of the {@link Statuses} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter content: (formData) Review or comment text.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter rating: (formData) Rating to be associated with review. You can use "1" to represent one {@link Likes Like}. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter allowDuplicate: (formData) By default, the same user can only submit one review/comment per object.
Set this flag to `true` to allow the user to add multiple  reviews or comments to
the same object.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma separated list of tags for this review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) ID of the {@link Users} object to create the review on behalf of.

The currently logged-in user must be an application admin to create a review on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func reviewsCreate(postId: String? = nil , photoId: String? = nil , userObjectId: String? = nil , eventId: String? = nil , placeId: String? = nil , checkinId: String? = nil , reviewId: String? = nil , customObjectId: String? = nil , statusId: String? = nil , content: String? = nil , rating: String? = nil , allowDuplicate: Bool? = nil , tags: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		reviewsCreateRequestBuilder(postId: postId, photoId: photoId, userObjectId: userObjectId, eventId: eventId, placeId: placeId, checkinId: checkinId, reviewId: reviewId, customObjectId: customObjectId, statusId: statusId, content: content, rating: rating, allowDuplicate: allowDuplicate, tags: tags, customFields: customFields, aclName: aclName, aclId: aclId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Create Review/Comment/Rating/Like
      Adds a review with an optional integer rating. You can also use this API to add
comments or likes.

Once an object has one or more reviews (comments) attached to it, it will
return a total review count, rating_count, average rating and a breakdown of
each rating value:

    "reviews_count": 2,
    "ratings_count": 2,
    "ratings_average": 150.0,
    "ratings_summary": {
      "100": 1,
      "200": 1
    },

To create a review, you must specify a target object using one of the `<object>_id` parameters, 
such as `photo_id` or `post_id`. Only one `<object>_id` parameter may be specified in a request.
To specify a {@link Users User} to review, use the the `user_object_id` parameter.

An application admin can create a review on behalf of another user by 
specifying that user's ID in the `user_id` method parameter. 

A review must include either `content` or `rating`. It can also include both.

	  - POST /reviews/create.json
	  - Adds a review with an optional integer rating. You can also use this API to add
comments or likes.

Once an object has one or more reviews (comments) attached to it, it will
return a total review count, rating_count, average rating and a breakdown of
each rating value:

    "reviews_count": 2,
    "ratings_count": 2,
    "ratings_average": 150.0,
    "ratings_summary": {
      "100": 1,
      "200": 1
    },

To create a review, you must specify a target object using one of the `<object>_id` parameters, 
such as `photo_id` or `post_id`. Only one `<object>_id` parameter may be specified in a request.
To specify a {@link Users User} to review, use the the `user_object_id` parameter.

An application admin can create a review on behalf of another user by 
specifying that user's ID in the `user_id` method parameter. 

A review must include either `content` or `rating`. It can also include both.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  post_id: (formData) ID of the {@link Posts} object to review.
 (optional) 
		- parameter  photo_id: (formData) ID of the {@link Photos} object to review.
 (optional) 
		- parameter  user_object_id: (formData) ID of the {@link Users} object to review.
 (optional) 
		- parameter  event_id: (formData) ID of the {@link Events} object to review.
 (optional) 
		- parameter  place_id: (formData) ID of the {@link Places} object to review.
 (optional) 
		- parameter  checkin_id: (formData) ID of the {@link Checkins} object to review.
 (optional) 
		- parameter  review_id: (formData) ID of the {@link Reviews} object to review.
 (optional) 
		- parameter  custom_object_id: (formData) ID of the {@link CustomObjects} object to review.
 (optional) 
		- parameter  status_id: (formData) ID of the {@link Statuses} object to review.
 (optional) 
		- parameter  content: (formData) Review or comment text.
 (optional) 
		- parameter  rating: (formData) Rating to be associated with review. You can use "1" to represent one {@link Likes Like}. (optional) 
		- parameter  allow_duplicate: (formData) By default, the same user can only submit one review/comment per object.
Set this flag to `true` to allow the user to add multiple  reviews or comments to
the same object.
 (optional) 
		- parameter  tags: (formData) Comma separated list of tags for this review.
 (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) ID of the {@link Users} object to create the review on behalf of.

The currently logged-in user must be an application admin to create a review on
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

	public class func reviewsCreateRequestBuilder(postId: String? = nil,photoId: String? = nil,userObjectId: String? = nil,eventId: String? = nil,placeId: String? = nil,checkinId: String? = nil,reviewId: String? = nil,customObjectId: String? = nil,statusId: String? = nil,content: String? = nil,rating: String? = nil,allowDuplicate: Bool? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/reviews/create.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"post_id": postId as AnyObject , 
		 	"photo_id": photoId as AnyObject , 
		 	"user_object_id": userObjectId as AnyObject , 
		 	"event_id": eventId as AnyObject , 
		 	"place_id": placeId as AnyObject , 
		 	"checkin_id": checkinId as AnyObject , 
		 	"review_id": reviewId as AnyObject , 
		 	"custom_object_id": customObjectId as AnyObject , 
		 	"status_id": statusId as AnyObject , 
		 	"content": content as AnyObject , 
		 	"rating": rating as AnyObject , 
		 	"allow_duplicate": allowDuplicate as AnyObject , 
		 	"tags": tags as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
      Delete the review (comment) with the given `id`. Only the original submitter
can delete the review. If the review has a rating attached to
it, deleting the review will update the average rating and rating summary.

To delete a review, you must specify **both** the ID of the review and the ID of
the reviewed object ({@link #post Post}, {@link #photo Photo}, {@link #user User}, {@link #event Event}, 
{@link #checkin Checkin}, {@link #place Place}, {@link #custom_object CustomObject}, 
{@link #status Status}, or {@link #review Review}. The reviewed object is not deleted, however.

An application admin can delete any Review object.

	  - parameter reviewId: (formData) Review object to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func reviewsDelete(reviewId: String , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		reviewsDeleteRequestBuilder(reviewId: reviewId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Delete the review (comment) with the given `id`. Only the original submitter
can delete the review. If the review has a rating attached to
it, deleting the review will update the average rating and rating summary.

To delete a review, you must specify **both** the ID of the review and the ID of
the reviewed object ({@link #post Post}, {@link #photo Photo}, {@link #user User}, {@link #event Event}, 
{@link #checkin Checkin}, {@link #place Place}, {@link #custom_object CustomObject}, 
{@link #status Status}, or {@link #review Review}. The reviewed object is not deleted, however.

An application admin can delete any Review object.

	  - DELETE /reviews/delete.json
	  - Delete the review (comment) with the given `id`. Only the original submitter
can delete the review. If the review has a rating attached to
it, deleting the review will update the average rating and rating summary.

To delete a review, you must specify **both** the ID of the review and the ID of
the reviewed object ({@link #post Post}, {@link #photo Photo}, {@link #user User}, {@link #event Event}, 
{@link #checkin Checkin}, {@link #place Place}, {@link #custom_object CustomObject}, 
{@link #status Status}, or {@link #review Review}. The reviewed object is not deleted, however.

An application admin can delete any Review object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  review_id: (formData) Review object to delete.  
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func reviewsDeleteRequestBuilder(reviewId: String,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/reviews/delete.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"review_id": reviewId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Custom Query Reviews/Comments/Ratings/Likes
      Perform custom query of reviews with sorting and paginating. Currently you can
not query or sort data stored inside array or hash in custom fields.

The query must be limited to reviews of a given object (by specifying one of `post_id`,
`photo_id`, etc.) or limited to reviews generated by a given user (by specifying
`owner_id`.

In addition to custom fields, the following pre-defined fields can be used to
query and sort reviews:

*   `user_id` : `String`. Review owner's user ID.
*   `rating` : `Integer`. Rating assigned to this review.
*   `tags_array` : `String`. Tags associated with the review.
*   `created_at` : `Date`. Timestamp when the review was created.
*   `updated_at` : `Date`. Timestamp when the review was last updated.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).        

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - parameter postId: (query) Limit query to reviews on the identified Post object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (query) Limit query to reviews on the identified Photo object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter userId: (query) Limit query to reviews on the identified User object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter eventId: (query) Limit query to reviews on the identified Event object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter placeId: (query) Limit query to reviews on the identified Place object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter checkinId: (query) Limit query to reviews on the identified Checkin object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter reviewId: (query) Limit query to reviews on the identified Review object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customObjectId: (query) Limit query to reviews on the identified Custom object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter statusId: (query) Limit query to reviews on the identified Status object. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter ownerId: (query) Limit query results to reviews submitted by the identified  user. (optional)
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
	  - parameter showUserLike: (query) If set to **true**, each Review object in the response includes `"current_user_liked: true"`
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

	public class func reviewsQuery(postId: String? = nil , photoId: String? = nil , userId: String? = nil , eventId: String? = nil , placeId: String? = nil , checkinId: String? = nil , reviewId: String? = nil , customObjectId: String? = nil , statusId: String? = nil , ownerId: String? = nil , page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , showUserLike: Bool? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		reviewsQueryRequestBuilder(postId: postId, photoId: photoId, userId: userId, eventId: eventId, placeId: placeId, checkinId: checkinId, reviewId: reviewId, customObjectId: customObjectId, statusId: statusId, ownerId: ownerId, page: page, perPage: perPage, limit: limit, skip: skip, where_: where_, order: order, sel: sel, showUserLike: showUserLike, unsel: unsel, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Custom Query Reviews/Comments/Ratings/Likes
      Perform custom query of reviews with sorting and paginating. Currently you can
not query or sort data stored inside array or hash in custom fields.

The query must be limited to reviews of a given object (by specifying one of `post_id`,
`photo_id`, etc.) or limited to reviews generated by a given user (by specifying
`owner_id`.

In addition to custom fields, the following pre-defined fields can be used to
query and sort reviews:

*   `user_id` : `String`. Review owner's user ID.
*   `rating` : `Integer`. Rating assigned to this review.
*   `tags_array` : `String`. Tags associated with the review.
*   `created_at` : `Date`. Timestamp when the review was created.
*   `updated_at` : `Date`. Timestamp when the review was last updated.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).        

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /reviews/query.json
	  - Perform custom query of reviews with sorting and paginating. Currently you can
not query or sort data stored inside array or hash in custom fields.

The query must be limited to reviews of a given object (by specifying one of `post_id`,
`photo_id`, etc.) or limited to reviews generated by a given user (by specifying
`owner_id`.

In addition to custom fields, the following pre-defined fields can be used to
query and sort reviews:

*   `user_id` : `String`. Review owner's user ID.
*   `rating` : `Integer`. Rating assigned to this review.
*   `tags_array` : `String`. Tags associated with the review.
*   `created_at` : `Date`. Timestamp when the review was created.
*   `updated_at` : `Date`. Timestamp when the review was last updated.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).        

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  post_id: (query) Limit query to reviews on the identified Post object. (optional) 
		- parameter  photo_id: (query) Limit query to reviews on the identified Photo object. (optional) 
		- parameter  user_id: (query) Limit query to reviews on the identified User object. (optional) 
		- parameter  event_id: (query) Limit query to reviews on the identified Event object. (optional) 
		- parameter  place_id: (query) Limit query to reviews on the identified Place object. (optional) 
		- parameter  checkin_id: (query) Limit query to reviews on the identified Checkin object. (optional) 
		- parameter  review_id: (query) Limit query to reviews on the identified Review object. (optional) 
		- parameter  custom_object_id: (query) Limit query to reviews on the identified Custom object. (optional) 
		- parameter  status_id: (query) Limit query to reviews on the identified Status object. (optional) 
		- parameter  owner_id: (query) Limit query results to reviews submitted by the identified  user. (optional) 
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
		- parameter  show_user_like: (query) If set to **true**, each Review object in the response includes `"current_user_liked: true"`
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

	public class func reviewsQueryRequestBuilder(postId: String? = nil,photoId: String? = nil,userId: String? = nil,eventId: String? = nil,placeId: String? = nil,checkinId: String? = nil,reviewId: String? = nil,customObjectId: String? = nil,statusId: String? = nil,ownerId: String? = nil,page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,showUserLike: Bool? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/reviews/query.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"post_id": postId as AnyObject, 
			"photo_id": photoId as AnyObject, 
			"user_id": userId as AnyObject, 
			"event_id": eventId as AnyObject, 
			"place_id": placeId as AnyObject, 
			"checkin_id": checkinId as AnyObject, 
			"review_id": reviewId as AnyObject, 
			"custom_object_id": customObjectId as AnyObject, 
			"status_id": statusId as AnyObject, 
			"owner_id": ownerId as AnyObject, 
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
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Show a review
      Shows the review with the given `id`.

	  - parameter reviewId: (query) Review object to show. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter showUserLike: (query) If set to **true** the Review object in the response will include `"current_user_liked: true"`
if the current user has liked the object. If the user has not liked the object, the 
`current_user_liked` field is not included in the response.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
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

	public class func reviewsShow(reviewId: String , showUserLike: Bool? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		reviewsShowRequestBuilder(reviewId: reviewId, showUserLike: showUserLike, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show a review
      Shows the review with the given `id`.

	  - GET /reviews/show.json
	  - Shows the review with the given `id`.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  review_id: (query) Review object to show.  
		- parameter  show_user_like: (query) If set to **true** the Review object in the response will include `"current_user_liked: true"`
if the current user has liked the object. If the user has not liked the object, the 
`current_user_liked` field is not included in the response.
 (optional) 
		- parameter  response_json_depth: (query) Nested object depth level counts in response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
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

	public class func reviewsShowRequestBuilder(reviewId: String,showUserLike: Bool? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/reviews/show.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"review_id": reviewId as AnyObject, 
			"show_user_like": showUserLike as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Update a Review/Comment/Rating/Like
      Updates the review with the given `id`.

Ordinary users can update reviews they own or have update access to.

An application admin can update a Review on behalf of another user by 
specifying that user's ID in the `user_id` method parameter.

	  - parameter postId: (formData) ID of the {@link Posts} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of the {@link Photos} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter userObjectId: (formData) ID of the {@link Users} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter eventId: (formData) ID of the {@link Events} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter placeId: (formData) ID of the {@link Places} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter checkinId: (formData) ID of the {@link Checkins} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter reviewObjectId: (formData) ID of the {@link Reviews} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customObjectId: (formData) ID of the {@link CustomObjects} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter statusId: (formData) ID of the {@link Statuses} object to review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter reviewId: (formData) ID of the Review object to update. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter content: (formData) Review or comment text. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter rating: (formData) Rating to be associated with review. You can use "1" to represent one {@link Likes Like}. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) ID of the {@link Users} object to update the review on behalf of. The currently 
logged-in user must be an application admin to create a review on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter allowDuplicate: (formData) By default, the same user can only submit one review/comment per object.
Set this flag to `true` to allow the user to add multiple  reviews or comments to
the same object.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma separated list of tags for this review.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func reviewsUpdate(postId: String? = nil , photoId: String? = nil , userObjectId: String? = nil , eventId: String? = nil , placeId: String? = nil , checkinId: String? = nil , reviewObjectId: String? = nil , customObjectId: String? = nil , statusId: String? = nil , reviewId: String , content: String? = nil , rating: String? = nil , suId: String? = nil , allowDuplicate: Bool? = nil , tags: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		reviewsUpdateRequestBuilder(postId: postId, photoId: photoId, userObjectId: userObjectId, eventId: eventId, placeId: placeId, checkinId: checkinId, reviewObjectId: reviewObjectId, customObjectId: customObjectId, statusId: statusId, reviewId: reviewId, content: content, rating: rating, suId: suId, allowDuplicate: allowDuplicate, tags: tags, customFields: customFields, aclName: aclName, aclId: aclId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Update a Review/Comment/Rating/Like
      Updates the review with the given `id`.

Ordinary users can update reviews they own or have update access to.

An application admin can update a Review on behalf of another user by 
specifying that user's ID in the `user_id` method parameter.

	  - PUT /reviews/update.json
	  - Updates the review with the given `id`.

Ordinary users can update reviews they own or have update access to.

An application admin can update a Review on behalf of another user by 
specifying that user's ID in the `user_id` method parameter.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  post_id: (formData) ID of the {@link Posts} object to review.
 (optional) 
		- parameter  photo_id: (formData) ID of the {@link Photos} object to review.
 (optional) 
		- parameter  user_object_id: (formData) ID of the {@link Users} object to review.
 (optional) 
		- parameter  event_id: (formData) ID of the {@link Events} object to review.
 (optional) 
		- parameter  place_id: (formData) ID of the {@link Places} object to review.
 (optional) 
		- parameter  checkin_id: (formData) ID of the {@link Checkins} object to review.
 (optional) 
		- parameter  review_object_id: (formData) ID of the {@link Reviews} object to review.
 (optional) 
		- parameter  custom_object_id: (formData) ID of the {@link CustomObjects} object to review.
 (optional) 
		- parameter  status_id: (formData) ID of the {@link Statuses} object to review.
 (optional) 
		- parameter  review_id: (formData) ID of the Review object to update.  
		- parameter  content: (formData) Review or comment text. (optional) 
		- parameter  rating: (formData) Rating to be associated with review. You can use "1" to represent one {@link Likes Like}. (optional) 
		- parameter  su_id: (formData) ID of the {@link Users} object to update the review on behalf of. The currently 
logged-in user must be an application admin to create a review on
behalf of another user.
 (optional) 
		- parameter  allow_duplicate: (formData) By default, the same user can only submit one review/comment per object.
Set this flag to `true` to allow the user to add multiple  reviews or comments to
the same object.
 (optional) 
		- parameter  tags: (formData) Comma separated list of tags for this review.
 (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func reviewsUpdateRequestBuilder(postId: String? = nil,photoId: String? = nil,userObjectId: String? = nil,eventId: String? = nil,placeId: String? = nil,checkinId: String? = nil,reviewObjectId: String? = nil,customObjectId: String? = nil,statusId: String? = nil,reviewId: String,content: String? = nil,rating: String? = nil,suId: String? = nil,allowDuplicate: Bool? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/reviews/update.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"post_id": postId as AnyObject , 
		 	"photo_id": photoId as AnyObject , 
		 	"user_object_id": userObjectId as AnyObject , 
		 	"event_id": eventId as AnyObject , 
		 	"place_id": placeId as AnyObject , 
		 	"checkin_id": checkinId as AnyObject , 
		 	"review_object_id": reviewObjectId as AnyObject , 
		 	"custom_object_id": customObjectId as AnyObject , 
		 	"status_id": statusId as AnyObject , 
		 	"review_id": reviewId as AnyObject , 
		 	"content": content as AnyObject , 
		 	"rating": rating as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"allow_duplicate": allowDuplicate as AnyObject , 
		 	"tags": tags as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
