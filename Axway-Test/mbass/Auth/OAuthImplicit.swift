// /Auth/OAuthImplicit.swift
 

class OAuthImplicit: OAuth {
    override func checkLogin() -> Bool {
        return self.authToken != nil
    }
}
