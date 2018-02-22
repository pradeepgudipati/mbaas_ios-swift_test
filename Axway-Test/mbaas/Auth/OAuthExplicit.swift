// /Auth/OAuthExplicit.swift
 
import Foundation
import UIKit

class OAuthExplicit: OAuth {

  override  var oAuthUrl: String {
        get {
            var scopesString = ""
            if let confScopes = self.scopes {
                scopesString = confScopes
            }
            
            return "\(self.authUrl!)?client_id=\(self.clientId!)&redirect_uri=\(self.redirectUri!)://&response_type=code&scope=\(scopesString)"
        }
    }

    var oAuthTokenUrl: String {
        get {
            if self.tokenUrl == nil {
                Logger.shared.error("Token url is needed for OAuth Explicit authentication")
                return ""
            }
            
            return  self.tokenUrl!
        }
    }
    
    var refreshToken: String? {
        set (newValue) {
            do {
                if let confValue = newValue {
                    try keychain.set(confValue, key: "oauthRefreshToken")
                } else {
                    try keychain.remove("oauthRefreshToken")
                }
            } catch {
            }
        }
        get {
            do {
                let currentValue = try keychain.get("oauthRefreshToken")
                return currentValue
            } catch {
                return nil
            }
        }
    }

    override func checkLogin() -> Bool {
        return self.authToken != nil
    }

    override func loginUser() {

        if self.useInAppBrowser == true {
            // Create AuthbrowserController
            let authBrowserController =  AuthBrowserController()
            let authNavBrowser = UINavigationController(rootViewController: authBrowserController)
            UIApplication.shared.keyWindow?.rootViewController?.present(authNavBrowser, animated: true, completion: nil)
            authBrowserController.loginWith( url: NSURL(string: self.oAuthUrl)!, redirectScheme: self.redirectUri!)
            authBrowserController.onAnswerReceive = {(tokenString, isSuccess) -> Void in
                Logger.shared.info("Received code. Need to construct URL for grant type and make call")
                self.exchangeCodeForToken(authCode: tokenString)
            }
        } else {
            UIApplication.shared.open(NSURL(string: self.oAuthUrl)! as URL, options: [:], completionHandler: nil)
        }
        
        // Also check if oauth token is present before opening the url
        // Have to change this to show up an in app browser.
    }

    override func parseUrl(url: NSURL) {
        if let urlScheme = url.scheme {
            if urlScheme == self.redirectUri! {
                if let query = url.query {
                    let cleandQuery = query.components(separatedBy: ("?"))[0]
                    let param = cleandQuery.components(separatedBy: ("="))[0]
                    let value = cleandQuery.components(separatedBy: ("="))[1]
                    
                    Logger.shared.debug("Code received \(value)")
                    
                    if param == "code" {
                        self.exchangeCodeForToken(authCode: value)
                    }
                }
            }
        }
    }

    func exchangeCodeForToken(authCode: String) {
        let postingJSON = [
            "grant_type": "authorization_code",
            "code": authCode,
            "redirect_uri": "\(self.redirectUri!)://",
            "client_id": self.clientId!,
            "client_secret": self.clientSecret!,
            "format": "json"
        ]

        super.applyNonSecureForAlamofire()

        _ = AXAlamofire.request(self.oAuthTokenUrl, method: .post, parameters: postingJSON, encoding:  URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let tokenResult):
                Logger.shared.debug(tokenResult)
                let jsonResponse = tokenResult as! NSDictionary

                if let theAccessToken = jsonResponse["access_token"] as? String {
                    self.authToken = theAccessToken
                    NotificationCenter.default.post(name: NSNotification.Name.AuthNotification.didLogin, object: theAccessToken)
                }
                
                if let theRefreshToken = jsonResponse["refresh_token"] as? String{
                    self.refreshToken = theRefreshToken
                }
                break
            case .failure(let error):
                Logger.shared.error(error)
                break
            }

        }

    }
 
    func refreshAccessToken(completion: @escaping ((_ error: String?) -> Void)) {
        guard self.refreshToken != nil else {
            Logger.shared.debug("Refresh token is not available")
            completion("Refresh token not available")
            return
        }
        
        let postingJSON = [
            "grant_type": "refresh_token",
            "refresh_token": self.refreshToken!,
            "client_id": self.clientId!,
            "client_secret": self.clientSecret!,
            "format": "json"
        ]
        
        AXAlamofire.request(self.oAuthTokenUrl,
                            method: .post,
                            parameters: postingJSON,
                            encoding: URLEncoding.default,
                            headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let tokenResult):
                let jsonResponse = tokenResult as! NSDictionary
                Logger.shared.debug(tokenResult)
                if let theAccessToken = jsonResponse["access_token"] as? String {
                    self.authToken = theAccessToken
                }
                if let theRefreshToken = jsonResponse["refresh_token"] as? String{
                    self.refreshToken = theRefreshToken
                    completion(nil)
                }
                break
            case .failure(let error):
                completion(error.localizedDescription)
                Logger.shared.error(error)
                break
            }
        }

    }
    
    override func logoutUser() {
        self.authToken = nil
        self.refreshToken = nil
    }
}
