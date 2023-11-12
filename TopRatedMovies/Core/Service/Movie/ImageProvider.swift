//
//  ImageProvider.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import Foundation

enum ImageProvider {
    case loadImage(path: String)
}

extension ImageProvider: Endpoint {
    
    var baseURL: String {
        Environment.shared.regularImageBaseURLString
    }
    
    var path: String {
        switch self {
        case .loadImage(let path):
            return "/t/p/w185\(path)"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var parameters: [String : Any]? {
        [:]
    }
    
    var headers: [String : String]? {
        [:]
    }
}
