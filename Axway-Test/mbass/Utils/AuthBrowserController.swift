// /Utils/AuthBrowserController.swift
 
// This class handles oAuth authentication based on the required implementation

import UIKit
import WebKit

class AuthBrowserController: UIViewController, WKNavigationDelegate {

     let loadingWebView =  WKWebView()
     var isLoadingHTTPSPage = false
     var onAnswerReceive : ((_ response: String, _ isSuccess: Bool) -> Void)?
     var redirectScheme: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                          target: self,
                                          action: #selector(AuthBrowserController.cancelLoginProcess))
        
       
        // Create and add a WebView.
        loadingWebView.navigationDelegate = self
        loadingWebView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loadingWebView)
        
        // Constraints for the web view
        let hConstraints = NSLayoutConstraint.constraints(
                            withVisualFormat: "H:|[webview]|",
                            options: .alignAllBottom,
                            metrics: nil,
                            views: ["webview": loadingWebView])
        
        let vConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[webview]-|",
            options: .alignAllLeading, metrics: nil,
            views: ["webview": loadingWebView])
        
        self.view.addConstraints(hConstraints)
        self.view.addConstraints(vConstraints)
        
        // Make the background black for reference
        loadingWebView.backgroundColor = UIColor.black
        self.navigationItem.rightBarButtonItem = closeButton
    }

    func loginWith(url: NSURL, redirectScheme: String) {
        if let httpScheme = url.scheme {
            if httpScheme == "https" {
                isLoadingHTTPSPage = true
            }
        }
        self.redirectScheme  = redirectScheme
        
        loadingWebView.load(
            NSURLRequest(url: url as URL,
                         cachePolicy: .reloadIgnoringLocalCacheData,
                         timeoutInterval: 10.0) as URLRequest)
        
        Logger.shared.info("Loading scheme \(String(describing: url.scheme))")

        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    // MARK: - WKWebview delegate methods
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let request = navigationAction.request
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        _ = self.checkSchemeAndDetails(url: request.url! as NSURL)
        
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
         UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let cred = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, cred)
    }

    // MARK: - IBactions
    func cancelLoginProcess() {
        loadingWebView.navigationDelegate = nil
        loadingWebView.stopLoading()
        self.dismissAuthDialog()
    }

    private func dismissAuthDialog(){
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        self.dismiss(animated: true, completion: nil)
    }

    func checkSchemeAndDetails(url: NSURL) -> Bool {
        Logger.shared.info("Checking for scheme \(String(describing: url.scheme))")
        if let urlScheme = url.scheme {
            // Check if this belongs to what we are looking for
            if urlScheme == self.redirectScheme! { 
                // Parse the fragment and get the details
                if let fragment = url.fragment {
                    Logger.shared.info(fragment)
                    let tempVar = fragment.components(separatedBy: "&")[0]

                    let answer = tempVar.components(separatedBy: "=")[0]
                    let value = tempVar.components(separatedBy: "=")[1]

                    if answer == "access_token" {
                        if let confReceive = self.onAnswerReceive {
                            confReceive(value, true)
                        }
                    } else if answer == "error" {
                        if let confReceive = self.onAnswerReceive {
                            confReceive(value, false)
                        }
                    }
                }
                if let query = url.query {
                    let cleandQuery = query.components(separatedBy: "?")[0]
                    let param = cleandQuery.components(separatedBy: "=")[0]
                    let value = cleandQuery.components(separatedBy: "=")[1]
                    Logger.shared.debug("Code received \(value)")
                    if param == "code" {
                        if let confReceive = self.onAnswerReceive {
                            confReceive(value, false)
                        }
                    }
                }
                self.dismissAuthDialog()
                return false
            }
        }
        return true
    }
}
