// /Model/ErrorResponse_.swift
 

import Foundation


public class ErrorResponse_: JSONEncodable {

	public var  meta: String?
	public var  response: String?

	// MARK: JSONEncodable
	func encodeToJSON() -> AnyObject {
		var nillableDictionary = [String : AnyObject?]()
		nillableDictionary["meta"] = self.meta?.encodeToJSON()
		nillableDictionary["response"] = self.response?.encodeToJSON()

		let dictionary: [String: AnyObject] = APIHelper.rejectNil(source: nillableDictionary as [String: AnyObject?]) ?? [:]
		return dictionary as AnyObject
	}

    public convenience init( meta: String?, response: String?) {
        self.init()
		self.meta = meta
		self.response = response
	}
}
