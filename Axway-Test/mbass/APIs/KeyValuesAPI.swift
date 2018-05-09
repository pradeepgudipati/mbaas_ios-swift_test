// /Apis/KeyValuesAPI.swift
 

import Foundation

public class KeyValuesAPI: APIBase { 
	/**
	  Append to a Key-Value
      Add the given `value` to end of the existing one. Not allowed on key-values
with binary data.

	  - parameter name: (formData) Name (or key) for the key-value pair. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter value: (formData) Value to append to the current value. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter accessPrivate: (formData) Determines whether to update this key-value in the publically readable store
or in the user's private store.

Default is false (publically readable).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) Update the key-value pair on behalf of the identified user.

Login user must be an admin to update a key-value on behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func keyValuesAppend(name: String , value: String , accessPrivate: Bool? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		keyValuesAppendRequestBuilder(name: name, value: value, accessPrivate: accessPrivate, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Append to a Key-Value
      Add the given `value` to end of the existing one. Not allowed on key-values
with binary data.

	  - PUT /keyvalues/append.json
	  - Add the given `value` to end of the existing one. Not allowed on key-values
with binary data.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) Name (or key) for the key-value pair.  
		- parameter  value: (formData) Value to append to the current value.  
		- parameter  access_private: (formData) Determines whether to update this key-value in the publically readable store
or in the user's private store.

Default is false (publically readable).
 (optional) 
		- parameter  su_id: (formData) Update the key-value pair on behalf of the identified user.

Login user must be an admin to update a key-value on behalf of another user.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func keyValuesAppendRequestBuilder(name: String,value: String,accessPrivate: Bool? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/keyvalues/append.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"name": name as AnyObject , 
		 	"value": value as AnyObject , 
		 	"access_private": accessPrivate as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Retrieves the total number of KeyValue objects.
      Retrieves the total number of KeyValue objects.
	*/

	public class func keyValuesCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		keyValuesCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of KeyValue objects.
      Retrieves the total number of KeyValue objects.
	  - GET /keyvalues/count.json
	  - Retrieves the total number of KeyValue objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func keyValuesCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/keyvalues/count.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Delete a Key-Value
      Deletes a key-value pair

	  - parameter name: (formData) Name (or key) of the key-value pair to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter accessPrivate: (formData) Determines whether to delete this key-value in the publically readable store
or in the user's private store.

Default is false (publically readable store).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) Delete the key-value pair on behalf of the identified user.

Login user must be an admin to delete a key-value on behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func keyValuesDelete(name: String , accessPrivate: Bool? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		keyValuesDeleteRequestBuilder(name: name, accessPrivate: accessPrivate, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete a Key-Value
      Deletes a key-value pair

	  - DELETE /keyvalues/delete.json
	  - Deletes a key-value pair

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) Name (or key) of the key-value pair to delete.  
		- parameter  access_private: (formData) Determines whether to delete this key-value in the publically readable store
or in the user's private store.

Default is false (publically readable store).
 (optional) 
		- parameter  su_id: (formData) Delete the key-value pair on behalf of the identified user.

Login user must be an admin to delete a key-value on behalf of another user.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func keyValuesDeleteRequestBuilder(name: String,accessPrivate: Bool? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/keyvalues/delete.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"name": name as AnyObject , 
		 	"access_private": accessPrivate as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Get a Value
      Gets the value of a key-value pair.

If the value is string, the KeyValue object is returned in JSON format. If the value is
binary, the value is returned directly **without** a JSON wrapper and the content type
is set to "application/octct-stream".

	  - parameter name: (query) Name (or key) for the key-value pair to retrieve. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter accessPrivate: (query) Determines whether to retrieve this key-value from the publically readable store
or from the user's private store.

Default is false (publically readable).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter userId: (query) Retrieve a private key-value pair from the identified user's store.

Login user must be an application admin to retrieve a key-value from another
user's store.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func keyValuesGet(name: String , accessPrivate: Bool? = nil , userId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		keyValuesGetRequestBuilder(name: name, accessPrivate: accessPrivate, userId: userId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Get a Value
      Gets the value of a key-value pair.

If the value is string, the KeyValue object is returned in JSON format. If the value is
binary, the value is returned directly **without** a JSON wrapper and the content type
is set to "application/octct-stream".

	  - GET /keyvalues/get.json
	  - Gets the value of a key-value pair.

If the value is string, the KeyValue object is returned in JSON format. If the value is
binary, the value is returned directly **without** a JSON wrapper and the content type
is set to "application/octct-stream".

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (query) Name (or key) for the key-value pair to retrieve.  
		- parameter  access_private: (query) Determines whether to retrieve this key-value from the publically readable store
or from the user's private store.

Default is false (publically readable).
 (optional) 
		- parameter  user_id: (query) Retrieve a private key-value pair from the identified user's store.

Login user must be an application admin to retrieve a key-value from another
user's store.
 (optional) 
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func keyValuesGetRequestBuilder(name: String,accessPrivate: Bool? = nil,userId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/keyvalues/get.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"name": name as AnyObject, 
			"access_private": accessPrivate as AnyObject, 
			"user_id": userId as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Increment a Key-Value
      Increment the `value` by the given integer value. Not allowed on key-value pairs with binary
data.

If the current value in the key-value is not convertable to an integer, the new
value replaces the existing value.

	  - parameter name: (formData) Name (or key) for the key-value pair. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter value: (formData) Integer value to add to the current value. If a floating point number is
specified, any fractional portion is dropped.

If this value cannot be converted to an integer, the existing value is not
changed.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter accessPrivate: (formData) Determines whether to update this key-value in the publically readable store
or in the user's private store.

Default is false (publically readable).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) Update the key-value pair on behalf of the identified user.

Login user must be an admin to update a key-value on behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func keyValuesIncrby(name: String , value: String , accessPrivate: Bool? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		keyValuesIncrbyRequestBuilder(name: name, value: value, accessPrivate: accessPrivate, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Increment a Key-Value
      Increment the `value` by the given integer value. Not allowed on key-value pairs with binary
data.

If the current value in the key-value is not convertable to an integer, the new
value replaces the existing value.

	  - PUT /keyvalues/incrby.json
	  - Increment the `value` by the given integer value. Not allowed on key-value pairs with binary
data.

If the current value in the key-value is not convertable to an integer, the new
value replaces the existing value.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) Name (or key) for the key-value pair.  
		- parameter  value: (formData) Integer value to add to the current value. If a floating point number is
specified, any fractional portion is dropped.

If this value cannot be converted to an integer, the existing value is not
changed.
  
		- parameter  access_private: (formData) Determines whether to update this key-value in the publically readable store
or in the user's private store.

Default is false (publically readable).
 (optional) 
		- parameter  su_id: (formData) Update the key-value pair on behalf of the identified user.

Login user must be an admin to update a key-value on behalf of another user.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func keyValuesIncrbyRequestBuilder(name: String,value: String,accessPrivate: Bool? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/keyvalues/incrby.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"name": name as AnyObject , 
		 	"value": value as AnyObject , 
		 	"access_private": accessPrivate as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Performs a custom query of KeyValues.
      Performs a custom query of KeyValues. Currently you can not query or sort data stored inside 
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

	public class func keyValuesQuery(page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , prettyJson: Bool? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		keyValuesQueryRequestBuilder(page: page, perPage: perPage, limit: limit, skip: skip, prettyJson: prettyJson, where_: where_, order: order, sel: sel, unsel: unsel, responseJsonDepth: responseJsonDepth).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Performs a custom query of KeyValues.
      Performs a custom query of KeyValues. Currently you can not query or sort data stored inside 
an array or hash in custom fields.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).        

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /keyvalues/query.json
	  - Performs a custom query of KeyValues. Currently you can not query or sort data stored inside 
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

	public class func keyValuesQueryRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,prettyJson: Bool? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/keyvalues/query.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
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
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Set a string or binary value
      Sets a string or binary value referenced by the key name. The size of the
value can be up to 2M, and the key name length can be up to 256 characters.
The default value type is String.

	  - parameter name: (formData) The name, or key, for this key-value pair. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter type: (formData) Value type: "string" or "binary".

Defaults to "string".
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter value: (formData) Value to assoicate with the key.

Binary data can be passed as a binary form part. The REST example shows how to
send binary data using curl.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter accessPrivate: (formData) Determines whether this key-value is publically readable, or stored in a
private store.

Default is false (publically readable). If set to true, it sets the key/value stored
in the current user's private key-value store. Otherwise, it sets the public
key-value pair which is readable to everyone.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User to create the key-value pair on behalf of.

The current user must be an application admin to set a key-value pair on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func keyValuesSet(name: String , type: String? = nil , value: String , accessPrivate: Bool? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		keyValuesSetRequestBuilder(name: name, type: type, value: value, accessPrivate: accessPrivate, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Set a string or binary value
      Sets a string or binary value referenced by the key name. The size of the
value can be up to 2M, and the key name length can be up to 256 characters.
The default value type is String.

	  - PUT /keyvalues/set.json
	  - Sets a string or binary value referenced by the key name. The size of the
value can be up to 2M, and the key name length can be up to 256 characters.
The default value type is String.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) The name, or key, for this key-value pair.  
		- parameter  type: (formData) Value type: "string" or "binary".

Defaults to "string".
 (optional) 
		- parameter  value: (formData) Value to assoicate with the key.

Binary data can be passed as a binary form part. The REST example shows how to
send binary data using curl.
  
		- parameter  access_private: (formData) Determines whether this key-value is publically readable, or stored in a
private store.

Default is false (publically readable). If set to true, it sets the key/value stored
in the current user's private key-value store. Otherwise, it sets the public
key-value pair which is readable to everyone.
 (optional) 
		- parameter  su_id: (formData) User to create the key-value pair on behalf of.

The current user must be an application admin to set a key-value pair on
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

	public class func keyValuesSetRequestBuilder(name: String,type: String? = nil,value: String,accessPrivate: Bool? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/keyvalues/set.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"name": name as AnyObject , 
		 	"type": type as AnyObject , 
		 	"value": value as AnyObject , 
		 	"access_private": accessPrivate as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
