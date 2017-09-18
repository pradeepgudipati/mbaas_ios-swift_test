// /Extensions.swift
 

import Foundation

extension Bool: JSONEncodable {
    func encodeToJSON() -> AnyObject { return self as AnyObject }
}

extension Float: JSONEncodable {
    func encodeToJSON() -> AnyObject { return self as AnyObject}
}

extension Int: JSONEncodable {
    func encodeToJSON() -> AnyObject { return self as AnyObject}
}

extension Int32: JSONEncodable {
    func encodeToJSON() -> AnyObject { return NSNumber(value: self) }
}

extension Int64: JSONEncodable {
    func encodeToJSON() -> AnyObject { return NSNumber(value: self) }
}

extension Double: JSONEncodable {
    func encodeToJSON() -> AnyObject { return self as AnyObject }
}
extension NSNumber: JSONEncodable {
    func encodeToJSON() -> AnyObject { return self as AnyObject }
}

extension String: JSONEncodable {
    func encodeToJSON() -> AnyObject { return self as AnyObject }
}

private func encodeIfPossible<T>(object: T) -> AnyObject {
    if object is JSONEncodable {
        return (object as! JSONEncodable).encodeToJSON()
    } else {
        return object as AnyObject
    }
}

extension Array: JSONEncodable {
    func encodeToJSON() -> AnyObject {
        return self.map(encodeIfPossible) as AnyObject
    }
}

extension Dictionary: JSONEncodable {
    func encodeToJSON() -> AnyObject {
        var dictionary = [NSObject: AnyObject]()
        for (key, value) in self {
            dictionary[key as! NSObject] = encodeIfPossible(object: value)
        }
        return dictionary as AnyObject
    }
}

extension NSData: JSONEncodable {
    func encodeToJSON() -> AnyObject {
        return self.base64EncodedString(options: NSData.Base64EncodingOptions()) as AnyObject
    }
}

private let dateFormatter: DateFormatter = {
    let fmt = DateFormatter()
    fmt.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    fmt.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
    return fmt
}()

extension Date: JSONEncodable {
    func encodeToJSON() -> AnyObject {
      return  dateFormatter.string(from: self) as AnyObject

    }
}

extension NSUUID: JSONEncodable {
    func encodeToJSON() -> AnyObject {
        return self.uuidString as AnyObject

    }
}
