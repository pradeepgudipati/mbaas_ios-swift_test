// /Auth/Authentication.swift
 

// Abstract class that stores and interacts with authentication flows

import UIKit

/**
	Extension for NSNotification.Name to represent Login details
*/
extension NSNotification.Name {
    public struct AuthNotification {
        public static let didLogin = NSNotification.Name("AuthNotificationDidLogin")
        public static let failedLogin = NSNotification.Name("AuthNotificationFailedLogin")
    }
}

/// #### Abstract class that interacts with authentication flows
/// Need to implement for 
/// 1. Basic authentication
/// 2. OAuth based authentication
/// 3. Api Key based authentication.
///
/// This will be a singleton class always. Possibility to make it a protocol

public class Authentication: NSObject {

    /**
		Authentication headers to be sent to the server use this to send the details to the server in additional headers 
        format
		
		- returns: Current implementation returns nothing. Further implementations will have to return the additional headers.
    */

    var keychain = Keychain(service:  String(format: "%@", Bundle.main.bundleIdentifier!))

    var authHeaders: [String: String] {
        get {
            return [:]
        }
    }
    /**
		Implementation for parsing the url
     
     	- parameter url: url called from the application.
    */
    func parseUrl(url: NSURL) {
        
    }

    /**
		Function that lets the user login.
    */
    func loginUser() {

    }

    /**
		Function that checks whether user is logged in
     
     	- returns: true/false for logged in and logged out
    */
    func checkLogin() -> Bool {
        return true
    }

    /**
		Function that lets the user log out.
    */
    func logoutUser() {

    }
}
