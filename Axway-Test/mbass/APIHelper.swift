// /APIHelper.swift
 

import Foundation

class APIHelper {
    static func rejectNil(source: [String: AnyObject?]) -> [String: AnyObject]? {
        var destination: [String: AnyObject] = [:]
        for (key, nillableValue) in source {
            if let value: AnyObject = nillableValue {
              if( value as! NSObject != NSNull()){ // Check for NSNull
                destination[key] = value
              }
            }
        }

        if destination.isEmpty {
            return nil
        }
        return destination
    }

    static func convertBoolToString(source: [String: AnyObject]?) -> [String:AnyObject]? {
        guard let source = source else {
            return nil
        }
        var destination: [String: AnyObject] = [:]
        let theTrue = NSNumber(value: true)
        let theFalse = NSNumber(value: false)
        for (key, value) in source {
            switch value {
            case let x where x === theTrue || x === theFalse:
                destination[key] = "\(value as! Bool)" as AnyObject?
            default:
                destination[key] = value
            }
        }
        return destination
    }

}
