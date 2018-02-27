// /Apis/PhotosAPI.swift
 

import Foundation

public class PhotosAPI: APIBase { 
	/**
	  Create (Upload) a Photo
      Create a photo using the given `photo` binary attachment. A `collection_name`
or `collection_id` is optional. The response includes a `processed` flag which
indicates if the photo has been resized and stored reliably in the
ArrowDB storage engine. This will initially be `false`.
The `md5` field gives the md5 sum of the file which can be used to verify file
integrity.

	  - parameter photo: (formData) The attached binary file.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter title: (formData) Photo title. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter collectionName: (formData) Name of the {@link PhotoCollections} to add this photo to. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter collectionId: (formData) ID of the {@link PhotoCollections} to add this photo to. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma separated list of tags to associate with this photo.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User-defined fields to add to this photo. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this photo object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this photo object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to create the photo on behalf of.

The current login user must be an application admin to create a photo on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoSizes: (formData) User-defined photo sizes. See [Photo Uploading &
Sizes](#!/guide/photosizes#custom).  Sizes be specified as a JSON object, or using a separate parameter for each
size. To specify a photo size called "preview" using JSON:

    photo_size : { "preview" : "120x120#" }

To pass each size as a separate parameter, do *not* use the literal parameter name `photo_sizes`,
but add a parameter named `photo_sizes[`_sizeName_`]` for each custom photo
size. The previous example in this format looks like this:

    "photo_size[preview]" : "120x120#"
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoSyncSizes: (formData) Synchronous photo sizes to upload. See [Photo Uploading & Resizing](#!/guide/photosizes).

The literal name for this parameter is `photo_sync_sizes[]`. This parameter can be specified
multiple times, once for each photo size that must be created before the request returns.

For example:

    "photo_sync_sizes[]=preview"
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func photosCreate(photo: URL , title: String? = nil , collectionName: String? = nil , collectionId: String? = nil , tags: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil , photoSizes: String? = nil , photoSyncSizes: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photosCreateRequestBuilder(photo: photo, title: title, collectionName: collectionName, collectionId: collectionId, tags: tags, customFields: customFields, aclName: aclName, aclId: aclId, suId: suId, photoSizes: photoSizes, photoSyncSizes: photoSyncSizes, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Create (Upload) a Photo
      Create a photo using the given `photo` binary attachment. A `collection_name`
or `collection_id` is optional. The response includes a `processed` flag which
indicates if the photo has been resized and stored reliably in the
ArrowDB storage engine. This will initially be `false`.
The `md5` field gives the md5 sum of the file which can be used to verify file
integrity.

	  - POST /photos/create.json
	  - Create a photo using the given `photo` binary attachment. A `collection_name`
or `collection_id` is optional. The response includes a `processed` flag which
indicates if the photo has been resized and stored reliably in the
ArrowDB storage engine. This will initially be `false`.
The `md5` field gives the md5 sum of the file which can be used to verify file
integrity.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  photo: (formData) The attached binary file.
  
		- parameter  title: (formData) Photo title. (optional) 
		- parameter  collection_name: (formData) Name of the {@link PhotoCollections} to add this photo to. (optional) 
		- parameter  collection_id: (formData) ID of the {@link PhotoCollections} to add this photo to. (optional) 
		- parameter  tags: (formData) Comma separated list of tags to associate with this photo.
 (optional) 
		- parameter  custom_fields: (formData) User-defined fields to add to this photo. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this photo object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this photo object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) User ID to create the photo on behalf of.

The current login user must be an application admin to create a photo on
behalf of another user.
 (optional) 
		- parameter  photo_sizes: (formData) User-defined photo sizes. See [Photo Uploading &
Sizes](#!/guide/photosizes#custom).  Sizes be specified as a JSON object, or using a separate parameter for each
size. To specify a photo size called "preview" using JSON:

    photo_size : { "preview" : "120x120#" }

To pass each size as a separate parameter, do *not* use the literal parameter name `photo_sizes`,
but add a parameter named `photo_sizes[`_sizeName_`]` for each custom photo
size. The previous example in this format looks like this:

    "photo_size[preview]" : "120x120#"
 (optional) 
		- parameter  photo_sync_sizes[]: (formData) Synchronous photo sizes to upload. See [Photo Uploading & Resizing](#!/guide/photosizes).

The literal name for this parameter is `photo_sync_sizes[]`. This parameter can be specified
multiple times, once for each photo size that must be created before the request returns.

For example:

    "photo_sync_sizes[]=preview"
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	/*public class func photosCreateRequestBuilder(photo: NSData,title: String? = nil,collectionName: String? = nil,collectionId: String? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil,photoSizes: String? = nil,photoSyncSizes: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> {
		let path = "/photos/create.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"photo": photo as AnyObject , 
		 	"title": title as AnyObject , 
		 	"collection_name": collectionName as AnyObject , 
		 	"collection_id": collectionId as AnyObject , 
		 	"tags": tags as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"photo_sizes": photoSizes as AnyObject , 
		 	"photo_sync_sizes[]": photoSyncSizes as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		let customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}*/
  public class func photosCreateRequestBuilder(photo:URL,title: String? = nil,collectionName: String? = nil,collectionId: String? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil,photoSizes: String? = nil,photoSyncSizes: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> {
    let path = "/photos/create.json"
    let URLString = MbassAPI.sharedInstance.basePath + path
    let nillableParameters: [String:AnyObject?] = [
      "photo": photo as AnyObject ,
      "title": title as AnyObject ,
      "collection_name": collectionName as AnyObject ,
      "collection_id": collectionId as AnyObject ,
      "tags": tags as AnyObject ,
      "custom_fields": customFields as AnyObject ,
      "acl_name": aclName as AnyObject ,
      "acl_id": aclId as AnyObject ,
      "su_id": suId as AnyObject ,
      "photo_sizes": photoSizes as AnyObject ,
      "photo_sync_sizes[]": photoSyncSizes as AnyObject ,
      "pretty_json": prettyJson as AnyObject ]
    let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
    let convertedParameters = APIHelper.convertBoolToString(source: parameters)
    let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()
    
    let customHeadersDict : [String: String] = [:]
    
    
    
    return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
  }
	/**
	  Show Photo Info
      Returns the information for the identified photo.

	  - parameter photoId: (query) ID of the photo to show. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter responseJsonDepth: (query) Nested object depth level counts in response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects such as object's owner or
referenced objects.

Default is 1, valid range is 1 to 8.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter showUserLike: (query) If set to **true** the Photo object in the response will include `"current_user_liked: true"`
if the current user has liked the object. If the user has not liked the object, the 
`current_user_liked` field is not included in the response.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func photosShow(photoId: String , responseJsonDepth: Int32? = nil , showUserLike: Bool? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photosShowRequestBuilder(photoId: photoId, responseJsonDepth: responseJsonDepth, showUserLike: showUserLike, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show Photo Info
      Returns the information for the identified photo.

	  - GET /photos/show.json
	  - Returns the information for the identified photo.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  photo_id: (query) ID of the photo to show.  
		- parameter  response_json_depth: (query) Nested object depth level counts in response JSON.

In order to reduce server API calls from an application, the response JSON may
include not just the objects that are being queried/searched, but also
some important data related to the returned objects such as object's owner or
referenced objects.

Default is 1, valid range is 1 to 8.
 (optional) 
		- parameter  show_user_like: (query) If set to **true** the Photo object in the response will include `"current_user_liked: true"`
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

	public class func photosShowRequestBuilder(photoId: String,responseJsonDepth: Int32? = nil,showUserLike: Bool? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> {
		let path = "/photos/show.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"photo_id": photoId as AnyObject, 
			"response_json_depth": responseJsonDepth as AnyObject, 
			"show_user_like": showUserLike as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		let customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Update a Photo
      Updates the photo attachment, the collection that the photo belongs to, or
other photo properties. When replacing the existing photo attachment with a
new one, `processing` will be set to `false`. However the existig URLs will
remain valid until the new photo has been processed and uploaded to the
Appcelerator Cloud Services storage cloud. At this time, the old URLs will be
replaced with the URLs of the newly processed photo.

An application admin can update any Photo object.

	  - parameter photoId: (formData) ID of the photo to update. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New photo to associate with this object, attached as a binary file.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter title: (formData) Photo title. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter collectionName: (formData) Name of the {@link PhotoCollections} to add this photo to. Replaces the
existing collection, if any.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter collectionId: (formData) ID of the {@link PhotoCollections} to add this photo to. Replaces the existing
collection, if any.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma separated list of tags to associate with this photo. Overwrites any
existing tags.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User-defined fields to add to this photo. See [Custom Data Fields](#!/guide/customfields). (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclName: (formData) Name of an {@link ACLs} to associate with this photo object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.

To delete an ACL, set `acl_name` or `acl_id` to the empty string.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter aclId: (formData) ID of an {@link ACLs} to associate with this photo object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoSizes: (formData) User-defined photo sizes. See [Photo Uploading & Resizings](#!/guide/photosizes).
Sizes be specified as a JSON object, or using a separate parameter for each
size. To specify a photo size called "preview" using JSON:

    photo_size : { "preview" : "120x120#" }

To pass each size as a separate parameter, do *not* use the literal parameter name `photo_sizes`,
but add a parameter named `photo_sizes[`_sizeName_`]` for each custom photo
size. The previous example in this format looks like this:

    "photo_size[preview]" : "120x120#"
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoSyncSizes: (formData) Synchronous photo sizes to upload. See [Photo Uploading & Resizings](#!/guide/photosizes).

The literal name for this parameter is `photo_sync_sizes[]`. This parameter can be specified
multiple times, once for each photo size that must be created before the request returns.

For example:

    "photo_sync_sizes[]=preview"
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to update the Photo object on behalf of. The user must be the creator of the object.

The current login user must be an application admin to update a Photo object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func photosUpdate(photoId: String , photo: NSURL , title: String? = nil , collectionName: String? = nil , collectionId: String? = nil , tags: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , photoSizes: String? = nil , photoSyncSizes: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photosUpdateRequestBuilder(photoId: photoId, photo: photo, title: title, collectionName: collectionName, collectionId: collectionId, tags: tags, customFields: customFields, aclName: aclName, aclId: aclId, photoSizes: photoSizes, photoSyncSizes: photoSyncSizes, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Update a Photo
      Updates the photo attachment, the collection that the photo belongs to, or
other photo properties. When replacing the existing photo attachment with a
new one, `processing` will be set to `false`. However the existig URLs will
remain valid until the new photo has been processed and uploaded to the
Appcelerator Cloud Services storage cloud. At this time, the old URLs will be
replaced with the URLs of the newly processed photo.

An application admin can update any Photo object.

	  - PUT /photos/update.json
	  - Updates the photo attachment, the collection that the photo belongs to, or
other photo properties. When replacing the existing photo attachment with a
new one, `processing` will be set to `false`. However the existig URLs will
remain valid until the new photo has been processed and uploaded to the
Appcelerator Cloud Services storage cloud. At this time, the old URLs will be
replaced with the URLs of the newly processed photo.

An application admin can update any Photo object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  photo_id: (formData) ID of the photo to update.  
		- parameter  photo: (formData) New photo to associate with this object, attached as a binary file.
  
		- parameter  title: (formData) Photo title. (optional) 
		- parameter  collection_name: (formData) Name of the {@link PhotoCollections} to add this photo to. Replaces the
existing collection, if any.
 (optional) 
		- parameter  collection_id: (formData) ID of the {@link PhotoCollections} to add this photo to. Replaces the existing
collection, if any.
 (optional) 
		- parameter  tags: (formData) Comma separated list of tags to associate with this photo. Overwrites any
existing tags.
 (optional) 
		- parameter  custom_fields: (formData) User-defined fields to add to this photo. See [Custom Data Fields](#!/guide/customfields). (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this photo object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.

To delete an ACL, set `acl_name` or `acl_id` to the empty string.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this photo object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  photo_sizes: (formData) User-defined photo sizes. See [Photo Uploading & Resizings](#!/guide/photosizes).
Sizes be specified as a JSON object, or using a separate parameter for each
size. To specify a photo size called "preview" using JSON:

    photo_size : { "preview" : "120x120#" }

To pass each size as a separate parameter, do *not* use the literal parameter name `photo_sizes`,
but add a parameter named `photo_sizes[`_sizeName_`]` for each custom photo
size. The previous example in this format looks like this:

    "photo_size[preview]" : "120x120#"
 (optional) 
		- parameter  photo_sync_sizes: (formData) Synchronous photo sizes to upload. See [Photo Uploading & Resizings](#!/guide/photosizes).

The literal name for this parameter is `photo_sync_sizes[]`. This parameter can be specified
multiple times, once for each photo size that must be created before the request returns.

For example:

    "photo_sync_sizes[]=preview"
 (optional) 
		- parameter  su_id: (formData) User ID to update the Photo object on behalf of. The user must be the creator of the object.

The current login user must be an application admin to update a Photo object on
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

	public class func photosUpdateRequestBuilder(photoId: String,photo: NSURL,title: String? = nil,collectionName: String? = nil,collectionId: String? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,photoSizes: String? = nil,photoSyncSizes: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/photos/update.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"photo_id": photoId as AnyObject , 
		 	"photo": photo as AnyObject , 
		 	"title": title as AnyObject , 
		 	"collection_name": collectionName as AnyObject , 
		 	"collection_id": collectionId as AnyObject , 
		 	"tags": tags as AnyObject , 
		 	"custom_fields": customFields as AnyObject , 
		 	"acl_name": aclName as AnyObject , 
		 	"acl_id": aclId as AnyObject , 
		 	"photo_sizes": photoSizes as AnyObject , 
		 	"photo_sync_sizes": photoSyncSizes as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Delete a Photo
      Deletes a photo to which you have update access.

An application admin can delete any photo object.

	  - parameter photoId: (formData) ID of the photo to delete. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter suId: (formData) User ID to delete the Photo object on behalf of. The user must be the creator of the object.

The current login user must be an application admin to delete a Photo object on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func photosDelete(photoId: String , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photosDeleteRequestBuilder(photoId: photoId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete a Photo
      Deletes a photo to which you have update access.

An application admin can delete any photo object.

	  - DELETE /photos/delete.json
	  - Deletes a photo to which you have update access.

An application admin can delete any photo object.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  photo_id: (formData) ID of the photo to delete.  
		- parameter  su_id: (formData) User ID to delete the Photo object on behalf of. The user must be the creator of the object.

The current login user must be an application admin to delete a Photo object on
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

	public class func photosDeleteRequestBuilder(photoId: String,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/photos/delete.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"photo_id": photoId as AnyObject , 
		 	"su_id": suId as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Custom Query Photos
      Perform custom query of photos with sorting and paginating. Currently you can
not query or sort data stored inside array or hash in custom fields.

In addition to custom fields, here is a list of pre-defined fields
that can be queried and sorted:

*   `user_id: String`. Photo owner's user ID.
*   `title:  String`.  Photo title.
*   `tags_array: String`. Photo tags.
*   `ratings_average:  Number`.  Photo's average rating (see {@link Reviews}).
*   `ratings_count: Number`. Photo's total number of ratings (see {@link Reviews}).
*   `reviews_count: Number`. Photo's total number of reviews (see {@link Reviews}).
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
	  - parameter showUserLike: (query) If set to **true**, each Photo object in the response includes `"current_user_liked: true"`
 if the current user has liked the object. If the user has not liked the object, the 
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

	public class func photosQuery(page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , showUserLike: Bool? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photosQueryRequestBuilder(page: page, perPage: perPage, limit: limit, skip: skip, where_: where_, order: order, sel: sel, showUserLike: showUserLike, unsel: unsel, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Custom Query Photos
      Perform custom query of photos with sorting and paginating. Currently you can
not query or sort data stored inside array or hash in custom fields.

In addition to custom fields, here is a list of pre-defined fields
that can be queried and sorted:

*   `user_id: String`. Photo owner's user ID.
*   `title:  String`.  Photo title.
*   `tags_array: String`. Photo tags.
*   `ratings_average:  Number`.  Photo's average rating (see {@link Reviews}).
*   `ratings_count: Number`. Photo's total number of ratings (see {@link Reviews}).
*   `reviews_count: Number`. Photo's total number of reviews (see {@link Reviews}).
*   `created_at: Date`. Timestamp when the photo was created.
*   `updated_at: Date`. Timestamp when the photo was updated.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /photos/query.json
	  - Perform custom query of photos with sorting and paginating. Currently you can
not query or sort data stored inside array or hash in custom fields.

In addition to custom fields, here is a list of pre-defined fields
that can be queried and sorted:

*   `user_id: String`. Photo owner's user ID.
*   `title:  String`.  Photo title.
*   `tags_array: String`. Photo tags.
*   `ratings_average:  Number`.  Photo's average rating (see {@link Reviews}).
*   `ratings_count: Number`. Photo's total number of ratings (see {@link Reviews}).
*   `reviews_count: Number`. Photo's total number of reviews (see {@link Reviews}).
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
		- parameter  show_user_like: (query) If set to **true**, each Photo object in the response includes `"current_user_liked: true"`
 if the current user has liked the object. If the user has not liked the object, the 
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

	public class func photosQueryRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,showUserLike: Bool? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/photos/query.json"
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
	  Deletes multiple Photos objects.
      Deletes Photos objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Photos objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.                

You must be an application admin to run this command.

	  - parameter where_: (formData) Encoded JSON object that specifies constraint values for Photos objects to delete.
If not specified, all Photos objects are deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func photosBatchDelete(where_: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photosBatchDeleteRequestBuilder(where_: where_).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Deletes multiple Photos objects.
      Deletes Photos objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Photos objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.                

You must be an application admin to run this command.

	  - DELETE /photos/batch_delete.json
	  - Deletes Photos objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Photos objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.                

You must be an application admin to run this command.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  where: (formData) Encoded JSON object that specifies constraint values for Photos objects to delete.
If not specified, all Photos objects are deleted.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func photosBatchDeleteRequestBuilder(where_: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/photos/batch_delete.json"
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
	  Retrieves the total number of Photo objects.
      Retrieves the total number of Photo objects.
	*/

	public class func photosCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		photosCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of Photo objects.
      Retrieves the total number of Photo objects.
	  - GET /photos/count.json
	  - Retrieves the total number of Photo objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func photosCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/photos/count.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
}//
