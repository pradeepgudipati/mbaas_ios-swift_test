// /Apis/PlacesAPI.swift
 

import Foundation

public class PlacesAPI: APIBase { 
	/**
	  Deletes multiple Places objects.
      Deletes Places objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Places objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.     

Any {@link #photo primary photos} associated with the matched objects are not deleted.

You must be an application admin to run this command.

	  - parameter where_: (formData) Encoded JSON object that specifies constraint values for Places objects to delete.
If not specified, all Places objects are deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func placesBatchDelete(where_: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		placesBatchDeleteRequestBuilder(where_: where_).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Deletes multiple Places objects.
      Deletes Places objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Places objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.     

Any {@link #photo primary photos} associated with the matched objects are not deleted.

You must be an application admin to run this command.

	  - DELETE /places/batch_delete.json
	  - Deletes Places objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Places objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.     

Any {@link #photo primary photos} associated with the matched objects are not deleted.

You must be an application admin to run this command.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  where: (formData) Encoded JSON object that specifies constraint values for Places objects to delete.
If not specified, all Places objects are deleted.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func placesBatchDeleteRequestBuilder(where_: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/places/batch_delete.json"
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
	  Retrieves the total number of Place objects.
      Retrieves the total number of Place objects.
	*/

	public class func placesCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		placesCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of Place objects.
      Retrieves the total number of Place objects.
	  - GET /places/count.json
	  - Retrieves the total number of Place objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func placesCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/places/count.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Create a Place
      Creates a new place object.

To create a place, you must specify at least one of the following:
address, city, state, postal_code, country, or geographical coordinates (longitude and latitude).

	  - parameter name: (formData) Place name. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter address: (formData) Address. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter city: (formData) City. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter state: (formData) State. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter postalCode: (formData) Postal or ZIP code. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter country: (formData) Country. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter latitude: (formData) Latitude. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter longitude: (formData) Longitude. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter website: (formData) Website URL. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter twitter: (formData) Twitter ID. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter phoneNumber: (formData) Phone number. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New photo to attach as the primary photo for this place.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of an existing photo to attach as the primary photo for this place.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma separated list of tags for this place.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this place object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this place object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to create this place on behalf of.

The current login user must be an application admin to create a place on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func placesCreate(name: String , address: String? = nil , city: String? = nil , state: String? = nil , postalCode: String? = nil , country: String? = nil , latitude: Double? = nil , longitude: Double? = nil , website: String? = nil , twitter: String? = nil , phoneNumber: String? = nil , photo: NSURL? = nil , photoId: String? = nil , tags: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		placesCreateRequestBuilder(name: name, address: address, city: city, state: state, postalCode: postalCode, country: country, latitude: latitude, longitude: longitude, website: website, twitter: twitter, phoneNumber: phoneNumber, photo: photo, photoId: photoId, tags: tags, customFields: customFields, aclName: aclName, aclId: aclId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Create a Place
      Creates a new place object.

To create a place, you must specify at least one of the following:
address, city, state, postal_code, country, or geographical coordinates (longitude and latitude).

	  - POST /places/create.json
	  - Creates a new place object.

To create a place, you must specify at least one of the following:
address, city, state, postal_code, country, or geographical coordinates (longitude and latitude).

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) Place name.  
		- parameter  address: (formData) Address. (optional) 
		- parameter  city: (formData) City. (optional) 
		- parameter  state: (formData) State. (optional) 
		- parameter  postal_code: (formData) Postal or ZIP code. (optional) 
		- parameter  country: (formData) Country. (optional) 
		- parameter  latitude: (formData) Latitude. (optional) 
		- parameter  longitude: (formData) Longitude. (optional) 
		- parameter  website: (formData) Website URL. (optional) 
		- parameter  twitter: (formData) Twitter ID. (optional) 
		- parameter  phone_number: (formData) Phone number. (optional) 
		- parameter  photo: (formData) New photo to attach as the primary photo for this place.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional) 
		- parameter  photo_id: (formData) ID of an existing photo to attach as the primary photo for this place.
 (optional) 
		- parameter  tags: (formData) Comma separated list of tags for this place.
 (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this place object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this place object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) User ID to create this place on behalf of.

The current login user must be an application admin to create a place on
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

	public class func placesCreateRequestBuilder(name: String,address: String? = nil,city: String? = nil,state: String? = nil,postalCode: String? = nil,country: String? = nil,latitude: Double? = nil,longitude: Double? = nil,website: String? = nil,twitter: String? = nil,phoneNumber: String? = nil,photo: NSURL? = nil,photoId: String? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/places/create.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"name": name as AnyObject , 
		 	"address": address as AnyObject , 
		 	"city": city as AnyObject , 
		 	"state": state as AnyObject , 
		 	"postal_code": postalCode as AnyObject , 
		 	"country": country as AnyObject , 
		 	"latitude": latitude as AnyObject , 
		 	"longitude": longitude as AnyObject , 
		 	"website": website as AnyObject , 
		 	"twitter": twitter as AnyObject , 
		 	"phone_number": phoneNumber as AnyObject , 
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
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Delete a Place
      Deletes a place.

Only the user who created the place can delete it.

The {@link #photo primary photo} associated with the object is not deleted.

An application admin can delete any Place object.

	  - parameter placeId: (formData) ID of the place to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to delete the Place object on behalf of. The user must be the creator of the object.

The current login user must be an application admin to delete a Place object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func placesDelete(placeId: String , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		placesDeleteRequestBuilder(placeId: placeId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete a Place
      Deletes a place.

Only the user who created the place can delete it.

The {@link #photo primary photo} associated with the object is not deleted.

An application admin can delete any Place object.

	  - DELETE /places/delete.json
	  - Deletes a place.

Only the user who created the place can delete it.

The {@link #photo primary photo} associated with the object is not deleted.

An application admin can delete any Place object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  place_id: (formData) ID of the place to delete.  
		- parameter  su_id: (formData) User ID to delete the Place object on behalf of. The user must be the creator of the object.

The current login user must be an application admin to delete a Place object on
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

	public class func placesDeleteRequestBuilder(placeId: String,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/places/delete.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"place_id": placeId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Custom Query Places
      Performs custom query of places with sorting and paginating. Currently you can
not query or sort data stored inside array or hash in custom fields.

The following fields can be used for querying and sorting places:

*   `address` : String.  Place address.
*   `city` : String.  Place city.
*   `state` : String. Place state.
*   `country` : String.  Country.
*   `user_id` : String. ID of the user who created this place.
*   `google_cid` : Google Customer ID (CID) associated with this place.
*   `tags_array` : String. Search tags.
*   `lnglat` : `[longitude, latitude]`. The Place's default coordinates. You can also store
     custom coordinates in a custom field and query for those coordinates separately 
     (see [Geographic Coordinates in Custom Fields](#!/guide/customfields-section-geographic-coordinates-in-custom-fields)).
*   `ratings_average:  Number`.  Place's average rating (see {@link Reviews}).
*   `ratings_count: Number`. Place's total number of ratings (see {@link Reviews}).
*   `reviews_count: Number`. Place's total number of reviews (see {@link Reviews}).
*   `created_at: Date`. Timestamp when the photo was created.
*   `updated_at: Date`. Timestamp when the photo was updated.

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
	  - parameter showUserLike: (query) If set to **true**, each Place object in the response includes `"current_user_liked: true"`
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

	public class func placesQuery(page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , showUserLike: Bool? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		placesQueryRequestBuilder(page: page, perPage: perPage, limit: limit, skip: skip, where_: where_, order: order, sel: sel, showUserLike: showUserLike, unsel: unsel, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Custom Query Places
      Performs custom query of places with sorting and paginating. Currently you can
not query or sort data stored inside array or hash in custom fields.

The following fields can be used for querying and sorting places:

*   `address` : String.  Place address.
*   `city` : String.  Place city.
*   `state` : String. Place state.
*   `country` : String.  Country.
*   `user_id` : String. ID of the user who created this place.
*   `google_cid` : Google Customer ID (CID) associated with this place.
*   `tags_array` : String. Search tags.
*   `lnglat` : `[longitude, latitude]`. The Place's default coordinates. You can also store
     custom coordinates in a custom field and query for those coordinates separately 
     (see [Geographic Coordinates in Custom Fields](#!/guide/customfields-section-geographic-coordinates-in-custom-fields)).
*   `ratings_average:  Number`.  Place's average rating (see {@link Reviews}).
*   `ratings_count: Number`. Place's total number of ratings (see {@link Reviews}).
*   `reviews_count: Number`. Place's total number of reviews (see {@link Reviews}).
*   `created_at: Date`. Timestamp when the photo was created.
*   `updated_at: Date`. Timestamp when the photo was updated.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /places/query.json
	  - Performs custom query of places with sorting and paginating. Currently you can
not query or sort data stored inside array or hash in custom fields.

The following fields can be used for querying and sorting places:

*   `address` : String.  Place address.
*   `city` : String.  Place city.
*   `state` : String. Place state.
*   `country` : String.  Country.
*   `user_id` : String. ID of the user who created this place.
*   `google_cid` : Google Customer ID (CID) associated with this place.
*   `tags_array` : String. Search tags.
*   `lnglat` : `[longitude, latitude]`. The Place's default coordinates. You can also store
     custom coordinates in a custom field and query for those coordinates separately 
     (see [Geographic Coordinates in Custom Fields](#!/guide/customfields-section-geographic-coordinates-in-custom-fields)).
*   `ratings_average:  Number`.  Place's average rating (see {@link Reviews}).
*   `ratings_count: Number`. Place's total number of ratings (see {@link Reviews}).
*   `reviews_count: Number`. Place's total number of reviews (see {@link Reviews}).
*   `created_at: Date`. Timestamp when the photo was created.
*   `updated_at: Date`. Timestamp when the photo was updated.

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
		- parameter  show_user_like: (query) If set to **true**, each Place object in the response includes `"current_user_liked: true"`
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

	public class func placesQueryRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,showUserLike: Bool? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/places/query.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
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
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Search Places
      Returns the list of places that have been added to the app, sorted by search
relevancy.

Optionally, `latitude` and `longitude` can be given to return the list of
places starting from a particular location. To bound the results within a
certain radius (in km) from the starting coordinates, add the `distance`
parameter. `q` can be given to search by place name.

If you have provided a starting latitude and longitude for place search, each
result will return a distance to the starting point in km.

	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in the response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects, such as owners and
referenced objects.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter latitude: (query) Latitude to center search on. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter longitude: (query) Longitude to center search on. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter distance: (query) Distance in km to search from the identified center point. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter q: (query) Space-separated list of keywords used to perform full text search on place name and tags. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func placesSearch(page: Int32? = nil , perPage: Int32? = nil , responseJsonDepth: Int32? = nil , latitude: Double? = nil , longitude: Double? = nil , distance: Double? = nil , q: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		placesSearchRequestBuilder(page: page, perPage: perPage, responseJsonDepth: responseJsonDepth, latitude: latitude, longitude: longitude, distance: distance, q: q, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Search Places
      Returns the list of places that have been added to the app, sorted by search
relevancy.

Optionally, `latitude` and `longitude` can be given to return the list of
places starting from a particular location. To bound the results within a
certain radius (in km) from the starting coordinates, add the `distance`
parameter. `q` can be given to search by place name.

If you have provided a starting latitude and longitude for place search, each
result will return a distance to the starting point in km.

	  - GET /places/search.json
	  - Returns the list of places that have been added to the app, sorted by search
relevancy.

Optionally, `latitude` and `longitude` can be given to return the list of
places starting from a particular location. To bound the results within a
certain radius (in km) from the starting coordinates, add the `distance`
parameter. `q` can be given to search by place name.

If you have provided a starting latitude and longitude for place search, each
result will return a distance to the starting point in km.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
		- parameter  response_json_depth: (query) Nested object depth level counts in the response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects, such as owners and
referenced objects.

Default is 1, valid range is 1 to 8.
 (optional) 
		- parameter  latitude: (query) Latitude to center search on. (optional) 
		- parameter  longitude: (query) Longitude to center search on. (optional) 
		- parameter  distance: (query) Distance in km to search from the identified center point. (optional) 
		- parameter  q: (query) Space-separated list of keywords used to perform full text search on place name and tags. (optional) 
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func placesSearchRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,responseJsonDepth: Int32? = nil,latitude: Double? = nil,longitude: Double? = nil,distance: Double? = nil,q: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/places/search.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"latitude": latitude as AnyObject, 
			"longitude": longitude as AnyObject, 
			"distance": distance as AnyObject, 
			"q": q as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Show a Place
      Returns information for the identified place.
	  - parameter placeId: (query) ID of the place to show. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in the response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the identified object, but also
some important data related to the returned objects, such as owners and
referenced objects.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter showUserLike: (query) If set to **true** the Place object in the response will include `"current_user_liked: true"`
if the current user has liked the object. If the user has not liked the object, the 
`current_user_liked` field is not included in the response.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func placesShow(placeId: String , responseJsonDepth: Int32? = nil , showUserLike: Bool? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		placesShowRequestBuilder(placeId: placeId, responseJsonDepth: responseJsonDepth, showUserLike: showUserLike, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show a Place
      Returns information for the identified place.
	  - GET /places/show.json
	  - Returns information for the identified place.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  place_id: (query) ID of the place to show.  
		- parameter  response_json_depth: (query) Nested object depth level counts in the response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the identified object, but also
some important data related to the returned objects, such as owners and
referenced objects.

Default is 1, valid range is 1 to 8.
 (optional) 
		- parameter  show_user_like: (query) If set to **true** the Place object in the response will include `"current_user_liked: true"`
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

	public class func placesShowRequestBuilder(placeId: String,responseJsonDepth: Int32? = nil,showUserLike: Bool? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/places/show.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"place_id": placeId as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"show_user_like": showUserLike as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Update a Place
      Any of the parameters used to {@link Places#create Create a Place} can
be used to update it as well. Only the user that created the place can update
it.

An application admin can update any place object.

	  - parameter placeId: (formData) ID of the place to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter name: (formData) Place name. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter address: (formData) Address. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter city: (formData) City. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter state: (formData) State. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter postalCode: (formData) Postal or ZIP code. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter country: (formData) Country. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter latitude: (formData) Latitude. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter longitude: (formData) Longitude. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter website: (formData) Website URL. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter twitter: (formData) Twitter ID. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter phoneNumber: (formData) Phone number. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New photo to attach as the primary photo for this place.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of an existing photo to attach as the primary photo for this place.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma separated list of tags for this place.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this place object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this place object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter userId: (formData) User ID to assign as the owner of the place object. The current user must have write
access to the object in order to update the owner.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to update the Place object on behalf of. The user must be the creator of the object.

The current login user must be an application admin to update a Place object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func placesUpdate(placeId: String , name: String? = nil , address: String? = nil , city: String? = nil , state: String? = nil , postalCode: String? = nil , country: String? = nil , latitude: Double? = nil , longitude: Double? = nil , website: String? = nil , twitter: String? = nil , phoneNumber: String? = nil , photo: NSURL? = nil , photoId: String? = nil , tags: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , userId: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		placesUpdateRequestBuilder(placeId: placeId, name: name, address: address, city: city, state: state, postalCode: postalCode, country: country, latitude: latitude, longitude: longitude, website: website, twitter: twitter, phoneNumber: phoneNumber, photo: photo, photoId: photoId, tags: tags, customFields: customFields, aclName: aclName, aclId: aclId, userId: userId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Update a Place
      Any of the parameters used to {@link Places#create Create a Place} can
be used to update it as well. Only the user that created the place can update
it.

An application admin can update any place object.

	  - PUT /places/update.json
	  - Any of the parameters used to {@link Places#create Create a Place} can
be used to update it as well. Only the user that created the place can update
it.

An application admin can update any place object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  place_id: (formData) ID of the place to delete.  
		- parameter  name: (formData) Place name. (optional) 
		- parameter  address: (formData) Address. (optional) 
		- parameter  city: (formData) City. (optional) 
		- parameter  state: (formData) State. (optional) 
		- parameter  postal_code: (formData) Postal or ZIP code. (optional) 
		- parameter  country: (formData) Country. (optional) 
		- parameter  latitude: (formData) Latitude. (optional) 
		- parameter  longitude: (formData) Longitude. (optional) 
		- parameter  website: (formData) Website URL. (optional) 
		- parameter  twitter: (formData) Twitter ID. (optional) 
		- parameter  phone_number: (formData) Phone number. (optional) 
		- parameter  photo: (formData) New photo to attach as the primary photo for this place.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional) 
		- parameter  photo_id: (formData) ID of an existing photo to attach as the primary photo for this place.
 (optional) 
		- parameter  tags: (formData) Comma separated list of tags for this place.
 (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this place object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this place object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  user_id: (formData) User ID to assign as the owner of the place object. The current user must have write
access to the object in order to update the owner.
 (optional) 
		- parameter  su_id: (formData) User ID to update the Place object on behalf of. The user must be the creator of the object.

The current login user must be an application admin to update a Place object on
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

	public class func placesUpdateRequestBuilder(placeId: String,name: String? = nil,address: String? = nil,city: String? = nil,state: String? = nil,postalCode: String? = nil,country: String? = nil,latitude: Double? = nil,longitude: Double? = nil,website: String? = nil,twitter: String? = nil,phoneNumber: String? = nil,photo: NSURL? = nil,photoId: String? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,userId: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/places/update.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"place_id": placeId as AnyObject , 
		 	"name": name as AnyObject , 
		 	"address": address as AnyObject , 
		 	"city": city as AnyObject , 
		 	"state": state as AnyObject , 
		 	"postal_code": postalCode as AnyObject , 
		 	"country": country as AnyObject , 
		 	"latitude": latitude as AnyObject , 
		 	"longitude": longitude as AnyObject , 
		 	"website": website as AnyObject , 
		 	"twitter": twitter as AnyObject , 
		 	"phone_number": phoneNumber as AnyObject , 
		 	"photo": photo as AnyObject , 
		 	"photo_id": photoId as AnyObject , 
		 	"tags": tags as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"user_id": userId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
