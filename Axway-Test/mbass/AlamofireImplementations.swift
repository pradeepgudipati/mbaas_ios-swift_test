// /AlamofireImplementations.swift
 

import Foundation

class AlamofireRequestBuilderFactory: RequestBuilderFactory {
    func getBuilder<T>() -> RequestBuilder<T>.Type {
        return AlamofireRequestBuilder<T>.self
    }
}

// Store manager to retain its reference
private var managerStore: [String: AXManager] = [:]

class AlamofireRequestBuilder<T>: RequestBuilder<T> {
    //    52-18-176-25
    var hostUrl = "preprod-api.cloud.appctest.com"

    required init(method: String,
                  URLString: String,
                  parameters: [String: AnyObject]?,
                  customHeader: [String: String],
                  isBody: Bool,
                  authNames: [String]) {
        super.init(method: method, URLString: URLString, parameters: parameters, customHeader: customHeader, isBody: isBody, authNames:authNames)

    }

    override func execute(completion: @escaping ((AXResponse<T>?, Error?) -> Void)) {

        if let colonRange =  hostUrl.range(of : ":") {
            hostUrl = hostUrl.substring(to: colonRange.lowerBound)
        }

        let serverTrustPolicies: [String: ServerTrustPolicy] = [hostUrl: .disableEvaluation]

        let managerId = NSUUID().uuidString
        // Create a new manager for each request to customize its request header
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = buildHeaders()
        var manager =  AXManager(configuration: configuration)

        if MbaasPreprodAPI.sharedInstance.doNotValidateCertificates {
            // Use this to remove exceptions for SSL
            manager =  AXManager(configuration: configuration,
                                 serverTrustPolicyManager:ServerTrustPolicyManager(policies:serverTrustPolicies)
                                )
        }
        managerStore[managerId] = manager

        let encoding: AXParameterEncoding = isBody ? JSONEncoding() : URLEncoding()
        let xMethod = AXHTTPMethod(rawValue: method)       //Name

        let tempParam = parameters
        let fileKeys = (tempParam == nil ? [] : tempParam!.filter { $1 is NSURL }
            .map { $0.0 })

        if fileKeys.count > 0 {
            manager.upload(multipartFormData: { mpForm in
                for (k, v) in self.parameters! {
                    switch v {
                    case let fileURL as URL:
                        mpForm.append(fileURL, withName: k)
                        break
                    case let string as String:
                        mpForm.append(string.data(using: String.Encoding.utf8)!, withName: k)
                        break
                    case let number as NSNumber:
                        mpForm.append(number.stringValue.data(using: String.Encoding.utf8)!, withName: k)
                        break
                    default:
                     //   fatalError("Unprocessable value \(v) with key \(k)")
                        break
                    }
                }
            }, to: URLString, method: xMethod!, headers: nil, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):

                    self.processRequest(request: upload, managerId, completion)
                case .failure(let encodingError):
                    completion(nil, ErrorResponse.Error(415, nil, encodingError))
                }
            })
        } else {

            if self.parameters?["status"] != nil {
                self.parameters?["status"] = "available" as AnyObject?
            }
            let request = manager.request(URLString, method: xMethod!, parameters: parameters, encoding: encoding)

            processRequest(request: request, managerId, completion)
        }

    }

    private func processRequest(request: DataRequest,
                                _ managerId: String,
                                _ completion: @escaping (_ response: AXResponse<T>?,
                                _ error: Error?) -> Void) {
        debugPrint(request)
        Logger.shared.verbose(request)
        if let credential = self.credential {
            request.authenticate(usingCredential: credential)
            Logger.shared.verbose("processRequest#Credentials --", credential)
        }

        request.validate().responseJSON(options: .allowFragments) { response in
            managerStore.removeValue(forKey: managerId)

            if response.result.isFailure {
                completion(nil, response.result.error)
                return
            }

            if () is T {
                completion(AXResponse(response: response.response!, body: () as! T), nil)
                return
            }
            if let json: AnyObject = response.result.value as AnyObject? {
                let body = Decoders.decode(clazz: T.self, source: json)
                completion(AXResponse(response: response.response!, body: body), nil)
                return
            } else if "" is T {
                // swagger-parser currently doesn't support void, which will be fixed in future swagger-parser release
                // https://github.com/swagger-api/swagger-parser/pull/34
                completion(AXResponse(response: response.response!, body: "" as! T), nil)
                return
            }

            completion(nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "unreacheable code"]))
        }
    }

    private func buildHeaders() -> [String: AnyObject] {
        var httpHeaders = AXManager.defaultHTTPHeaders
        for (key, value) in self.headers {
            httpHeaders[key] = value
        }
        // Hard coding User agent
        Logger.shared.verbose("buildHeaders#httpHeaders---", httpHeaders)
        return httpHeaders as [String: AnyObject]
    }
}
//
