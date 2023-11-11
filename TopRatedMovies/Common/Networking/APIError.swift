//
//  APIError.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

enum APIError: Error {
    
    case notFound
    case requestFailed
    case invalidData
    case invalidRequest
    case unknown
    
    init(statusCode: Int) {
        switch statusCode {
        case 404:
            self = .notFound
        default:
            self = .unknown
        }
    }
}
