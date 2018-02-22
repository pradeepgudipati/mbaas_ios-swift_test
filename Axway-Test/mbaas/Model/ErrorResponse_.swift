// /Model/ErrorResponse_.swift
 

import Foundation


public class ErrorResponse_: JSONEncodable {

	public var  status: String?
	public var  code: Int?
	public var  message: String?
	public var  methodName: String?

	// MARK: JSONEncodable
	func encodeToJSON() -> AnyObject {
		var nillableDictionary = [String : AnyObject?]()
		nillableDictionary["status"] = self.status?.encodeToJSON()
		nillableDictionary["code"] = self.code?.encodeToJSON()
		nillableDictionary["message"] = self.message?.encodeToJSON()
		nillableDictionary["method_name"] = self.methodName?.encodeToJSON()

		let dictionary: [String: AnyObject] = APIHelper.rejectNil(source: nillableDictionary as [String: AnyObject?]) ?? [:]
		return dictionary as AnyObject
	}

    public convenience init( status: String?, code: Int?, message: String?, methodName: String?) {
        self.init()
		self.status = status
		self.code = code
		self.message = message
		self.methodName = methodName
	}
}
