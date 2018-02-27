// /Auth/OAuthApplication.swift
 

import Foundation

class OAuthApplication: OAuth {

    var oAuthTokenUrl: String {
        get {
            if self.tokenUrl == nil { 
                Logger.shared.error("Token url is needed for OAuth authentication")
                return "" 
            }
            
            return  self.tokenUrl!
        }
    }

    override func checkLogin() -> Bool {
        return self.authToken != nil
    }

    override func loginUser() {
        let postingJSON = [
            "grant_type": "client_credentials",
            "client_id": self.clientId!,
            "client_secret": self.clientSecret!,
            "format": "json",
            "scope": "resource.WRITE"
         ]

        super.applyNonSecureForAlamofire()

        // Make the request
        _ =  AXAlamofire.request(self.oAuthTokenUrl, method: .post, parameters: postingJSON, encoding:  JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let tokenResult):
                Logger.shared.debug(tokenResult)
                let jsonResponse = tokenResult as! NSDictionary

                if let theAccessToken = jsonResponse["access_token"] as? String {
                    self.authToken = theAccessToken
                    NotificationCenter.default.post(name: NSNotification.Name.AuthNotification.didLogin, object: theAccessToken)
                }
                break
            case .failure(let error):
                Logger.shared.error(error)
                break
            }

        }
    }
}
