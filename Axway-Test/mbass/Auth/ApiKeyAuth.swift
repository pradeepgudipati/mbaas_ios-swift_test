// /Auth/ApiKeyAuth.swift
 

import Foundation

/// Class that implements the API Key based authentication system
/// for swagger.io
/// Typically looks for api key in userdefaults and then asks the user to verify.
/// Once the key is input, they will be redirected to the screens etc.

class ApiKeyAuth: Authentication {

    /// API key for the application. 
    /// This can either be made a constant or varied in run time.
    var apiKey: String? {
        set (newValue) {
            do {
                if let confValue = newValue {
                    try keychain.set(confValue, key: "apiKey")
                } else {
                    try keychain.remove("apiKey")
                }
            } catch {
            }
        }
        get {
            do {
                let currentValue = try keychain.get("apiKey")
                return currentValue
            } catch {
                return nil
            }
        }
    }

    /// Location of the APIKey
    /// Can be `header` or `parameter`
    var location: String = "header"

    /// Parameter name for the api key
    /// This is Swagger generated.
    var paramName: String = ""

    override func checkLogin() -> Bool {
        return self.apiKey != nil
    }

    override  var authHeaders: [String: String] {
        get {
            if let confirmedApiKey = self.apiKey {
                return [self.paramName: confirmedApiKey]
            } else {
                return [:]
            }
        }
    }

    init(location: String, paramName: String) {
       self.location = location
       self.paramName = paramName
    }

  override func logoutUser() {
      self.apiKey = nil
    }
    override func parseUrl(url: NSURL) {
        return
    }
}
