// /Apis/EmailTemplateAPI.swift
 

import Foundation

public class EmailTemplateAPI: APIBase { 
	/**
	   Create an email template
      
	  - parameter name: (formData) Email template name. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter subject: (formData) Email template subject. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter body: (formData) Email template html body. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter plainBody: (formData) Email template plain text body. At least one of body and plain_body is required for one template. And body is to store html format email content, and plain_body is to store plain text email content.  (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func emailTemplateEmailTemplatesCreate(name: String , subject: String , body: String? = nil , plainBody: String? = nil ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		emailTemplateEmailTemplatesCreateRequestBuilder(name: name, subject: subject, body: body, plainBody: plainBody).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	   Create an email template
      
	  - POST /email_templates/create.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  name: (formData) Email template name.  
		- parameter  subject: (formData) Email template subject.  
		- parameter  body: (formData) Email template html body. (optional) 
		- parameter  plain_body: (formData) Email template plain text body. At least one of body and plain_body is required for one template. And body is to store html format email content, and plain_body is to store plain text email content.  (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func emailTemplateEmailTemplatesCreateRequestBuilder(name: String,subject: String,body: String? = nil,plainBody: String? = nil) -> RequestBuilder<SuccessResponse> { 
		let path = "/email_templates/create.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"name": name as AnyObject , 
		 	"subject": subject as AnyObject , 
		 	"body": body as AnyObject , 
		 	"plain_body": plainBody as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	   Update an email template
      
	  - parameter emailTemplateId: (formData) Email template id. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter name: (formData) Email template name. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter subject: (formData) Email template subject. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter body: (formData) Email template html body. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter plainBody: (formData) Email template plain text body. (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func emailTemplateEmailTemplatesUpdate(emailTemplateId: String , name: String? = nil , subject: String? = nil , body: String? = nil , plainBody: String? = nil ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		emailTemplateEmailTemplatesUpdateRequestBuilder(emailTemplateId: emailTemplateId, name: name, subject: subject, body: body, plainBody: plainBody).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	   Update an email template
      
	  - PUT /email_templates/update.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  email_template_id: (formData) Email template id.  
		- parameter  name: (formData) Email template name. (optional) 
		- parameter  subject: (formData) Email template subject. (optional) 
		- parameter  body: (formData) Email template html body. (optional) 
		- parameter  plain_body: (formData) Email template plain text body. (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func emailTemplateEmailTemplatesUpdateRequestBuilder(emailTemplateId: String,name: String? = nil,subject: String? = nil,body: String? = nil,plainBody: String? = nil) -> RequestBuilder<SuccessResponse> { 
		let path = "/email_templates/update.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"email_template_id": emailTemplateId as AnyObject , 
		 	"name": name as AnyObject , 
		 	"subject": subject as AnyObject , 
		 	"body": body as AnyObject , 
		 	"plain_body": plainBody as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "PUT", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	   Show an email template
      
	  - parameter emailTemplateId: (query) Email template id. 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func emailTemplateEmailTemplatesShow(emailTemplateId: String ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		emailTemplateEmailTemplatesShowRequestBuilder(emailTemplateId: emailTemplateId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	   Show an email template
      
	  - GET /email_templates/show.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  email_template_id: (query) Email template id.  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func emailTemplateEmailTemplatesShowRequestBuilder(emailTemplateId: String) -> RequestBuilder<SuccessResponse> { 
		let path = "/email_templates/show.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
			"email_template_id": emailTemplateId as AnyObject]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	   Delete an email template
      
	  - parameter emailTemplateId: (formData) Email template id. 
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func emailTemplateEmailTemplatesDelete(emailTemplateId: String ,  completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		emailTemplateEmailTemplatesDeleteRequestBuilder(emailTemplateId: emailTemplateId).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	   Delete an email template
      
	  - DELETE /email_templates/delete.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  email_template_id: (formData) Email template id.  
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func emailTemplateEmailTemplatesDeleteRequestBuilder(emailTemplateId: String) -> RequestBuilder<SuccessResponse> { 
		let path = "/email_templates/delete.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"email_template_id": emailTemplateId as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "DELETE", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
	/**
	  Query email templates
      
	*/

	public class func emailTemplateEmailTemplatesQuery( completion: @escaping ((_ data: SuccessResponse?, _ error: Error?) -> Void)) {
		emailTemplateEmailTemplatesQueryRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Query email templates
      
	  - GET /email_templates/query.json
	  - 
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<SuccessResponse>
	*/

	public class func emailTemplateEmailTemplatesQueryRequestBuilder() -> RequestBuilder<SuccessResponse> { 
		let path = "/email_templates/query.json"
		let URLString = MbaasAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<SuccessResponse>.Type = MbaasAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
}//
