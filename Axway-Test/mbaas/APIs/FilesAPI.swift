// /Apis/FilesAPI.swift
 

import Foundation

public class FilesAPI: APIBase { 
	/**
	  Deletes multiple Files objects.
      Deletes Files objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Files objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000. 

The matched objects are deleted asynchronously in a separate process.      

You must be an application admin to run this command.

	  - parameter where_: (formData) Encoded JSON object that specifies constraint values for Files objects to delete.
If not specified, all Files objects are deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func filesBatchDelete(where_: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		filesBatchDeleteRequestBuilder(where_: where_).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Deletes multiple Files objects.
      Deletes Files objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Files objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000. 

The matched objects are deleted asynchronously in a separate process.      

You must be an application admin to run this command.

	  - DELETE /files/batch_delete.json
	  - Deletes Files objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Files objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000. 

The matched objects are deleted asynchronously in a separate process.      

You must be an application admin to run this command.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  where: (formData) Encoded JSON object that specifies constraint values for Files objects to delete.
If not specified, all Files objects are deleted.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func filesBatchDeleteRequestBuilder(where_: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/files/batch_delete.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"where": where_ as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Retrieves the total number of File objects.
      Retrieves the total number of File objects.
	*/

	public class func filesCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		filesCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of File objects.
      Retrieves the total number of File objects.
	  - GET /files/count.json
	  - Retrieves the total number of File objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func filesCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/files/count.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
      Creates a new file object with a binary attachment or contents of a URL.
The size of the file can be up to 25 MB. The response includes a `processed` flag which indicates
if the file has been stored reliably in the Appcelerator Cloud Services
storage engine. This will initially be `false`. Once the file is available in
the storage engine, the `processed` flag will be `true`, and file `url` will
be available.

	  - parameter name: (formData) File name. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter file: (formData) The attached binary file to upload to ArrowDB. You can specify either `file` or `url`, but not both. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this file object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter s3Acl: (formData) Permission level of the file.  Set to either:

  * `private`: Only a logged-in user can access the file.
  * `public_read`: Anyone can access the file (default).

For private permission, when you retrieve the URL for the file using either the show or
query method, the link is temporary and will expire. The default is five minutes.
When exporting data, the exported URL will be a root URL and not a direct URL to the file.

To restrict file access to specific users, use an ACL.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this file object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to create the file on behalf of.

The current login user must be an application admin to create a file on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func filesCreate(name: String? = nil , file: NSURL? = nil , customFields: String? = nil , aclName: String? = nil , s3Acl: String? = nil , aclId: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		filesCreateRequestBuilder(name: name, file: file, customFields: customFields, aclName: aclName, s3Acl: s3Acl, aclId: aclId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Creates a new file object with a binary attachment or contents of a URL.
The size of the file can be up to 25 MB. The response includes a `processed` flag which indicates
if the file has been stored reliably in the Appcelerator Cloud Services
storage engine. This will initially be `false`. Once the file is available in
the storage engine, the `processed` flag will be `true`, and file `url` will
be available.

	  - POST /files/create.json
	  - Creates a new file object with a binary attachment or contents of a URL.
The size of the file can be up to 25 MB. The response includes a `processed` flag which indicates
if the file has been stored reliably in the Appcelerator Cloud Services
storage engine. This will initially be `false`. Once the file is available in
the storage engine, the `processed` flag will be `true`, and file `url` will
be available.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) File name. (optional) 
		- parameter  file: (formData) The attached binary file to upload to ArrowDB. You can specify either `file` or `url`, but not both. (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this file object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  s3_acl: (formData) Permission level of the file.  Set to either:

  * `private`: Only a logged-in user can access the file.
  * `public_read`: Anyone can access the file (default).

For private permission, when you retrieve the URL for the file using either the show or
query method, the link is temporary and will expire. The default is five minutes.
When exporting data, the exported URL will be a root URL and not a direct URL to the file.

To restrict file access to specific users, use an ACL.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this file object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) User ID to create the file on behalf of.

The current login user must be an application admin to create a file on
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

	public class func filesCreateRequestBuilder(name: String? = nil,file: NSURL? = nil,customFields: String? = nil,aclName: String? = nil,s3Acl: String? = nil,aclId: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/files/create.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"name": name as AnyObject , 
		 	"file": file as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"s3_acl": s3Acl as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Delete a File
      Deletes the file. To delete a file, the current user must be one of the following:

*   The file's owner
*   A user with write priviledges granted by the file's ACL
*   An application admin

	  - parameter fileId: (formData) ID of the file to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User to delete the File object on behalf of. The user must be the creator of the object.

The current user must be an application admin to delete the File object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func filesDelete(fileId: String , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		filesDeleteRequestBuilder(fileId: fileId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete a File
      Deletes the file. To delete a file, the current user must be one of the following:

*   The file's owner
*   A user with write priviledges granted by the file's ACL
*   An application admin

	  - DELETE /files/delete.json
	  - Deletes the file. To delete a file, the current user must be one of the following:

*   The file's owner
*   A user with write priviledges granted by the file's ACL
*   An application admin

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  file_id: (formData) ID of the file to delete.  
		- parameter  su_id: (formData) User to delete the File object on behalf of. The user must be the creator of the object.

The current user must be an application admin to delete the File object on
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

	public class func filesDeleteRequestBuilder(fileId: String,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/files/delete.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"file_id": fileId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Custom Query Files
      Perform custom query of files with sorting and paginating. Currently you can
not query or sort data stored inside custom fields that have Hash values.

In addition to custom fields, here is a list of pre-defined fields in the File
object that can be queried and sorted:

*   `user_id: String`.  User ID of the File's owner.

*   `created_at: Date`. Timestamp when the file was created.

*   `updated_at: Date`. Timestamp when the file was last updated.

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
	  - parameter expires: (query) For private file permission, sets the expiration time in seconds for the temporary link
referencing the location to access the file. By default, the link expires in five minutes.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func filesQuery(page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil , expires: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		filesQueryRequestBuilder(page: page, perPage: perPage, limit: limit, skip: skip, where_: where_, order: order, sel: sel, unsel: unsel, responseJsonDepth: responseJsonDepth, expires: expires, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Custom Query Files
      Perform custom query of files with sorting and paginating. Currently you can
not query or sort data stored inside custom fields that have Hash values.

In addition to custom fields, here is a list of pre-defined fields in the File
object that can be queried and sorted:

*   `user_id: String`.  User ID of the File's owner.

*   `created_at: Date`. Timestamp when the file was created.

*   `updated_at: Date`. Timestamp when the file was last updated.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).        

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /files/query.json
	  - Perform custom query of files with sorting and paginating. Currently you can
not query or sort data stored inside custom fields that have Hash values.

In addition to custom fields, here is a list of pre-defined fields in the File
object that can be queried and sorted:

*   `user_id: String`.  User ID of the File's owner.

*   `created_at: Date`. Timestamp when the file was created.

*   `updated_at: Date`. Timestamp when the file was last updated.

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
		- parameter  unsel: (query) Selects the object fields NOT to display. Do not use this parameter with `sel`.
 (optional) 
		- parameter  response_json_depth: (query) Nested object depth level counts in response json.
In order to reduce server API calls from an application, the response json may
include not just the objects that are being queried/searched, but also with
some important data related to the returning objects such as object's owner or
referencing objects.

Default is 1, valid range is 1 to 8.
 (optional) 
		- parameter  expires: (query) For private file permission, sets the expiration time in seconds for the temporary link
referencing the location to access the file. By default, the link expires in five minutes.
 (optional) 
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func filesQueryRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil,expires: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/files/query.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
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
			"expires": expires as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Show File Info
      Returns information associated with the file.

	  - parameter fileId: (query) ID of the file to retrieve information for. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in response json.
In order to reduce server API calls from an application, the response json may
include not just the objects that are being queried/searched, but also with
some important data related to the returning objects such as object's owner or
referencing objects.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter expires: (query) For private file permission, sets the expiration time in seconds for the temporary link
referencing the location to access the file. By default, the link expires in five minutes.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func filesShow(fileId: String , responseJsonDepth: Int32? = nil , expires: Int32? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		filesShowRequestBuilder(fileId: fileId, responseJsonDepth: responseJsonDepth, expires: expires).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show File Info
      Returns information associated with the file.

	  - GET /files/show.json
	  - Returns information associated with the file.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  file_id: (query) ID of the file to retrieve information for.  
		- parameter  response_json_depth: (query) Nested object depth level counts in response json.
In order to reduce server API calls from an application, the response json may
include not just the objects that are being queried/searched, but also with
some important data related to the returning objects such as object's owner or
referencing objects.

Default is 1, valid range is 1 to 8.
 (optional) 
		- parameter  expires: (query) For private file permission, sets the expiration time in seconds for the temporary link
referencing the location to access the file. By default, the link expires in five minutes.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func filesShowRequestBuilder(fileId: String,responseJsonDepth: Int32? = nil,expires: Int32? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/files/show.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"file_id": fileId as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"expires": expires as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Update a File
      Updates an existing file object with a binary attachment, or contents of a URL. When replacing the existing file with a
new one, the object's `processing` flag is set to `false`, and its `url` property will not be valid
until the new file has been processed and uploaded to the Appcelerator Cloud
Services storage cloud.

Application administrators can update any File object.

	  - parameter fileId: (formData) ID of the file to update. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter name: (formData) File name. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter file: (formData) The attached binary file to upload to ArrowDB. You can specify either `file` or `url`, but not both. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this file object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this file object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter s3Acl: (formData) Permission level of the file.  Set to either:

  * `private`: Only a logged-in user can access the file.
  * `public_read`: Anyone can access the file (default).

This can only be set if you also update the `file` or `url`.

For private permission, when you retrieve the URL for the file using either the show or
query method, the link is temporary and will expire. The default is five minutes.
When exporting data, the exported URL will be a root URL and not a direct URL to the file.

To restrict file access to specific users, use an ACL.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User to update the File object on behalf of. The user must be the creator of the object.

The current user must be an application admin to update a File object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func filesUpdate(fileId: String , name: String? = nil , file: NSURL? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , s3Acl: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		filesUpdateRequestBuilder(fileId: fileId, name: name, file: file, customFields: customFields, aclName: aclName, aclId: aclId, s3Acl: s3Acl, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Update a File
      Updates an existing file object with a binary attachment, or contents of a URL. When replacing the existing file with a
new one, the object's `processing` flag is set to `false`, and its `url` property will not be valid
until the new file has been processed and uploaded to the Appcelerator Cloud
Services storage cloud.

Application administrators can update any File object.

	  - PUT /files/update.json
	  - Updates an existing file object with a binary attachment, or contents of a URL. When replacing the existing file with a
new one, the object's `processing` flag is set to `false`, and its `url` property will not be valid
until the new file has been processed and uploaded to the Appcelerator Cloud
Services storage cloud.

Application administrators can update any File object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  file_id: (formData) ID of the file to update.  
		- parameter  name: (formData) File name. (optional) 
		- parameter  file: (formData) The attached binary file to upload to ArrowDB. You can specify either `file` or `url`, but not both. (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this file object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this file object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  s3_acl: (formData) Permission level of the file.  Set to either:

  * `private`: Only a logged-in user can access the file.
  * `public_read`: Anyone can access the file (default).

This can only be set if you also update the `file` or `url`.

For private permission, when you retrieve the URL for the file using either the show or
query method, the link is temporary and will expire. The default is five minutes.
When exporting data, the exported URL will be a root URL and not a direct URL to the file.

To restrict file access to specific users, use an ACL.
 (optional) 
		- parameter  su_id: (formData) User to update the File object on behalf of. The user must be the creator of the object.

The current user must be an application admin to update a File object on
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

	public class func filesUpdateRequestBuilder(fileId: String,name: String? = nil,file: NSURL? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,s3Acl: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/files/update.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"file_id": fileId as AnyObject , 
		 	"name": name as AnyObject , 
		 	"file": file as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"s3_acl": s3Acl as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
