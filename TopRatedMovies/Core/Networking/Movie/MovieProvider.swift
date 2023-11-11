//
//  MovieProvider.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

enum MovieProvider {
    case getTopRated(page: Int)
}

extension MovieProvider: Endpoint {
    
    var method: HTTPMethod {
        .get
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getTopRated(let page):
            return ["page": page]
        }
    }
    
    var path: String {
        switch self {
        case .getTopRated(_):
            return "/3/movie/top_rated"
        }
    }
}
