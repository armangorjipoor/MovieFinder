

import Combine
import UIKit


class Network:  NSObject, NetworkProtocol {

    public var cancellables = Set<AnyCancellable>()
    private var sessionManager: NetworkSessionProtocol
    
    init(sessionManager: NetworkSessionProtocol) {
        self.sessionManager = sessionManager
    }
    
    internal func createTask(path: String,
                             method: NetworkHTTPMethodEnum,
                             parameter: [(String, String)]? = nil,
                             payload: Encodable?,
                             timeout: TimeInterval) -> AnyPublisher<Data, Error> {
        
        Future<Data, Error> { [weak self] promise in
            guard let self = self else {
                promise(.failure(NSError(domain: "Self is nil", code: 0, userInfo: nil)))
                return
            }

            var request: URLRequest
                request = self.createRequest(path: path, method: method, parameter: parameter, payload: payload, timeout: timeout)

            let task = self.sessionManager.session.dataTask(with: request) { data, response, error in
                self.handleResponse(data: data, response: response, error: error, promise: promise)
            }
            task.resume()
        }
        .timeout(.seconds(Int(timeout)), scheduler: DispatchQueue.global(qos: .default))
        .retry(3)
        .eraseToAnyPublisher()
    }
    
    internal func createRequest(path: String, method: NetworkHTTPMethodEnum, parameter: [(String, String)]?, payload: Encodable?, timeout: TimeInterval) -> URLRequest {
        var request = URLRequest(url: serverApiPathString(path: path, parameter: parameter),
                                 cachePolicy: sessionManager.session.configuration.requestCachePolicy,
                                 timeoutInterval: timeout)
        let headers = headers(method: method)
        headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }

        request.httpMethod = method.rawValue

        var payload = payload
        applyBodyHeaders(request: &request, method: method, body: &payload)

        switch method {
        case .post:
            if let data = payload as? Data {
                request.httpBody = data
            } else if let payload = payload, let data = payload.toJSONData() {
                request.httpBody = data
            } else {
                request.httpBody = "{}".data(using: .utf8)
            }
        case .put:
            guard let data = payload?.toJSONData() else {
                fatalError("Payload cannot be null in \(method.rawValue.uppercased())")
            }
            request.httpBody = data
        default:
            break
        }

        return request
    }
    
    private func applyBodyHeaders(request: inout URLRequest, method: NetworkHTTPMethodEnum, body: inout Encodable?) {
        let bsHeaders = bodySpecificHeaders(method: method, body: &body)
        bsHeaders.forEach({
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        })
    }
    
    func bodySpecificHeaders(method: NetworkHTTPMethodEnum, body: inout Encodable?) -> [String : String] {
        var headers = [String : String]()
       
        
        let contentTypeKey = "Content-Type"

        switch method {
        case .get:
       
                headers[contentTypeKey] = "application/json"
            
            
        case .post:
            
            headers[contentTypeKey] = "application/json"
        
        case .put:
                headers[contentTypeKey] = "application/json"
       
        }
     
        return headers
    }
    
    internal func serverApiPathString(path: String, parameter: [(String, String)]? ) -> URL {
        
        guard var urlComponent = URLComponents(string: "\(endPointProtocol())://\(endPoint())") else { return URL(string: "")!}
        
        if let params = parameter {
            let queryItems = params.map { key, value in
                URLQueryItem(name: key, value: value) }
            
            urlComponent.queryItems = queryItems
        }
        
        let url = urlComponent.url!
        guard let path2 = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return URL(string: "")!}
        
        let  urlWithPath = url.appendingPathComponent(path2).absoluteString
        let res = URL.init(string: urlWithPath)       
        
        return res ?? url
        
    }
    
    open func endPointProtocol() -> String { NetworkConstant.httpsProtocl.rawValue }
    
    open func endPoint() -> String {
        NetworkConstant.APIRoot.rawValue
    }
    
    private func handleResponse(data: Data?, response: URLResponse?, error: Error?, promise: @escaping (Result<Data, Error>) -> Void) {
        if let error = error {
            promise(.failure(error))
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            promise(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
            return
        }
        
        let statusCode = httpResponse.statusCode
        if (200...299).contains(statusCode) {
            if let data = data {
                promise(.success(data))
            } else {
                promise(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
            }
        } else {
            if statusCode == 401 {
                promise(.failure(NSError(domain: "Unauthorized", code: 401, userInfo: nil)))
            } else {
                promise(.failure(NSError(domain: "Server error", code: statusCode, userInfo: nil)))
            }
        }
    }
    
    func headers(method: NetworkHTTPMethodEnum) -> [String : String] {
       var headers = [String : String]()
       
       headers["accept"] = "application/json"
       
       return headers
   }
    
    open func maximumTimeout() -> TimeInterval { 15 }

    public func get(path: String, parameter: [(String, String)]? = nil) -> AnyPublisher<Data, Error> {
        return createTask(path: path, method: .get, parameter: parameter, payload: nil, timeout: maximumTimeout())
    }

    public func post(path: String, payload: Encodable?) -> AnyPublisher<Data, Error> {
        return createTask(path: path, method: .post, payload: payload, timeout: maximumTimeout())
    }
}
