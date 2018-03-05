// /Apis/CustomObjectsAPI.swift
 

import Foundation

public class CustomObjectsAPI: APIBase { 
	/**
	  Drops a CustomObjects collection.
      Drops a CustomObjects collection of a specified type. The collection is dropped
asynchronously in a separate process.

You must be an application admin to run this command.

	  - parameter classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func customObjectsAdminDropCollection(classname: String ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		customObjectsAdminDropCollectionRequestBuilder(classname: classname).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Drops a CustomObjects collection.
      Drops a CustomObjects collection of a specified type. The collection is dropped
asynchronously in a separate process.

You must be an application admin to run this command.

	  - DELETE /objects/{classname}/admin_drop_collection.json
	  - Drops a CustomObjects collection of a specified type. The collection is dropped
asynchronously in a separate process.

You must be an application admin to run this command.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func customObjectsAdminDropCollectionRequestBuilder(classname: String) -> RequestBuilder<[String:Any]> { 
		var path = "/objects/{classname}/admin_drop_collection.json"
		path = path.replacingOccurrences(of: "{classname}", with: "\(classname)", options: String.CompareOptions.literal, range: nil)
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Create multiple custom objects
      Creates up to 100 custom objects.  The current user must be an application admin to use this API.

If there is an error inserting one of the objects, the response payload will return a 200 code, the
number of objects created, and the error for creating the first object that failed. The HTTP
response will be 202.

The `classname` of the object is part of the URL. You do not have to define
`classname` ahead of time. It will be created on the fly.

	  - parameter classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter jsonArray: (formData) Array of JSON-encoded objects to create. You may specify up to 100 objects.
You do not have to define fields ahead of time,
simply set key-value pairs of the fields. Since the data must be encoded as
JSON, keys must not contain the dot character.

You may pass the following predefined fields: `acl_id`, `photo_id` and `user_id`, to
attach an ACL, Photo, or User object, respectively. Note that ArrowDB will not check if
the ID exists.

    json_array = [
        {
            custom_field: 'red',
            acl_id: '1234567890abcdef',
            photo_id: '0987654321fedcba',
            user_id: 'ab12cd34ef098765'
        }
    ]

The `tags` field is not supported for the batch create operations.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func customObjectsBatchCreate(classname: String , jsonArray: String , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		customObjectsBatchCreateRequestBuilder(classname: classname, jsonArray: jsonArray, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Create multiple custom objects
      Creates up to 100 custom objects.  The current user must be an application admin to use this API.

If there is an error inserting one of the objects, the response payload will return a 200 code, the
number of objects created, and the error for creating the first object that failed. The HTTP
response will be 202.

The `classname` of the object is part of the URL. You do not have to define
`classname` ahead of time. It will be created on the fly.

	  - POST /objects/{classname}/batch_create.json
	  - Creates up to 100 custom objects.  The current user must be an application admin to use this API.

If there is an error inserting one of the objects, the response payload will return a 200 code, the
number of objects created, and the error for creating the first object that failed. The HTTP
response will be 202.

The `classname` of the object is part of the URL. You do not have to define
`classname` ahead of time. It will be created on the fly.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
  
		- parameter  json_array: (formData) Array of JSON-encoded objects to create. You may specify up to 100 objects.
You do not have to define fields ahead of time,
simply set key-value pairs of the fields. Since the data must be encoded as
JSON, keys must not contain the dot character.

You may pass the following predefined fields: `acl_id`, `photo_id` and `user_id`, to
attach an ACL, Photo, or User object, respectively. Note that ArrowDB will not check if
the ID exists.

    json_array = [
        {
            custom_field: 'red',
            acl_id: '1234567890abcdef',
            photo_id: '0987654321fedcba',
            user_id: 'ab12cd34ef098765'
        }
    ]

The `tags` field is not supported for the batch create operations.
  
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func customObjectsBatchCreateRequestBuilder(classname: String,jsonArray: String,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		var path = "/objects/{classname}/batch_create.json"
		path = path.replacingOccurrences(of: "{classname}", with: "\(classname)", options: String.CompareOptions.literal, range: nil)
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"json_array": jsonArray as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Deletes multiple CustomObject objects.
      Deletes CustomObjects objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all CustomObject objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.  

The matched objects are deleted asynchronously in a separate process. 

The {@link #photo primary photos} associated with the matched objects are not deleted. 

You must be an application admin to run this command.

	  - parameter where_: (formData) Encoded JSON object that specifies constraint values for CustomObjects objects to delete.
If not specified, all CustomObjects objects are deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func customObjectsBatchDelete(classname: String , where_: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		customObjectsBatchDeleteRequestBuilder(classname: classname, where_: where_).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Deletes multiple CustomObject objects.
      Deletes CustomObjects objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all CustomObject objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.  

The matched objects are deleted asynchronously in a separate process. 

The {@link #photo primary photos} associated with the matched objects are not deleted. 

You must be an application admin to run this command.

	  - DELETE /objects/{classname}/batch_delete.json
	  - Deletes CustomObjects objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all CustomObject objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.  

The matched objects are deleted asynchronously in a separate process. 

The {@link #photo primary photos} associated with the matched objects are not deleted. 

You must be an application admin to run this command.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  where: (formData) Encoded JSON object that specifies constraint values for CustomObjects objects to delete.
If not specified, all CustomObjects objects are deleted.
 (optional) 
		- parameter  classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func customObjectsBatchDeleteRequestBuilder(classname: String,where_: String? = nil) -> RequestBuilder<[String:Any]> { 
		var path = "/objects/{classname}/batch_delete.json"
		path = path.replacingOccurrences(of: "{classname}", with: "\(classname)", options: String.CompareOptions.literal, range: nil)
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
	  Retrieves the total number of objects of the specified class.
      Retrieves the total number of objects of the specified class.
	  - parameter classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func customObjectsCount(classname: String ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		customObjectsCountRequestBuilder(classname: classname).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of objects of the specified class.
      Retrieves the total number of objects of the specified class.
	  - GET /objects/{classname}/count.json
	  - Retrieves the total number of objects of the specified class.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func customObjectsCountRequestBuilder(classname: String) -> RequestBuilder<[String:Any]> { 
		var path = "/objects/{classname}/count.json"
		path = path.replacingOccurrences(of: "{classname}", with: "\(classname)", options: String.CompareOptions.literal, range: nil)
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Create Custom Object
      Create a custom object of type `classname`.

The `classname` of the object is part of the URL. You do not have to define
`classname` ahead of time. It will be created on the fly

	  - parameter classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter fields: (formData) JSON encoding of object fields. You don't have to define fields ahead of time,
simply set key-value pairs of the fields. Since the data must be encoded as
JSON, keys must not contain the dot character.

For instance, if you want to define a car object:

    {
       "make": "nissan",
       "color": "blue",
       "year": 2005,
       "purchased_at": "2011-11-02 17:07:37 -0700",
       "used": false
    }

See the main description for {@link CustomObjects} for more information on
fields.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma-separated list of tags associated with this object.

If the `tags` parameter is omitted and a `tags` key is included in the
`fields` dictionary, `fields.tags` will be used instead.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New photo to attach as the primary photo for the object.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of an existing photo to attach as the primary photo for the object.
 (optional)
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
	  - parameter suId: (formData) User ID to create the object on behalf of.

The current login user must be an application admin to create an object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func customObjectsCreate(classname: String , fields: String , prettyJson: Bool? = nil , tags: String? = nil , photo: NSURL? = nil , photoId: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		customObjectsCreateRequestBuilder(classname: classname, fields: fields, prettyJson: prettyJson, tags: tags, photo: photo, photoId: photoId, aclName: aclName, aclId: aclId, suId: suId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Create Custom Object
      Create a custom object of type `classname`.

The `classname` of the object is part of the URL. You do not have to define
`classname` ahead of time. It will be created on the fly

	  - POST /objects/{classname}/create.json
	  - Create a custom object of type `classname`.

The `classname` of the object is part of the URL. You do not have to define
`classname` ahead of time. It will be created on the fly

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
  
		- parameter  fields: (formData) JSON encoding of object fields. You don't have to define fields ahead of time,
simply set key-value pairs of the fields. Since the data must be encoded as
JSON, keys must not contain the dot character.

For instance, if you want to define a car object:

    {
       "make": "nissan",
       "color": "blue",
       "year": 2005,
       "purchased_at": "2011-11-02 17:07:37 -0700",
       "used": false
    }

See the main description for {@link CustomObjects} for more information on
fields.
  
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  tags: (formData) Comma-separated list of tags associated with this object.

If the `tags` parameter is omitted and a `tags` key is included in the
`fields` dictionary, `fields.tags` will be used instead.
 (optional) 
		- parameter  photo: (formData) New photo to attach as the primary photo for the object.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional) 
		- parameter  photo_id: (formData) ID of an existing photo to attach as the primary photo for the object.
 (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this checkin object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this checkin object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) User ID to create the object on behalf of.

The current login user must be an application admin to create an object on
behalf of another user.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func customObjectsCreateRequestBuilder(classname: String,fields: String,prettyJson: Bool? = nil,tags: String? = nil,photo: NSURL? = nil,photoId: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil) -> RequestBuilder<[String:Any]> { 
		var path = "/objects/{classname}/create.json"
		path = path.replacingOccurrences(of: "{classname}", with: "\(classname)", options: String.CompareOptions.literal, range: nil)
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"fields": fields as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject , 
		 	"tags": tags as AnyObject , 
		 	"photo": photo as AnyObject , 
		 	"photo_id": photoId as AnyObject , 
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
	  Query Custom Objects
      Query custom object by specified fields with sorting and paginating. 

**Notes**:

* If a custom object contains fields or values that are greater than 1KB in length, you will
not be able to query on that field. For more information, see [Indexing Size Limit for Custom Objects and Fields](#!/guide/customfields-section-indexing-size-limit-for-custom-objects-and-fields).
* Currently, you cannot query or sort data stored inside an array or hash.
* You can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - parameter classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
 
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
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter showUserLike: (query) If set to **true**, each CustomObject in the response includes `"current_user_liked: true"`
 if the current user has liked the object. If the current user has not liked the object, the 
`current_user_liked` field is not included in the response.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter where_: (query) Constraint values for fields. `where` should be encoded JSON.

Each value in the search query needs to be less that 1024 bytes.
If the value is larger than 1024 bytes, the query does not return any results.

In addition to developer created fields, custom objects include
four predefined fields that can be queried as well:

*   `user_id: String`.  Object owner's user ID.

*   `tags_array: String`. List of tags.

*   `created_at: Date`. Timestamp when the object was created.

*   `updated_at: Date`. Timestamp when the object was updated.

If `where` is not specified, `query` returns all objects.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter order: (query) Sort results by one or more fields, specified as a comma-separated list of
field names.
See the [Search and Query guide](#!/guide/search_query) for more information.

Fields with a Hash data type cannot be sorted. Custom objects include
two predefined sortable fields:

    `created_at: Date` - Timestamp when the object was created.
    `updated_at: Date` - Timestamp when the object was last updated.

For example, if you want to query cars and sort them by `make` and
`created_at`:

    "order": "make,created_at"

To reverse the sorting order, simply add `-` in front of a field. For example,
to sort results by `make` in ascending order then by `created_at` in descending
order:

    "order": "make,-created_at"
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

	public class func customObjectsQuery(classname: String , page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , prettyJson: Bool? = nil , showUserLike: Bool? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		customObjectsQueryRequestBuilder(classname: classname, page: page, perPage: perPage, limit: limit, skip: skip, prettyJson: prettyJson, showUserLike: showUserLike, where_: where_, order: order, sel: sel, unsel: unsel, responseJsonDepth: responseJsonDepth).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Query Custom Objects
      Query custom object by specified fields with sorting and paginating. 

**Notes**:

* If a custom object contains fields or values that are greater than 1KB in length, you will
not be able to query on that field. For more information, see [Indexing Size Limit for Custom Objects and Fields](#!/guide/customfields-section-indexing-size-limit-for-custom-objects-and-fields).
* Currently, you cannot query or sort data stored inside an array or hash.
* You can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /objects/{classname}/query.json
	  - Query custom object by specified fields with sorting and paginating. 

**Notes**:

* If a custom object contains fields or values that are greater than 1KB in length, you will
not be able to query on that field. For more information, see [Indexing Size Limit for Custom Objects and Fields](#!/guide/customfields-section-indexing-size-limit-for-custom-objects-and-fields).
* Currently, you cannot query or sort data stored inside an array or hash.
* You can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
  
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
		- parameter  show_user_like: (query) If set to **true**, each CustomObject in the response includes `"current_user_liked: true"`
 if the current user has liked the object. If the current user has not liked the object, the 
`current_user_liked` field is not included in the response.
 (optional) 
		- parameter  where: (query) Constraint values for fields. `where` should be encoded JSON.

Each value in the search query needs to be less that 1024 bytes.
If the value is larger than 1024 bytes, the query does not return any results.

In addition to developer created fields, custom objects include
four predefined fields that can be queried as well:

*   `user_id: String`.  Object owner's user ID.

*   `tags_array: String`. List of tags.

*   `created_at: Date`. Timestamp when the object was created.

*   `updated_at: Date`. Timestamp when the object was updated.

If `where` is not specified, `query` returns all objects.
 (optional) 
		- parameter  order: (query) Sort results by one or more fields, specified as a comma-separated list of
field names.
See the [Search and Query guide](#!/guide/search_query) for more information.

Fields with a Hash data type cannot be sorted. Custom objects include
two predefined sortable fields:

    `created_at: Date` - Timestamp when the object was created.
    `updated_at: Date` - Timestamp when the object was last updated.

For example, if you want to query cars and sort them by `make` and
`created_at`:

    "order": "make,created_at"

To reverse the sorting order, simply add `-` in front of a field. For example,
to sort results by `make` in ascending order then by `created_at` in descending
order:

    "order": "make,-created_at"
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

	public class func customObjectsQueryRequestBuilder(classname: String,page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,prettyJson: Bool? = nil,showUserLike: Bool? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil) -> RequestBuilder<[String:Any]> { 
		var path = "/objects/{classname}/query.json"
		path = path.replacingOccurrences(of: "{classname}", with: "\(classname)", options: String.CompareOptions.literal, range: nil)
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"limit": limit as AnyObject, 
			"skip": skip as AnyObject, 
			"pretty_json": prettyJson as AnyObject, 
			"show_user_like": showUserLike as AnyObject, 
			"where": where_ as AnyObject, 
			"order": order as AnyObject, 
			"sel": sel as AnyObject, 
			"unsel": unsel as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Update Custom Object
      Any of the same parameters as [Create Custom
Object](/docs/api/v1/custom_objects/create) can be used to update a custom
object. Only the owner of the object or user who is entitled write
permission(ACL) to the object can update the object.

Application Admin can update any Custom Object.

	  - parameter iD: (formData) The object ID of the custom object to update.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter fields: (formData) JSON encoding of object fields to update.

If any of the fields do not exist in the current object, they will be added.
To delete an existing field, use {"field_name" : null}. For example, the car object created in
{@link CustomObjects#create CustomObject.create} is:

    { "make": "nissan",
      "color": "blue",
      "year": 2005,
      "purchased_at": "2011-11-02 17:07:37 -0700",
      "used": false,
      "coordinates": [-122.1, 37.1]
    }

To change color, remove the `purchased_at` field and add a new field `mileage`,
you could pass the following JSON object to fields:

    { "color": "purple",
      "purchased_at": null,
      "mileage": 10000
    }
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma-separated list of tags to associate with this object, for example, "hiking,swiming."
Replaces any existing tags.

If the `tags` parameter is omitted and a `tags` key is included in the
`fields` dictionary, `fields.tags` will be used instead.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New photo to attach as the primary photo for the object.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of an existing photo to attach as the primary photo for the object.
 (optional)
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
	  - parameter suId: (formData) User to update the Custom object on behalf of. The user must be the creator of the object.

The current user must be an application admin to update a Custom object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func customObjectsUpdate(classname: String , iD: String , fields: String , tags: String? = nil , photo: NSURL? = nil , photoId: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		customObjectsUpdateRequestBuilder(classname: classname, iD: iD, fields: fields, tags: tags, photo: photo, photoId: photoId, aclName: aclName, aclId: aclId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Update Custom Object
      Any of the same parameters as [Create Custom
Object](/docs/api/v1/custom_objects/create) can be used to update a custom
object. Only the owner of the object or user who is entitled write
permission(ACL) to the object can update the object.

Application Admin can update any Custom Object.

	  - PUT /objects/{classname}/update.json
	  - Any of the same parameters as [Create Custom
Object](/docs/api/v1/custom_objects/create) can be used to update a custom
object. Only the owner of the object or user who is entitled write
permission(ACL) to the object can update the object.

Application Admin can update any Custom Object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  id: (formData) The object ID of the custom object to update.
  
		- parameter  classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
  
		- parameter  fields: (formData) JSON encoding of object fields to update.

If any of the fields do not exist in the current object, they will be added.
To delete an existing field, use {"field_name" : null}. For example, the car object created in
{@link CustomObjects#create CustomObject.create} is:

    { "make": "nissan",
      "color": "blue",
      "year": 2005,
      "purchased_at": "2011-11-02 17:07:37 -0700",
      "used": false,
      "coordinates": [-122.1, 37.1]
    }

To change color, remove the `purchased_at` field and add a new field `mileage`,
you could pass the following JSON object to fields:

    { "color": "purple",
      "purchased_at": null,
      "mileage": 10000
    }
  
		- parameter  tags: (formData) Comma-separated list of tags to associate with this object, for example, "hiking,swiming."
Replaces any existing tags.

If the `tags` parameter is omitted and a `tags` key is included in the
`fields` dictionary, `fields.tags` will be used instead.
 (optional) 
		- parameter  photo: (formData) New photo to attach as the primary photo for the object.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional) 
		- parameter  photo_id: (formData) ID of an existing photo to attach as the primary photo for the object.
 (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) User to update the Custom object on behalf of. The user must be the creator of the object.

The current user must be an application admin to update a Custom object on
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

	public class func customObjectsUpdateRequestBuilder(classname: String,iD: String,fields: String,tags: String? = nil,photo: NSURL? = nil,photoId: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		var path = "/objects/{classname}/update.json"
		path = path.replacingOccurrences(of: "{classname}", with: "\(classname)", options: String.CompareOptions.literal, range: nil)
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"id": iD as AnyObject , 
		 	"fields": fields as AnyObject , 
		 	"tags": tags as AnyObject , 
		 	"photo": photo as AnyObject , 
		 	"photo_id": photoId as AnyObject , 
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
	/**
	  Delete Custom Object
      Only the owner of the object or user who is granted write permission by the
object's ACL can delete the object.

The {@link #photo primary photo} associated with the CustomObject is not deleted.

An application admin can delete any custom object.

	  - parameter classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter iD: (formData) The object ID of the custom object to delete.

You must specify either `id` or `ids`.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter ids: (formData) A comma-separated list of object IDs of the custom objects to delete.

You must specify either `id` or `ids`.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User to delete the Custom object on behalf of. The user must be the creator of the object.

The current user must be an application admin to delete a Custom object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func customObjectsDelete(classname: String , iD: String , ids: String , prettyJson: Bool? = nil , suId: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		customObjectsDeleteRequestBuilder(classname: classname, iD: iD, ids: ids, prettyJson: prettyJson, suId: suId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete Custom Object
      Only the owner of the object or user who is granted write permission by the
object's ACL can delete the object.

The {@link #photo primary photo} associated with the CustomObject is not deleted.

An application admin can delete any custom object.

	  - DELETE /objects/{classname}/delete.json
	  - Only the owner of the object or user who is granted write permission by the
object's ACL can delete the object.

The {@link #photo primary photo} associated with the CustomObject is not deleted.

An application admin can delete any custom object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
  
		- parameter  id: (formData) The object ID of the custom object to delete.

You must specify either `id` or `ids`.
  
		- parameter  ids: (formData) A comma-separated list of object IDs of the custom objects to delete.

You must specify either `id` or `ids`.
  
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
		- parameter  su_id: (formData) User to delete the Custom object on behalf of. The user must be the creator of the object.

The current user must be an application admin to delete a Custom object on
behalf of another user.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func customObjectsDeleteRequestBuilder(classname: String,iD: String,ids: String,prettyJson: Bool? = nil,suId: String? = nil) -> RequestBuilder<[String:Any]> { 
		var path = "/objects/{classname}/delete.json"
		path = path.replacingOccurrences(of: "{classname}", with: "\(classname)", options: String.CompareOptions.literal, range: nil)
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"id": iD as AnyObject , 
		 	"ids": ids as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject , 
		 	"su_id": suId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

        let customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Show Custom Object(s)
      Show a custom object's info.

	  - parameter classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter iD: (query) The object ID of the custom object to show.

You must specify either `id` or `ids`.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter ids: (query) A comma-separated list of object IDs of the custom objects to show.

You must specify either `id` or `ids`.
 
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
	  - parameter showUserLike: (query) If set to **true** the CustomObject in the response will include `"current_user_liked: true"`
if the current user has liked the object. If the user has not liked the object, the
`current_user_liked` field is not included in the response.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func customObjectsShow(classname: String , iD: String , ids: String , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil , showUserLike: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		customObjectsShowRequestBuilder(classname: classname, iD: iD, ids: ids, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson, showUserLike: showUserLike).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show Custom Object(s)
      Show a custom object's info.

	  - GET /objects/{classname}/show.json
	  - Show a custom object's info.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  classname: (path) Type of custom object. Specified as part of the URL path, not in the
parameters.
  
		- parameter  id: (query) The object ID of the custom object to show.

You must specify either `id` or `ids`.
  
		- parameter  ids: (query) A comma-separated list of object IDs of the custom objects to show.

You must specify either `id` or `ids`.
  
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
		- parameter  show_user_like: (query) If set to **true** the CustomObject in the response will include `"current_user_liked: true"`
if the current user has liked the object. If the user has not liked the object, the
`current_user_liked` field is not included in the response.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func customObjectsShowRequestBuilder(classname: String,iD: String,ids: String,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil,showUserLike: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		var path = "/objects/{classname}/show.json"
		path = path.replacingOccurrences(of: "{classname}", with: "\(classname)", options: String.CompareOptions.literal, range: nil)
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"id": iD as AnyObject, 
			"ids": ids as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject, 
			"show_user_like": showUserLike as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
