// /Apis/AppsAPI.swift
 

import Foundation

public class AppsAPI: APIBase { 
	/**
	  Create an ArrowDB app
      
	  - parameter name: (formData) App name (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter description: (formData) App's description (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter ct: (query) App's description (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter orgId: (formData) Particular organization id. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func appsAppsCreate(ct: String? = nil , name: String? = nil , description: String? = nil , orgId: String? = nil ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		appsAppsCreateRequestBuilder(ct: ct, name: name, description: description, orgId: orgId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Create an ArrowDB app
      
	  - POST /apps/create.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) App name (optional) 
		- parameter  description: (formData) App's description (optional) 
		- parameter  ct: (query) App's description (optional) 
		- parameter  org_id: (formData) Particular organization id. (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func appsAppsCreateRequestBuilder(ct: String? = nil,name: String? = nil,description: String? = nil,orgId: String? = nil) -> RequestBuilder<SuccessResponse> { 
		let path = "/apps/create.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"ct": ct as AnyObject, ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Show an ArrowDB app's details
      
	*/

	public class func appsAppsShow( completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		appsAppsShowRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Show an ArrowDB app's details
      
	  - GET /apps/show.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func appsAppsShowRequestBuilder() -> RequestBuilder<SuccessResponse> { 
		let path = "/apps/show.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Update an ArrowDB app
      
	  - parameter name: (formData) App name. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter description: (formData) App description. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter friendsTwoWay: (formData) Friend Request Type. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter allowUserCreation: (formData) Allow user creation in the app. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter newUserVerification: (formData) New User Email Verification (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter secureIdentity: (formData) false : api, true : auth secure identity server. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter orgId: (formData) Particular organization id. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func appsAppsUpdate(name: String? = nil , description: String? = nil , friendsTwoWay: Bool? = nil , allowUserCreation: Bool? = nil , newUserVerification: Bool? = nil , secureIdentity: Bool? = nil , orgId: String? = nil ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		appsAppsUpdateRequestBuilder(name: name, description: description, friendsTwoWay: friendsTwoWay, allowUserCreation: allowUserCreation, newUserVerification: newUserVerification, secureIdentity: secureIdentity, orgId: orgId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Update an ArrowDB app
      
	  - PUT /apps/update.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) App name. (optional) 
		- parameter  description: (formData) App description. (optional) 
		- parameter  friends_two_way: (formData) Friend Request Type. (optional) 
		- parameter  allow_user_creation: (formData) Allow user creation in the app. (optional) 
		- parameter  new_user_verification: (formData) New User Email Verification (optional) 
		- parameter  secure_identity: (formData) false : api, true : auth secure identity server. (optional) 
		- parameter  org_id: (formData) Particular organization id. (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func appsAppsUpdateRequestBuilder(name: String? = nil,description: String? = nil,friendsTwoWay: Bool? = nil,allowUserCreation: Bool? = nil,newUserVerification: Bool? = nil,secureIdentity: Bool? = nil,orgId: String? = nil) -> RequestBuilder<SuccessResponse> { 
		let path = "/apps/update.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"name": name as AnyObject , 
		 	"description": description as AnyObject , 
		 	"friends_two_way": friendsTwoWay as AnyObject , 
		 	"allow_user_creation": allowUserCreation as AnyObject , 
		 	"new_user_verification": newUserVerification as AnyObject , 
		 	"secure_identity": secureIdentity as AnyObject , 
		 	"org_id": orgId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Count app's objects.
      
	*/

	public class func appsAppsCountObjects( completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		appsAppsCountObjectsRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Count app's objects.
      
	  - GET /apps/app_object_counts.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func appsAppsCountObjectsRequestBuilder() -> RequestBuilder<SuccessResponse> { 
		let path = "/apps/app_object_counts.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Remove an apple certificate on an app
      
	*/

	public class func appsRemoveAppleCertificates( completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		appsRemoveAppleCertificatesRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Remove an apple certificate on an app
      
	  - DELETE /apps/remove_apple_certificates.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func appsRemoveAppleCertificatesRequestBuilder() -> RequestBuilder<SuccessResponse> { 
		let path = "/apps/remove_apple_certificates.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Set an apple certificate on an app.
      
	  - parameter certificateDev: (formData) Dev certificate file. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter devCertPassword: (formData) Password for dev certificate file. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter certificateProd: (formData) Prod certificate file. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter productionCertPassword: (formData) Password for prod certificate file. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func appsSetAppleCertificates(certificateDev: NSURL? = nil , devCertPassword: String? = nil , certificateProd: NSURL? = nil , productionCertPassword: String? = nil ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		appsSetAppleCertificatesRequestBuilder(certificateDev: certificateDev, devCertPassword: devCertPassword, certificateProd: certificateProd, productionCertPassword: productionCertPassword).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Set an apple certificate on an app.
      
	  - PUT /apps/set_apple_certificates.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  certificate_dev: (formData) Dev certificate file. (optional) 
		- parameter  dev_cert_password: (formData) Password for dev certificate file. (optional) 
		- parameter  certificate_prod: (formData) Prod certificate file. (optional) 
		- parameter  production_cert_password: (formData) Password for prod certificate file. (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func appsSetAppleCertificatesRequestBuilder(certificateDev: NSURL? = nil,devCertPassword: String? = nil,certificateProd: NSURL? = nil,productionCertPassword: String? = nil) -> RequestBuilder<SuccessResponse> { 
		let path = "/apps/set_apple_certificates.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"certificate_dev": certificateDev as AnyObject , 
		 	"dev_cert_password": devCertPassword as AnyObject , 
		 	"certificate_prod": certificateProd as AnyObject , 
		 	"production_cert_password": productionCertPassword as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Set an android settings on an app.
      
	  - parameter androidAppPackage: (formData)  (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter androidGcmApikey: (formData)  (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter androidGcmSenderId: (formData)  (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func appsSetAndroidCertificate(androidAppPackage: String? = nil , androidGcmApikey: String? = nil , androidGcmSenderId: String? = nil ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		appsSetAndroidCertificateRequestBuilder(androidAppPackage: androidAppPackage, androidGcmApikey: androidGcmApikey, androidGcmSenderId: androidGcmSenderId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Set an android settings on an app.
      
	  - PUT /apps/set_android_certificate.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  android_app_package: (formData)  (optional) 
		- parameter  android_gcm_apikey: (formData)  (optional) 
		- parameter  android_gcm_sender_id: (formData)  (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func appsSetAndroidCertificateRequestBuilder(androidAppPackage: String? = nil,androidGcmApikey: String? = nil,androidGcmSenderId: String? = nil) -> RequestBuilder<SuccessResponse> { 
		let path = "/apps/set_android_certificate.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"android_app_package": androidAppPackage as AnyObject , 
		 	"android_gcm_apikey": androidGcmApikey as AnyObject , 
		 	"android_gcm_sender_id": androidGcmSenderId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Set a windows push settings on an app.
      
	  - parameter wnsSid: (formData)  (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter wnsClientSecret: (formData)  (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func appsSetWindowsCertificate(wnsSid: String? = nil , wnsClientSecret: String? = nil ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		appsSetWindowsCertificateRequestBuilder(wnsSid: wnsSid, wnsClientSecret: wnsClientSecret).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Set a windows push settings on an app.
      
	  - PUT /apps/set_windows_certificate.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  wns_sid: (formData)  (optional) 
		- parameter  wns_client_secret: (formData)  (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func appsSetWindowsCertificateRequestBuilder(wnsSid: String? = nil,wnsClientSecret: String? = nil) -> RequestBuilder<SuccessResponse> { 
		let path = "/apps/set_windows_certificate.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"wns_sid": wnsSid as AnyObject , 
		 	"wns_client_secret": wnsClientSecret as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Delete an app or apps.
      
	  - parameter groupId: (formData) Note that it should take either group_id or app_id, not both. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter appId: (formData) Note that it should take either group_id or app_id, not both. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func appsAppsDelete(groupId: String? = nil , appId: String? = nil ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		appsAppsDeleteRequestBuilder(groupId: groupId, appId: appId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete an app or apps.
      
	  - DELETE /apps/delete.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  group_id: (formData) Note that it should take either group_id or app_id, not both. (optional) 
		- parameter  app_id: (formData) Note that it should take either group_id or app_id, not both. (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func appsAppsDeleteRequestBuilder(groupId: String? = nil,appId: String? = nil) -> RequestBuilder<SuccessResponse> { 
		let path = "/apps/delete.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"group_id": groupId as AnyObject , 
		 	"app_id": appId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Delete an app data.
      
	  - parameter appId: (formData) App id. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func appsAppsDeleteData(appId: String? = nil ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		appsAppsDeleteDataRequestBuilder(appId: appId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Delete an app data.
      
	  - DELETE /apps/delete/data.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  app_id: (formData) App id. (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func appsAppsDeleteDataRequestBuilder(appId: String? = nil) -> RequestBuilder<SuccessResponse> { 
		let path = "/apps/delete/data.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"app_id": appId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Set SMTP or MessageGears settings for an app, app email will be delivered through SMTP or MessageGears.
      
	  - parameter address: (formData) SMTP server Address. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter username: (formData) SMTP username. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter password: (formData) SMTP password. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter tls: (formData) SMTP TLS support. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter port: (formData) SMTP server port. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter authentication: (formData) SMTP: Valid valud is Plain, Login or MD5. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter domain: (formData) SMTP: Domain. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter provider: (formData) Email provider, it 's "smtp" by default if not provided. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter accountid: (query) App key. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter apikey: (query) App key. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter endpoint: (query) App key. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter senderEmail: (query) MessageGears: It's required by MessageGears, should be a valid email address, such as "acs_support@appcelerator.com". (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter senderName: (query) MessageGears: Such as "Appcelerator Cloud Service Support Team". (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter devMode: (formData)  (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter replacementEmail: (formData) Default Sender Email. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func appsAppsEmailsSetting(accountid: String? = nil , apikey: String? = nil , endpoint: String? = nil , senderEmail: String? = nil , senderName: String? = nil , address: String? = nil , username: String? = nil , password: String? = nil , tls: Bool? = nil , port: String? = nil , authentication: String? = nil , domain: String? = nil , provider: String? = nil , devMode: Bool? = nil , replacementEmail: String? = nil ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		appsAppsEmailsSettingRequestBuilder(accountid: accountid, apikey: apikey, endpoint: endpoint, senderEmail: senderEmail, senderName: senderName, address: address, username: username, password: password, tls: tls, port: port, authentication: authentication, domain: domain, provider: provider, devMode: devMode, replacementEmail: replacementEmail).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Set SMTP or MessageGears settings for an app, app email will be delivered through SMTP or MessageGears.
      
	  - PUT /apps/emails/setting.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  address: (formData) SMTP server Address. (optional) 
		- parameter  username: (formData) SMTP username. (optional) 
		- parameter  password: (formData) SMTP password. (optional) 
		- parameter  tls: (formData) SMTP TLS support. (optional) 
		- parameter  port: (formData) SMTP server port. (optional) 
		- parameter  authentication: (formData) SMTP: Valid valud is Plain, Login or MD5. (optional) 
		- parameter  domain: (formData) SMTP: Domain. (optional) 
		- parameter  provider: (formData) Email provider, it 's "smtp" by default if not provided. (optional) 
		- parameter  accountid: (query) App key. (optional) 
		- parameter  apikey: (query) App key. (optional) 
		- parameter  endpoint: (query) App key. (optional) 
		- parameter  sender_email: (query) MessageGears: It's required by MessageGears, should be a valid email address, such as "acs_support@appcelerator.com". (optional) 
		- parameter  sender_name: (query) MessageGears: Such as "Appcelerator Cloud Service Support Team". (optional) 
		- parameter  dev_mode: (formData)  (optional) 
		- parameter  replacement_email: (formData) Default Sender Email. (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func appsAppsEmailsSettingRequestBuilder(accountid: String? = nil,apikey: String? = nil,endpoint: String? = nil,senderEmail: String? = nil,senderName: String? = nil,address: String? = nil,username: String? = nil,password: String? = nil,tls: Bool? = nil,port: String? = nil,authentication: String? = nil,domain: String? = nil,provider: String? = nil,devMode: Bool? = nil,replacementEmail: String? = nil) -> RequestBuilder<SuccessResponse> { 
		let path = "/apps/emails/setting.json"
		let URLString = MbaasPreprodAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"accountid": accountid as AnyObject, 
			"apikey": apikey as AnyObject, 
			"endpoint": endpoint as AnyObject, 
			"sender_email": senderEmail as AnyObject, 
			"sender_name": senderName as AnyObject, ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasPreprodAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
