//
//  Endpoint.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

protocol Endpoint {
    
    var baseURL: String { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var method: HTTPMethod { get }
}

extension Endpoint {
    
    var baseURL: String {
        Environment.shared.baseURLString
    }
    
    var readAccessToken: String {
        Environment.shared.readAccessToken
    }
    
    var headers: [String: String]? {
        ["Authorization" : "Bearer \(readAccessToken)"]
    }
    
    var parameters: [String: Any]? { nil }
    
    var urlComponents: URLComponents? {
        var components = URLComponents(string: baseURL)
        components?.path = path
        
        var queryItems = [URLQueryItem]()
        
        if let parameters {
            let customQueryItems = parameters.map { URLQueryItem(name: "\($0)", value: "\($1)") }
            queryItems.append(contentsOf: customQueryItems)
        }

        components?.queryItems = queryItems
        return components
    }
    
    var request: URLRequest? {
        guard let url = urlComponents?.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
}
