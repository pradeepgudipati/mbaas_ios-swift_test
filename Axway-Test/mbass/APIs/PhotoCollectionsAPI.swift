// /Apis/PhotoCollectionsAPI.swift
 

import Foundation

public class PhotoCollectionsAPI: APIBase { 
	/**
	  Deletes multiple PhotoCollections objects.
      Deletes PhotoCollections objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all PhotoCollections objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.        

The {@link #cover_photo cover photo} associated with any of the matched objects are not not deleted.

You must be an application admin to run this command.

	  - parameter where_: (formData) Encoded JSON object that specifies constraint values for PhotoCollections objects to delete.
If not specified, all PhotoCollections objects are deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func photoCollectionsBatchDelete(where_: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photoCollectionsBatchDeleteRequestBuilder(where_: where_).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Deletes multiple PhotoCollections objects.
      Deletes PhotoCollections objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all PhotoCollections objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.        

The {@link #cover_photo cover photo} associated with any of the matched objects are not not deleted.

You must be an application admin to run this command.

	  - DELETE /collections/batch_delete.json
	  - Deletes PhotoCollections objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all PhotoCollections objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.        

The {@link #cover_photo cover photo} associated with any of the matched objects are not not deleted.

You must be an application admin to run this command.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  where: (formData) Encoded JSON object that specifies constraint values for PhotoCollections objects to delete.
If not specified, all PhotoCollections objects are deleted.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func photoCollectionsBatchDeleteRequestBuilder(where_: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/collections/batch_delete.json"
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
	  Retrieves the total number of PhotoCollection objects.
      Retrieves the total number of PhotoCollection objects.
	*/

	public class func photoCollectionsCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photoCollectionsCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of PhotoCollection objects.
      Retrieves the total number of PhotoCollection objects.
	  - GET /collections/count.json
	  - Retrieves the total number of PhotoCollection objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func photoCollectionsCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/collections/count.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Create a Photo Collection
      Collections contain one or more photos and/or sub-collections. These can be
used as photo albums for a user. To create a subcollection,
specify a `parent_collection_id` when creating a collection. If the collection has been
created or updated with a `cover_photo_id`, photo details will be returned
with collection information. If a `cover_photo_id` has not been assigned, the
first photo found in the collection or its sub-collections will be returned as
the cover photo.

	  - parameter name: (formData) Name of the collection. The name must be unique across other top-level
collections. If this is a sub-collection, the name must be unique across other
sub-collections of the same parent.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter parentCollectionId: (formData) Parent collection ID. Specify when creating a subcollection.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter coverPhotoId: (formData) ID of the photo to use as a cover photo. The photo does not need to be
in the collection.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this collection.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this collection.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to create the collection on behalf of.

The current login user must be an application admin to create a collection on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func photoCollectionsCreate(name: String? = nil , parentCollectionId: String? = nil , coverPhotoId: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photoCollectionsCreateRequestBuilder(name: name, parentCollectionId: parentCollectionId, coverPhotoId: coverPhotoId, customFields: customFields, aclName: aclName, aclId: aclId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Create a Photo Collection
      Collections contain one or more photos and/or sub-collections. These can be
used as photo albums for a user. To create a subcollection,
specify a `parent_collection_id` when creating a collection. If the collection has been
created or updated with a `cover_photo_id`, photo details will be returned
with collection information. If a `cover_photo_id` has not been assigned, the
first photo found in the collection or its sub-collections will be returned as
the cover photo.

	  - POST /collections/create.json
	  - Collections contain one or more photos and/or sub-collections. These can be
used as photo albums for a user. To create a subcollection,
specify a `parent_collection_id` when creating a collection. If the collection has been
created or updated with a `cover_photo_id`, photo details will be returned
with collection information. If a `cover_photo_id` has not been assigned, the
first photo found in the collection or its sub-collections will be returned as
the cover photo.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) Name of the collection. The name must be unique across other top-level
collections. If this is a sub-collection, the name must be unique across other
sub-collections of the same parent.
 (optional) 
		- parameter  parent_collection_id: (formData) Parent collection ID. Specify when creating a subcollection.
 (optional) 
		- parameter  cover_photo_id: (formData) ID of the photo to use as a cover photo. The photo does not need to be
in the collection.
 (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this collection.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this collection.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) User ID to create the collection on behalf of.

The current login user must be an application admin to create a collection on
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

	public class func photoCollectionsCreateRequestBuilder(name: String? = nil,parentCollectionId: String? = nil,coverPhotoId: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/collections/create.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"name": name as AnyObject , 
		 	"parent_collection_id": parentCollectionId as AnyObject , 
		 	"cover_photo_id": coverPhotoId as AnyObject , 
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
	  Delete a Photo Collection
      Delete an empty collection. An error will be returned if a collection contains
any photos or subcollections.

An application admin can delete any photo collection. The {@link #cover_photo} associated 
with the collection is not deleted.

	  - parameter collectionId: (formData) ID of the collection to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to delete the collection on behalf of. The user must be the creator of the collection.

The current login user must be an application admin to delete a collection on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func photoCollectionsDelete(collectionId: String , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photoCollectionsDeleteRequestBuilder(collectionId: collectionId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete a Photo Collection
      Delete an empty collection. An error will be returned if a collection contains
any photos or subcollections.

An application admin can delete any photo collection. The {@link #cover_photo} associated 
with the collection is not deleted.

	  - DELETE /collections/delete.json
	  - Delete an empty collection. An error will be returned if a collection contains
any photos or subcollections.

An application admin can delete any photo collection. The {@link #cover_photo} associated 
with the collection is not deleted.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  collection_id: (formData) ID of the collection to delete.  
		- parameter  su_id: (formData) User ID to delete the collection on behalf of. The user must be the creator of the collection.

The current login user must be an application admin to delete a collection on
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

	public class func photoCollectionsDeleteRequestBuilder(collectionId: String,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/collections/delete.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"collection_id": collectionId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Show Photos in a Collection
      Show photos in a collection.

	  - parameter collectionId: (query) ID of the collection to retrieve photos from. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in the response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects such as the object's owner or
referenced objects.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func photoCollectionsShowPhotos(collectionId: String , page: Int32? = nil , perPage: Int32? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photoCollectionsShowPhotosRequestBuilder(collectionId: collectionId, page: page, perPage: perPage, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show Photos in a Collection
      Show photos in a collection.

	  - GET /collections/show/photos.json
	  - Show photos in a collection.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  collection_id: (query) ID of the collection to retrieve photos from.  
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
		- parameter  response_json_depth: (query) Nested object depth level counts in the response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects such as the object's owner or
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

	public class func photoCollectionsShowPhotosRequestBuilder(collectionId: String,page: Int32? = nil,perPage: Int32? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/collections/show/photos.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"collection_id": collectionId as AnyObject, 
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Search Photo Collections
      Search for top-level collections owned by the given user. Subcollections cannot
be found this way. See {@link PhotoCollections#show_subcollections Show Subcollections} to view the
subcollections of a collection.

	  - parameter userId: (query) ID of the user to find collections for. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects such as object's owner and
referenced objects.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func photoCollectionsSearch(userId: String , page: Int32? = nil , perPage: Int32? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photoCollectionsSearchRequestBuilder(userId: userId, page: page, perPage: perPage, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Search Photo Collections
      Search for top-level collections owned by the given user. Subcollections cannot
be found this way. See {@link PhotoCollections#show_subcollections Show Subcollections} to view the
subcollections of a collection.

	  - GET /collections/search.json
	  - Search for top-level collections owned by the given user. Subcollections cannot
be found this way. See {@link PhotoCollections#show_subcollections Show Subcollections} to view the
subcollections of a collection.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  user_id: (query) ID of the user to find collections for.  
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
		- parameter  response_json_depth: (query) Nested object depth level counts in response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects such as object's owner and
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

	public class func photoCollectionsSearchRequestBuilder(userId: String,page: Int32? = nil,perPage: Int32? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/collections/search.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"user_id": userId as AnyObject, 
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Show a Photo Collection
      Shows information about a collection including the cover photo, owner, parent
collection, and counts of its contents. See {@link PhotoCollections#show_subcollections Show
Subcollections} and {@link PhotoCollections#show_photos Show Photos} to view the contents
of a collection.

	  - parameter collectionId: (query) ID of the collection to retrieve photos from. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in the response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects such as the object's owner or
referenced objects.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func photoCollectionsShow(collectionId: String , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photoCollectionsShowRequestBuilder(collectionId: collectionId, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show a Photo Collection
      Shows information about a collection including the cover photo, owner, parent
collection, and counts of its contents. See {@link PhotoCollections#show_subcollections Show
Subcollections} and {@link PhotoCollections#show_photos Show Photos} to view the contents
of a collection.

	  - GET /collections/show.json
	  - Shows information about a collection including the cover photo, owner, parent
collection, and counts of its contents. See {@link PhotoCollections#show_subcollections Show
Subcollections} and {@link PhotoCollections#show_photos Show Photos} to view the contents
of a collection.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  collection_id: (query) ID of the collection to retrieve photos from.  
		- parameter  response_json_depth: (query) Nested object depth level counts in the response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects such as the object's owner or
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

	public class func photoCollectionsShowRequestBuilder(collectionId: String,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/collections/show.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"collection_id": collectionId as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Show Subcollections
      Show subcollections of a collection.

	  - parameter collectionId: (query) ID of the collection to retrieve photos from. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in the response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects such as the object's owner or
referenced objects.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func photoCollectionsShowSubcollections(collectionId: String , page: Int32? = nil , perPage: Int32? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photoCollectionsShowSubcollectionsRequestBuilder(collectionId: collectionId, page: page, perPage: perPage, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show Subcollections
      Show subcollections of a collection.

	  - GET /collections/show/subcollections.json
	  - Show subcollections of a collection.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  collection_id: (query) ID of the collection to retrieve photos from.  
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
		- parameter  response_json_depth: (query) Nested object depth level counts in the response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects such as the object's owner or
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

	public class func photoCollectionsShowSubcollectionsRequestBuilder(collectionId: String,page: Int32? = nil,perPage: Int32? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/collections/show/subcollections.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"collection_id": collectionId as AnyObject, 
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Update a Photo Collection
      Updates a photo collection.

An existing collection's cover photo can be added or updated by specifying a
new `cover_photo_id`. The cover photo can be removed by sending an empty
string as the value for `cover_photo_id`.
Application Admin can update any Photo Collection.

	  - parameter collectionId: (formData) ID of the collection to update. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter name: (formData) New name of the collection. The name must be unique across other top-level
collections. If this is a sub-collection, the name must be unique across other
sub-collections of the same parent.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter coverPhotoId: (formData) ID of the photo to use as a cover photo. The photo does not need to be
in the collection.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this collection.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this collection.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to update the collection on behalf of. The user must be the creator of the collection.

The current login user must be an application admin to update a collection on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func photoCollectionsUpdate(collectionId: String? = nil , name: String? = nil , coverPhotoId: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photoCollectionsUpdateRequestBuilder(collectionId: collectionId, name: name, coverPhotoId: coverPhotoId, customFields: customFields, aclName: aclName, aclId: aclId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Update a Photo Collection
      Updates a photo collection.

An existing collection's cover photo can be added or updated by specifying a
new `cover_photo_id`. The cover photo can be removed by sending an empty
string as the value for `cover_photo_id`.
Application Admin can update any Photo Collection.

	  - PUT /collections/update.json
	  - Updates a photo collection.

An existing collection's cover photo can be added or updated by specifying a
new `cover_photo_id`. The cover photo can be removed by sending an empty
string as the value for `cover_photo_id`.
Application Admin can update any Photo Collection.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  collection_id: (formData) ID of the collection to update. (optional) 
		- parameter  name: (formData) New name of the collection. The name must be unique across other top-level
collections. If this is a sub-collection, the name must be unique across other
sub-collections of the same parent.
 (optional) 
		- parameter  cover_photo_id: (formData) ID of the photo to use as a cover photo. The photo does not need to be
in the collection.
 (optional) 
		- parameter  custom_fields: (formData) User defined fields. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this collection.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this collection.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) User ID to update the collection on behalf of. The user must be the creator of the collection.

The current login user must be an application admin to update a collection on
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

	public class func photoCollectionsUpdateRequestBuilder(collectionId: String? = nil,name: String? = nil,coverPhotoId: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/collections/update.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"collection_id": collectionId as AnyObject , 
		 	"name": name as AnyObject , 
		 	"cover_photo_id": coverPhotoId as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
