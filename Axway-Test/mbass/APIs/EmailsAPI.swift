// /Apis/EmailsAPI.swift
 

import Foundation

public class EmailsAPI: APIBase { 
	/**
	  Retrieves the total number of email templates.
      Retrieves the total number of email templates.
	*/

	public class func emailsCount( completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		emailsCountRequestBuilder().execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Retrieves the total number of email templates.
      Retrieves the total number of email templates.
	  - GET /email_templates/count.json
	  - Retrieves the total number of email templates.
	  - OAuth:
	    - type: oauth2
		- name:  api_key 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func emailsCountRequestBuilder() -> RequestBuilder<[String:Any]> { 
		let path = "/email_templates/count.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [:]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  true, authNames: ["api_key"])
	}
	/**
	  Send Emails
      Sends an email to a list of email addresses you specify. 

When sending an email, you specify the name of an email template created in Dashboard 
(see [Managing Email Templates](http://docs.appcelerator.com/platform/latest/#!/guide/Managing_Email_Templates)),
and one or more email recipients. You can optionally specify the email content type (
HTML, plain-text, or multipart), as well as values for any placeholder fields
defined by the template. The below examples demonstrate these concepts.

An email template's body can contain HTML-formatted or plain-text content 
, or both. When you send an email, you can specify whether the email should be sent 
as HTML, plain text, or multipart using the `content_type` parameter. 
A multipart email contains both the plain text and HTML versions; which 
version is displayed is determined by the recipient's email client.

If the `content_type` parameter is **not** provided in the request, the format
is automatically chosen based on the following rules:

* If the email template contains both HTML and plain-text bodies, it will be sent in a multipart format. 
* If the email template contains only an HTML body, it will be sent in an HTML format. 
* If the email template contains only a plain-text body. it will be sent in plain-text format.      

If the `content_type` parameter is provided in the request, then the following
must be true:

* If `content_type` is "html", then the email template must define an HTML body.
* If `content_type` is "plain", then the email template must define a plain text body.
* If `content_type` is "multipart", then the email template must define both HTML and plain text body.

	  - parameter template: (formData) Name of the email template you have created.
 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter recipients: (formData) Comma separated list of email addresses. 
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter contentType: (formData) Specifies the email's content-type. The following values are valid:

* "plain" &mdash; If specified, the email template must define a plain text body.
* "html" &mdash; If specified, the email template must define an HTML body.
* "multipart" &mdash; If specified, the email template must define both a plain text
   and HTML body.
   
See [Managing Email Templates](http://docs.appcelerator.com/platform/latest/#!/guide/Managing_Email_Templates)
for details on creating email templates.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter from: (formData) The sender's email address. 

**Notes**:
  
  * If you use Google as your SMTP server, the email will always be sent using the email account 
  you used to configure the SMTP service. 
  * Some SMTP service provider require the sender's email address to be present.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	  - parameter prettyJson: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional)
	  - parameter completion: completion handler to receive the data and the error objects
	*/

	public class func emailsEmailFromTemplate(template: String , recipients: String , contentType: String? = nil , from: String? = nil , prettyJson: Bool? = nil ,  completion: @escaping ((_ data: [String:Any]?, _ error: Error?) -> Void)) {
		emailsEmailFromTemplateRequestBuilder(template: template, recipients: recipients, contentType: contentType, from: from, prettyJson: prettyJson).execute { (response, error) -> Void in
			completion(response?.body, error)
		}
	}

	/**
	  Send Emails
      Sends an email to a list of email addresses you specify. 

When sending an email, you specify the name of an email template created in Dashboard 
(see [Managing Email Templates](http://docs.appcelerator.com/platform/latest/#!/guide/Managing_Email_Templates)),
and one or more email recipients. You can optionally specify the email content type (
HTML, plain-text, or multipart), as well as values for any placeholder fields
defined by the template. The below examples demonstrate these concepts.

An email template's body can contain HTML-formatted or plain-text content 
, or both. When you send an email, you can specify whether the email should be sent 
as HTML, plain text, or multipart using the `content_type` parameter. 
A multipart email contains both the plain text and HTML versions; which 
version is displayed is determined by the recipient's email client.

If the `content_type` parameter is **not** provided in the request, the format
is automatically chosen based on the following rules:

* If the email template contains both HTML and plain-text bodies, it will be sent in a multipart format. 
* If the email template contains only an HTML body, it will be sent in an HTML format. 
* If the email template contains only a plain-text body. it will be sent in plain-text format.      

If the `content_type` parameter is provided in the request, then the following
must be true:

* If `content_type` is "html", then the email template must define an HTML body.
* If `content_type` is "plain", then the email template must define a plain text body.
* If `content_type` is "multipart", then the email template must define both HTML and plain text body.

	  - POST /custom_mailer/email_from_template.json
	  - Sends an email to a list of email addresses you specify. 

When sending an email, you specify the name of an email template created in Dashboard 
(see [Managing Email Templates](http://docs.appcelerator.com/platform/latest/#!/guide/Managing_Email_Templates)),
and one or more email recipients. You can optionally specify the email content type (
HTML, plain-text, or multipart), as well as values for any placeholder fields
defined by the template. The below examples demonstrate these concepts.

An email template's body can contain HTML-formatted or plain-text content 
, or both. When you send an email, you can specify whether the email should be sent 
as HTML, plain text, or multipart using the `content_type` parameter. 
A multipart email contains both the plain text and HTML versions; which 
version is displayed is determined by the recipient's email client.

If the `content_type` parameter is **not** provided in the request, the format
is automatically chosen based on the following rules:

* If the email template contains both HTML and plain-text bodies, it will be sent in a multipart format. 
* If the email template contains only an HTML body, it will be sent in an HTML format. 
* If the email template contains only a plain-text body. it will be sent in plain-text format.      

If the `content_type` parameter is provided in the request, then the following
must be true:

* If `content_type` is "html", then the email template must define an HTML body.
* If `content_type` is "plain", then the email template must define a plain text body.
* If `content_type` is "multipart", then the email template must define both HTML and plain text body.

	  - OAuth:
	    - type: oauth2
		- name:  api_key 
		- parameter  template: (formData) Name of the email template you have created.
  
		- parameter  recipients: (formData) Comma separated list of email addresses.  
		- parameter  content_type: (formData) Specifies the email's content-type. The following values are valid:

* "plain" &mdash; If specified, the email template must define a plain text body.
* "html" &mdash; If specified, the email template must define an HTML body.
* "multipart" &mdash; If specified, the email template must define both a plain text
   and HTML body.
   
See [Managing Email Templates](http://docs.appcelerator.com/platform/latest/#!/guide/Managing_Email_Templates)
for details on creating email templates.
 (optional) 
		- parameter  from: (formData) The sender's email address. 

**Notes**:
  
  * If you use Google as your SMTP server, the email will always be sent using the email account 
  you used to configure the SMTP service. 
  * Some SMTP service provider require the sender's email address to be present.
 (optional) 
		- parameter  pretty_json: (formData) Determines if the JSON response is formatted for readability (`true`), or displayed on a
single line (`false`). Default is `false`.
 (optional) 
     	- externalDocs: 
			- description: ArrowDB/Push API Documentation 
			- url: http://docs.appcelerator.com/arrowdb/latest/#!/api

	  - returns: RequestBuilder<[String:Any]>
	*/

	public class func emailsEmailFromTemplateRequestBuilder(template: String,recipients: String,contentType: String? = nil,from: String? = nil,prettyJson: Bool? = nil) -> RequestBuilder<[String:Any]> { 
		let path = "/custom_mailer/email_from_template.json"
		let URLString = MbassAPI.sharedInstance.basePath + path
		let nillableParameters: [String:AnyObject?] = [
		 	"template": template as AnyObject , 
		 	"recipients": recipients as AnyObject , 
		 	"content_type": contentType as AnyObject , 
		 	"from": from as AnyObject , 
		 	"pretty_json": prettyJson as AnyObject ]
		let parameters = APIHelper.rejectNil(source: nillableParameters  as [String : AnyObject?])
		let convertedParameters = APIHelper.convertBoolToString(source: parameters)
		let requestBuilder: RequestBuilder<[String:Any]>.Type = MbassAPI.sharedInstance.requestBuilderFactory.getBuilder()

		var customHeadersDict : [String: String] = [:]



		return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, customHeader: customHeadersDict,isBody:  false, authNames: ["api_key"])
	}
}//
