// /APIHelper.swift
 

import Foundation

class APIHelper {
    static func rejectNil(source: [String: AnyObject?]) -> [String: AnyObject]? {
        var destination: [String: AnyObject] = [:]
        for (key, nillableValue) in source {
            if let value = nillableValue {
                if(!(value is NSNull)){
                destination[key] = value
                }
                else{
                    print("nnnnn")
                }
            }
            else{
                print("nil object")
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
