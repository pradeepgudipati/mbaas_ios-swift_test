// /Apis/UsersAPI.swift
 

import Foundation

public class UsersAPI: APIBase { 
	/**
	  Creates a user.
      Creates a new user.

When creating a user, you must specify either:

*   username
*   email address, first name, and last name

A user can have both an email address and username specified. However, if username
is omitted, email address, first name and last name are required.

For regular users (non-admin users), after successully executing this command, you will be logged
in as the new user and the session ID will be associated with the newly created user.  For
example, when user A creates user B, user A is now logged in as user B and user A's session
ID belongs to user B.

For admin users, you will still be logged in as the admin user.

	  - parameter email: (formData) User's email address. Required if `username` is not specified. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter username: (formData) User's login name. Required if `email` is not specified.

If `username` is not specified, `email`, `first_name`, and `last_name` must be included.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter password: (formData) User's password. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter passwordConfirmation: (formData) Copy of user's password for confirmation. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter firstName: (formData) User's first name. Required when `username` is not provided. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter lastName: (formData) User's last name. Required when `username` is not provided. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New photo to attach as the primary photo for the user.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of an existing photo to attach as the primary photo for the user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma separated list of tags for this user.
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
	  - parameter suId: (formData) User ID to create this user on behalf of.

The current login user must be an application admin to create a user on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter role: (formData) String representation of user role, for example, "teacher". (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter template: (formData) Send a congratulation email to notify that the user has been created successfully.

You need to create an email template and pass the template name.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter confirmationTemplate: (formData) If "New User Email Verification" is enabled for the application, ArrowDB sends a confirmation email to
the user.

If you don't pass the `confirmation_template` parameter, then ArrowDB sends a default
confirmation email.

If you wish to use your custom email body, you can create a email template and pass
the template name. Your email template must contain the following URL to allow users
to be redirected to Appcelerator Cloud Services email verification page:

     https://cloud.appcelerator.com/users/confirmation?key=<key>&confirmation_token=<confirmation_token>

If you have your own website that talks to Appcelerator Cloud Services backend and
wish to use custom URL, you must provide a URL with the following format:

     https://<your_url.com>/<your_method>?key=<key>&confirmation_token=<confirmation_token>

When a user visits the above URL, you call the ArrowDB `users/confirm_user.json` method to 
confirm the user internally from your web server and you must append the query parameter `&ct=enterprise`
to the end of the URL:

     GET https://api.cloud.appcelerator.com/v1/users/confirm_user.json?confirmation_token=<confirmation_token>&key=<Your App Key>&ct=enterprise
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func usersCreate(email: String? = nil , username: String? = nil , password: String , passwordConfirmation: String , firstName: String? = nil , lastName: String? = nil , photo: NSURL? = nil , photoId: String? = nil , tags: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil , role: String? = nil , template: String? = nil , confirmationTemplate: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		usersCreateRequestBuilder(email: email, username: username, password: password, passwordConfirmation: passwordConfirmation, firstName: firstName, lastName: lastName, photo: photo, photoId: photoId, tags: tags, customFields: customFields, aclName: aclName, aclId: aclId, suId: suId, role: role, template: template, confirmationTemplate: confirmationTemplate, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Creates a user.
      Creates a new user.

When creating a user, you must specify either:

*   username
*   email address, first name, and last name

A user can have both an email address and username specified. However, if username
is omitted, email address, first name and last name are required.

For regular users (non-admin users), after successully executing this command, you will be logged
in as the new user and the session ID will be associated with the newly created user.  For
example, when user A creates user B, user A is now logged in as user B and user A's session
ID belongs to user B.

For admin users, you will still be logged in as the admin user.

	  - POST /users/create.json
	  - Creates a new user.

When creating a user, you must specify either:

*   username
*   email address, first name, and last name

A user can have both an email address and username specified. However, if username
is omitted, email address, first name and last name are required.

For regular users (non-admin users), after successully executing this command, you will be logged
in as the new user and the session ID will be associated with the newly created user.  For
example, when user A creates user B, user A is now logged in as user B and user A's session
ID belongs to user B.

For admin users, you will still be logged in as the admin user.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  email: (formData) User's email address. Required if `username` is not specified. (optional) 
		- parameter  username: (formData) User's login name. Required if `email` is not specified.

If `username` is not specified, `email`, `first_name`, and `last_name` must be included.
 (optional) 
		- parameter  password: (formData) User's password.  
		- parameter  password_confirmation: (formData) Copy of user's password for confirmation.  
		- parameter  first_name: (formData) User's first name. Required when `username` is not provided. (optional) 
		- parameter  last_name: (formData) User's last name. Required when `username` is not provided. (optional) 
		- parameter  photo: (formData) New photo to attach as the primary photo for the user.

When you use the `photo` parameter to attach a new photo, you can use the
[custom resize and sync options](#!/guide/photosizes).
 (optional) 
		- parameter  photo_id: (formData) ID of an existing photo to attach as the primary photo for the user.
 (optional) 
		- parameter  tags: (formData) Comma separated list of tags for this user.
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
		- parameter  su_id: (formData) User ID to create this user on behalf of.

The current login user must be an application admin to create a user on
behalf of another user.
 (optional) 
		- parameter  role: (formData) String representation of user role, for example, "teacher". (optional) 
		- parameter  template: (formData) Send a congratulation email to notify that the user has been created successfully.

You need to create an email template and pass the template name.
 (optional) 
		- parameter  confirmation_template: (formData) If "New User Email Verification" is enabled for the application, ArrowDB sends a confirmation email to
the user.

If you don't pass the `confirmation_template` parameter, then ArrowDB sends a default
confirmation email.

If you wish to use your custom email body, you can create a email template and pass
the template name. Your email template must contain the following URL to allow users
to be redirected to Appcelerator Cloud Services email verification page:

     https://cloud.appcelerator.com/users/confirmation?key=<key>&confirmation_token=<confirmation_token>

If you have your own website that talks to Appcelerator Cloud Services backend and
wish to use custom URL, you must provide a URL with the following format:

     https://<your_url.com>/<your_method>?key=<key>&confirmation_token=<confirmation_token>

When a user visits the above URL, you call the ArrowDB `users/confirm_user.json` method to 
confirm the user internally from your web server and you must append the query parameter `&ct=enterprise`
to the end of the URL:

     GET https://api.cloud.appcelerator.com/v1/users/confirm_user.json?confirmation_token=<confirmation_token>&key=<Your App Key>&ct=enterprise
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func usersCreateRequestBuilder(email: String? = nil,username: String? = nil,password: String,passwordConfirmation: String,firstName: String? = nil,lastName: String? = nil,photo: NSURL? = nil,photoId: String? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil,role: String? = nil,template: String? = nil,confirmationTemplate: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/users/create.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"email": email as AnyObject , 
		 	"username": username as AnyObject , 
		 	"password": password as AnyObject , 
		 	"password_confirmation": passwordConfirmation as AnyObject , 
		 	"first_name": firstName as AnyObject , 
		 	"last_name": lastName as AnyObject , 
		 	//"photo": photo as AnyObject ,
		 	//"photo_id": photoId as AnyObject ,
		 	"tags": tags as AnyObject , 
		 	//"custom_fields": customFields as AnyObject ,
		 	//"acl_name": aclName as AnyObject ,
		 	//"acl_id": aclId as AnyObject ,
		 	"su_id": suId as AnyObject , 
		 	"role": role as AnyObject , 
		 	"template": template as AnyObject , 
		 	"confirmation_template": confirmationTemplate as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		let customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Logs user into the system
      
	  - parameter login: (formData) The user name for login 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter password: (formData) The password for login in clear text 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func usersLoginUser(login: String , password: String ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		usersLoginUserRequestBuilder(login: login, password: password).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Logs user into the system
      
	  - POST /users/login.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  login: (formData) The user name for login  
		- parameter  password: (formData) The password for login in clear text  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func usersLoginUserRequestBuilder(login: String,password: String) -> RequestBuilder<[String:Any]> { 
		let path = "/users/login.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"login": login as AnyObject , 
		 	"password": password as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		let customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Log out a user.
      
	*/

	public class func usersLogoutUser( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		usersLogoutUserRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Log out a user.
      
	  - GET /users/logout.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func usersLogoutUserRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/users/logout.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Show Current User Profile
      Shows both public and private user information about the user who is
currently logged in.

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

	public class func usersShowMe(responseJsonDepth: NSNumber? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		usersShowMeRequestBuilder(responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show Current User Profile
      Shows both public and private user information about the user who is
currently logged in.

	  - GET /users/show/me.json
	  - Shows both public and private user information about the user who is
currently logged in.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
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

	public class func usersShowMeRequestBuilder(responseJsonDepth: NSNumber? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/users/show/me.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"response_json_depth": responseJsonDepth as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
      Any of the same parameters as {@link Users#create create} can be
used to update the current user. If `password` is updated then
`password_confirmation` must be sent as well.

	  - parameter email: (formData) Email address. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter username: (formData) User name. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter password: (formData) Password. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter passwordConfirmation: (formData) Password. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter firstName: (formData) First name. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter lastName: (formData) First name. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photo: (formData) New photo to assign as the user's primary photo.

When you use `photo` parameter to attach a new photo, you can use it with
[custom resize and sync options](/docs/photosizes)

To remove primary photo, simply set "photo=" or "photo_id=". If the original
photo was created by using `photo` parameter, the photo will be deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter photoId: (formData) ID of an existing photo to use as the user's primary photo.

To remove primary photo, simply set "photo=" or "photo_id=". If the original
photo was created by using `photo` parameter, the photo will be deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tags: (formData) Comma separated tags, overwrites the existing tags. For example, "hiking,swimming".
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter customFields: (formData) User-defined data. See [Custom Data Fields](/docs/customfields).
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
	  - parameter suId: (formData) User ID to update this user on behalf of.

The current login user must be an application admin to update a user on
behalf of another user.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func usersUpdate(email: String? = nil , username: String? = nil , password: String? = nil , passwordConfirmation: String? = nil , firstName: String? = nil , lastName: String? = nil , photo: NSURL? = nil , photoId: String? = nil , tags: String? = nil , customFields: String? = nil , aclName: String? = nil , aclId: String? = nil , suId: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		usersUpdateRequestBuilder(email: email, username: username, password: password, passwordConfirmation: passwordConfirmation, firstName: firstName, lastName: lastName, photo: photo, photoId: photoId, tags: tags, customFields: customFields, aclName: aclName, aclId: aclId, suId: suId, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
      Any of the same parameters as {@link Users#create create} can be
used to update the current user. If `password` is updated then
`password_confirmation` must be sent as well.

	  - PUT /users/update.json
	  - Any of the same parameters as {@link Users#create create} can be
used to update the current user. If `password` is updated then
`password_confirmation` must be sent as well.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  email: (formData) Email address. (optional) 
		- parameter  username: (formData) User name. (optional) 
		- parameter  password: (formData) Password. (optional) 
		- parameter  password_confirmation: (formData) Password. (optional) 
		- parameter  first_name: (formData) First name. (optional) 
		- parameter  last_name: (formData) First name. (optional) 
		- parameter  photo: (formData) New photo to assign as the user's primary photo.

When you use `photo` parameter to attach a new photo, you can use it with
[custom resize and sync options](/docs/photosizes)

To remove primary photo, simply set "photo=" or "photo_id=". If the original
photo was created by using `photo` parameter, the photo will be deleted.
 (optional) 
		- parameter  photo_id: (formData) ID of an existing photo to use as the user's primary photo.

To remove primary photo, simply set "photo=" or "photo_id=". If the original
photo was created by using `photo` parameter, the photo will be deleted.
 (optional) 
		- parameter  tags: (formData) Comma separated tags, overwrites the existing tags. For example, "hiking,swimming".
 (optional) 
		- parameter  custom_fields: (formData) User-defined data. See [Custom Data Fields](/docs/customfields).
 (optional) 
		- parameter  acl_name: (formData) Name of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  acl_id: (formData) ID of an {@link ACLs} to associate with this object.

An ACL can be specified using `acl_name` or `acl_id`. The two parameters are
mutually exclusive.
 (optional) 
		- parameter  su_id: (formData) User ID to update this user on behalf of.

The current login user must be an application admin to update a user on
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

	public class func usersUpdateRequestBuilder(email: String? = nil,username: String? = nil,password: String? = nil,passwordConfirmation: String? = nil,firstName: String? = nil,lastName: String? = nil,photo: NSURL? = nil,photoId: String? = nil,tags: String? = nil,customFields: String? = nil,aclName: String? = nil,aclId: String? = nil,suId: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/users/update.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"email": email as AnyObject , 
		 	"username": username as AnyObject , 
		 	"password": password as AnyObject , 
		 	"password_confirmation": passwordConfirmation as AnyObject , 
		 	"first_name": firstName as AnyObject , 
		 	"last_name": lastName as AnyObject , 
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
	/**
	  Show User Profile
      Shows public user information. For private information about the currently
logged in user, see {@link Users#show_me Show Logged In User Info}.

	  - parameter userId: (query) User ID of the user to show. Either `user_id` or `user_ids` must be specified.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter userIds: (query) Comma-separated list of user IDs to show. Either `user_id` or `user_ids` must be specified.
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
	  - parameter showUserLike: (query) If set to **true** the User object in the response will include `"current_user_liked: true"`
if the current user has liked the object. If the user has not liked the object, the 
`current_user_liked` field is not included in the response.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func usersShow(userId: String? = nil , userIds: String? = nil , responseJsonDepth: NSNumber? = nil , showUserLike: Bool? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		usersShowRequestBuilder(userId: userId, userIds: userIds, responseJsonDepth: responseJsonDepth, showUserLike: showUserLike, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show User Profile
      Shows public user information. For private information about the currently
logged in user, see {@link Users#show_me Show Logged In User Info}.

	  - GET /users/show.json
	  - Shows public user information. For private information about the currently
logged in user, see {@link Users#show_me Show Logged In User Info}.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  user_id: (query) User ID of the user to show. Either `user_id` or `user_ids` must be specified.
 (optional) 
		- parameter  user_ids: (query) Comma-separated list of user IDs to show. Either `user_id` or `user_ids` must be specified.
 (optional) 
		- parameter  response_json_depth: (query) Nested object depth level counts in response json.

In order to reduce server API calls from an application, the response json may
include not just the objects that are being queried/searched, but also with
some important data related to the returning objects such as object's owner or
referencing objects.

Default is 1, valid range is 1 to 8.
 (optional) 
		- parameter  show_user_like: (query) If set to **true** the User object in the response will include `"current_user_liked: true"`
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

	public class func usersShowRequestBuilder(userId: String? = nil,userIds: String? = nil,responseJsonDepth: NSNumber? = nil,showUserLike: Bool? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/users/show.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"user_id": userId as AnyObject, 
			"user_ids": userIds as AnyObject, 
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
	  Search Users
      Returns the list of users that have been added to the app, sorted by search
relevancy.

Optionally, `q` can be given to perform full text search on user's first name,
last name, email address, username and tags. For security reasons, when searching for {@link Users}
the {@link Users#email email} field is not returned in each Users object unless you have 
[admin access](#!/guide/admin_access).

For advanced custom search, see {@link Users#query query}.

	  - parameter page: (query) Request page number, default is 1. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter perPage: (query) Number of results per page, default is 10. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter q: (query) Space-separated list of keywords, used to perform full text search on first name, last name, email address,
username and tags fields.
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

	public class func usersSearch(page: NSNumber? = nil , perPage: NSNumber? = nil , q: String? = nil , responseJsonDepth: NSNumber? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		usersSearchRequestBuilder(page: page, perPage: perPage, q: q, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Search Users
      Returns the list of users that have been added to the app, sorted by search
relevancy.

Optionally, `q` can be given to perform full text search on user's first name,
last name, email address, username and tags. For security reasons, when searching for {@link Users}
the {@link Users#email email} field is not returned in each Users object unless you have 
[admin access](#!/guide/admin_access).

For advanced custom search, see {@link Users#query query}.

	  - GET /users/search.json
	  - Returns the list of users that have been added to the app, sorted by search
relevancy.

Optionally, `q` can be given to perform full text search on user's first name,
last name, email address, username and tags. For security reasons, when searching for {@link Users}
the {@link Users#email email} field is not returned in each Users object unless you have 
[admin access](#!/guide/admin_access).

For advanced custom search, see {@link Users#query query}.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  page: (query) Request page number, default is 1. (optional) 
		- parameter  per_page: (query) Number of results per page, default is 10. (optional) 
		- parameter  q: (query) Space-separated list of keywords, used to perform full text search on first name, last name, email address,
username and tags fields.
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

	public class func usersSearchRequestBuilder(page: NSNumber? = nil,perPage: NSNumber? = nil,q: String? = nil,responseJsonDepth: NSNumber? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/users/search.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"page": page as AnyObject, 
			"per_page": perPage as AnyObject, 
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
	  Custom Query of Users
      Custom query of Users objects with sorting and paginating. You can query on sort
based on the data in any of the standard User fields. You can also query and
sort data based on the values of any custom fields, if the values are simple JSON
values.

For security reasons, when querying for {@link Users} the {@link Users#email email} field is not returned
in each Users object unless you have [admin access](#!/guide/admin_access).

Currently you **cannot** sort or query based on data stored inside array or hash
objects in custom fields.

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
	  - parameter showUserLike: (query) If set to **true**, each User object in the response includes `"current_user_liked: true"`
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

	public class func usersQuery(page: Int32? = nil , perPage: Int32? = nil , limit: Int32? = nil , skip: Int32? = nil , where_: String? = nil , order: String? = nil , sel: String? = nil , showUserLike: Bool? = nil , unsel: String? = nil , responseJsonDepth: Int32? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		usersQueryRequestBuilder(page: page, perPage: perPage, limit: limit, skip: skip, where_: where_, order: order, sel: sel, showUserLike: showUserLike, responseJsonDepth: responseJsonDepth, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Custom Query of Users
      Custom query of Users objects with sorting and paginating. You can query on sort
based on the data in any of the standard User fields. You can also query and
sort data based on the values of any custom fields, if the values are simple JSON
values.

For security reasons, when querying for {@link Users} the {@link Users#email email} field is not returned
in each Users object unless you have [admin access](#!/guide/admin_access).

Currently you **cannot** sort or query based on data stored inside array or hash
objects in custom fields.

In ArrowDB 1.1.5 and later, you can paginate query results using `skip` and `limit` parameters, or by including
a `where` clause to limit the results to objects whose IDs fall within a specified range.
For details, see [Query Pagination](#!/guide/search_query-section-query-pagination).

For details about using the query parameters,
see the [Search and Query guide](#!/guide/search_query).

	  - GET /users/query.json
	  - Custom query of Users objects with sorting and paginating. You can query on sort
based on the data in any of the standard User fields. You can also query and
sort data based on the values of any custom fields, if the values are simple JSON
values.

For security reasons, when querying for {@link Users} the {@link Users#email email} field is not returned
in each Users object unless you have [admin access](#!/guide/admin_access).

Currently you **cannot** sort or query based on data stored inside array or hash
objects in custom fields.

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
		- parameter  show_user_like: (query) If set to **true**, each User object in the response includes `"current_user_liked: true"`
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

	public class func usersQueryRequestBuilder(page: Int32? = nil,perPage: Int32? = nil,limit: Int32? = nil,skip: Int32? = nil,where_: String? = nil,order: String? = nil,sel: String? = nil,showUserLike: Bool? = nil,unsel: String? = nil,responseJsonDepth: Int32? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/users/query.json"
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

		let customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Send a reset password email to User
      Sends an email to a user containing a link to recover a lost password. You can use the default
email template provided by ACS, or specify a [custom email template](http://docs.appcelerator.com/platform/latest/#!/guide/Managing_Email_Templates-section-37548619_ManagingEmailTemplates-Creatinganemailtemplate) 
that you have created. When using a custom email template, the email must contain a properly
formatted URL, as explained in the `template` method parameter documentation below.

You must also have configured your application's [email settings](http://docs.appcelerator.com/platform/latest/#!/guide/Configuring_Cloud_Services-section-39683049_ConfiguringCloudServices-Email) 
in Appcelerator Dashboard.

	  - parameter email: (query) Email address. Must match the user's registered email address. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter subject: (query) The default subject of the password reset email is "Password reset request for
<your app name>". If you wish to have your custom email subject, you can
provide it by setting the subject parameter
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter template: (query) If you wish to use your custom email body. You can create a email template and
pass the template name. The email must contain a properly formatted link to the password
reset URL on appcelerator.com, or a link on your own site, as follows:
<p>

To link directly to the password page, your email template must contain a link to the following
URL:

    https://dashboard.appcelerator.com/#/users/confirmation/<key>/<confirmation_token>

If you prefer the user to reset their password on your own website, rather than on appcelerator.com,
you must provide a URL with the following format:

    https://[your_url.com]/[your_method]?reset_password_token=<reset_password_token>

This page must cache the value of the `reset_password_token` parameter and present a form 
that allows the user to enter a new password and password confirmation.
When the user submits the form, the app server must make the following call to Appcelerator Cloud Services API to reset the
password, passing the original password reset token, the user's new password, and the password confirmation:

    GET https://api.cloud.appcelerator.com/v1/users/reset_password.json?key=<Your App Key>&reset_password_token=<reset_password_token>&password=<password> &password_confirmation=<password_confirmation>
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func usersRequestResetPassword(email: String , subject: String? = nil , template: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		usersRequestResetPasswordRequestBuilder(email: email, subject: subject, template: template, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Send a reset password email to User
      Sends an email to a user containing a link to recover a lost password. You can use the default
email template provided by ACS, or specify a [custom email template](http://docs.appcelerator.com/platform/latest/#!/guide/Managing_Email_Templates-section-37548619_ManagingEmailTemplates-Creatinganemailtemplate) 
that you have created. When using a custom email template, the email must contain a properly
formatted URL, as explained in the `template` method parameter documentation below.

You must also have configured your application's [email settings](http://docs.appcelerator.com/platform/latest/#!/guide/Configuring_Cloud_Services-section-39683049_ConfiguringCloudServices-Email) 
in Appcelerator Dashboard.

	  - GET /users/request_reset_password.json
	  - Sends an email to a user containing a link to recover a lost password. You can use the default
email template provided by ACS, or specify a [custom email template](http://docs.appcelerator.com/platform/latest/#!/guide/Managing_Email_Templates-section-37548619_ManagingEmailTemplates-Creatinganemailtemplate) 
that you have created. When using a custom email template, the email must contain a properly
formatted URL, as explained in the `template` method parameter documentation below.

You must also have configured your application's [email settings](http://docs.appcelerator.com/platform/latest/#!/guide/Configuring_Cloud_Services-section-39683049_ConfiguringCloudServices-Email) 
in Appcelerator Dashboard.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  email: (query) Email address. Must match the user's registered email address.  
		- parameter  subject: (query) The default subject of the password reset email is "Password reset request for
<your app name>". If you wish to have your custom email subject, you can
provide it by setting the subject parameter
 (optional) 
		- parameter  template: (query) If you wish to use your custom email body. You can create a email template and
pass the template name. The email must contain a properly formatted link to the password
reset URL on appcelerator.com, or a link on your own site, as follows:
<p>

To link directly to the password page, your email template must contain a link to the following
URL:

    https://dashboard.appcelerator.com/#/users/confirmation/<key>/<confirmation_token>

If you prefer the user to reset their password on your own website, rather than on appcelerator.com,
you must provide a URL with the following format:

    https://[your_url.com]/[your_method]?reset_password_token=<reset_password_token>

This page must cache the value of the `reset_password_token` parameter and present a form 
that allows the user to enter a new password and password confirmation.
When the user submits the form, the app server must make the following call to Appcelerator Cloud Services API to reset the
password, passing the original password reset token, the user's new password, and the password confirmation:

    GET https://api.cloud.appcelerator.com/v1/users/reset_password.json?key=<Your App Key>&reset_password_token=<reset_password_token>&password=<password> &password_confirmation=<password_confirmation>
 (optional) 
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func usersRequestResetPasswordRequestBuilder(email: String,subject: String? = nil,template: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/users/request_reset_password.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"email": email as AnyObject, 
			"subject": subject as AnyObject, 
			"template": template as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Re-send user email verification.
      If you enabled new user account email verification in your App settings, all
new users will receive an email containing instructions to activate their
account. You can use this API to re-send user verification email.

	  - parameter email: (query) Email must match user's registered email. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter confirmationSubject: (query) The default subject of the email verification is "Email Verification
Instructions for <your app name>". If you wish to have your custom email
subject, you can provide it by setting the `confirmation_subject` parameter.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter confirmationTemplate: (query) If you wish to use your custom email body. You can create a email template and
pass the template name. Your email template must contain the following URL to
allow users to be redirected to Appcelerator Cloud Services email verification page:

    https://cloud.appcelerator.com/users/confirmation?key=<key>&confirmation_token=<confirmation_token>

If you have your own website that talks to Appcelerator Cloud Services backend
and wish to use custom URL, you must provide a URL with the following format:

    https://[your_url.com]/[your_method]?key=<key>&confirmation_token=<confirmation_token>

When a user visits the above URL, you make a call to Appcelerator Cloud
Services to confirm the user internally from your web server:

    GET https://api.cloud.appcelerator.com/v1/users/confirm_user.json?confirmation_token=<confirmation_token>&key=<Your App Key>
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func usersResendConfirmation(email: String , confirmationSubject: String? = nil , confirmationTemplate: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		usersResendConfirmationRequestBuilder(email: email, confirmationSubject: confirmationSubject, confirmationTemplate: confirmationTemplate, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Re-send user email verification.
      If you enabled new user account email verification in your App settings, all
new users will receive an email containing instructions to activate their
account. You can use this API to re-send user verification email.

	  - GET /users/resend_confirmation.json
	  - If you enabled new user account email verification in your App settings, all
new users will receive an email containing instructions to activate their
account. You can use this API to re-send user verification email.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  email: (query) Email must match user's registered email.  
		- parameter  confirmation_subject: (query) The default subject of the email verification is "Email Verification
Instructions for <your app name>". If you wish to have your custom email
subject, you can provide it by setting the `confirmation_subject` parameter.
 (optional) 
		- parameter  confirmation_template: (query) If you wish to use your custom email body. You can create a email template and
pass the template name. Your email template must contain the following URL to
allow users to be redirected to Appcelerator Cloud Services email verification page:

    https://cloud.appcelerator.com/users/confirmation?key=<key>&confirmation_token=<confirmation_token>

If you have your own website that talks to Appcelerator Cloud Services backend
and wish to use custom URL, you must provide a URL with the following format:

    https://[your_url.com]/[your_method]?key=<key>&confirmation_token=<confirmation_token>

When a user visits the above URL, you make a call to Appcelerator Cloud
Services to confirm the user internally from your web server:

    GET https://api.cloud.appcelerator.com/v1/users/confirm_user.json?confirmation_token=<confirmation_token>&key=<Your App Key>
 (optional) 
		- parameter  pretty_json: (query) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func usersResendConfirmationRequestBuilder(email: String,confirmationSubject: String? = nil,confirmationTemplate: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/users/resend_confirmation.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"email": email as AnyObject, 
			"confirmation_subject": confirmationSubject as AnyObject, 
			"confirmation_template": confirmationTemplate as AnyObject, 
			"pretty_json": prettyJson as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Retrieves the total number of User objects.
      Retrieves the total number of User objects.
	*/

	public class func usersCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		usersCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of User objects.
      Retrieves the total number of User objects.
	  - GET /users/count.json
	  - Retrieves the total number of User objects.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func usersCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/users/count.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Deletes multiple Users objects.
      Deletes Users objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Users objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.      

The {@link #photo primary photos} associated with the matched objects are 
not deleted. 

You must be an application admin to run this command.

	  - parameter where_: (formData) Encoded JSON object that specifies constraint values for Users objects to delete.
If not specified, all Users objects are deleted.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func usersBatchDelete(where_: String? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		usersBatchDeleteRequestBuilder(where_: where_).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Deletes multiple Users objects.
      Deletes Users objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Users objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.      

The {@link #photo primary photos} associated with the matched objects are 
not deleted. 

You must be an application admin to run this command.

	  - DELETE /users/batch_delete.json
	  - Deletes Users objects that match the query constraints provided in the `where` parameter.
If no `where` parameter is provided, all Users objects are deleted. 
Note that an HTTP 200 code (success)
is returned if the call completed successfully but the query matched no objects.

For performance reasons, the number of objects that can be deleted in a single batch delete 
operation is limited to 100,000.

The matched objects are deleted asynchronously in a separate process.      

The {@link #photo primary photos} associated with the matched objects are 
not deleted. 

You must be an application admin to run this command.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  where: (formData) Encoded JSON object that specifies constraint values for Users objects to delete.
If not specified, all Users objects are deleted.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func usersBatchDeleteRequestBuilder(where_: String? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/users/batch_delete.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"where": where_ as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
