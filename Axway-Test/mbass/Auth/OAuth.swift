// /Auth/OAuth.swift
 

import Foundation
import UIKit

// OAuth based authentication class. Handles OAuth based authentication

class OAuth: Authentication {

    /// Redirect url configured for OAuth authentication
    var redirectUri: String? = ""

    var clientId: String? {
        get {
            do {
                let currentValue = try keychain.get("oauthClientId")
                return currentValue
            } catch {
                return nil
            }
        }
        set(newValue) {
            do {
                if let confValue = newValue {
                    try keychain.set(confValue, key: "oauthClientId")
                } else {
                    try keychain.remove("oauthClientId")
                }
            } catch {}
        }
    }

    var clientSecret: String? {
        get {
            do {
                let currentValue = try keychain.get("oauthClientSecret")
                return currentValue
            } catch {
                return nil
            }
        }
        set(newValue) {
            do {
                if let confValue = newValue {
                    try keychain.set(confValue, key: "oauthClientSecret")
                } else {
                    try keychain.remove("oauthClientSecret")
                }
            } catch {}
        }
    }

    var authUrl: String?

    var tokenUrl: String?

    var scopes: String?

    init (_ authUrl: String, scopes: String? = nil, tokenUrl: String? = nil) {
        self.authUrl = authUrl
        self.scopes = scopes
        self.tokenUrl = tokenUrl
    }

    var oAuthUrl: String {
        get {
            var scopesString = ""
            if let confScopes = self.scopes {
                scopesString = confScopes
            }
            
            return "\(self.authUrl!)?client_id=\(self.clientId!)&redirect_uri=\(self.redirectUri!)://&response_type=token&scope=\(scopesString)"
        }
    }

    var authToken: String? {
        get {
            do {
                let hasKey = try keychain.contains("oauthKey")
                if hasKey {
                    let currentValue = try keychain.get("oauthKey")
                    return currentValue
                }
            } catch {
                return nil
            }
            return nil
        }
        set (newValue) {
            do {
                let hasKey = try keychain.contains("oauthKey")
                if hasKey {
                    try keychain.remove("oauthKey")
                }
                if let confValue = newValue { // Set only if new value is confirmed
                    try keychain.set(confValue, key: "oauthKey")
                }
            } catch {}
        }
    }

    var useInAppBrowser: Bool = true

    override func loginUser() {

        if self.useInAppBrowser == true {
            // Create AuthbrowserController
            let authBrowserController =  AuthBrowserController()
            let authNavBrowser = UINavigationController(rootViewController: authBrowserController)
            
            UIApplication.shared.keyWindow?.rootViewController?.present(authNavBrowser, animated: true, completion: nil)
            authBrowserController.loginWith( url: NSURL(string: self.oAuthUrl)!, redirectScheme: self.redirectUri! )
            
            authBrowserController.onAnswerReceive = {(tokenString, isSuccess) -> Void in
                Logger.shared.debug("Items got \(tokenString),\(isSuccess)")
                if isSuccess {
                    // Success . token got in response
                    self.authToken = tokenString

                    NotificationCenter.default.post(name: NSNotification.Name.AuthNotification.didLogin, object: tokenString)
                } else {
                    // Error got. Need to show error and stuff
                     NotificationCenter.default.post(name: NSNotification.Name.AuthNotification.failedLogin, object: nil)
                }
            }
        } else {
            UIApplication.shared.open(NSURL(string: self.oAuthUrl)! as URL, options: [:], completionHandler: nil)
        }
        
        // Also check if oauth token is present before opening the url
        // Have to change this to show up an in app browser.
        // UIApplication.sharedApplication().openURL(NSURL(string: self.oAuthUrl)!)
    }

    override func checkLogin() -> Bool {
         return self.authToken != nil
    }

    override func logoutUser() {
        self.authToken = nil
    }

    override var authHeaders: [String: String] {
        get {
            if let confirmedToken = self.authToken {
                return ["Authorization": "Bearer \(confirmedToken)"]
            }
            return [:]
        }
    }

    /// Method that applies non secure changing for Alamofire
    func applyNonSecureForAlamofire() {
        let manager = AXManager.default

        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential: URLCredential?

            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)

                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }

            return (disposition, credential)
        }
    }

    override func parseUrl(url: NSURL) {
        // Example:
        // axsample://#access_token=3de8f662d5c4ead0cd336817c62ea26d -> Valid
        // axsample://#error=invalid_credentials    -> Invalid
        if let fragment = url.fragment {
            let tempVar = fragment.components(separatedBy: ("&"))[0]
            let answer = tempVar.components(separatedBy: ("="))[0]
            let value = tempVar.components(separatedBy: ("="))[1]

            if answer == "access_token" {
                // Store the value as authToken
                self.authToken = value
                NotificationCenter.default.post(name: NSNotification.Name.AuthNotification.didLogin, object: value)
            } else if answer == "error" {
                // Show up error somewhere. Can customize this.
                NotificationCenter.default.post(name: NSNotification.Name.AuthNotification.failedLogin, object: nil)
            }
        }
    }
}
