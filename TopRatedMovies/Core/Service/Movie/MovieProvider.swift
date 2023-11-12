//
//  MovieProvider.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

enum MovieProvider {
    case getTopRated(page: Int)
    case search(query: String, page: Int)
}

extension MovieProvider: Endpoint {
    
    var method: HTTPMethod {
        .get
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getTopRated(let page):
            return ["language": "en-US", "page": page]
        case .search(let query, let page):
            return ["language": "en-US", "query": query, "page": page]
        }
    }
    
    var path: String {
        switch self {
        case .getTopRated(_):
            return "/3/movie/top_rated"
        case .search(_, _):
            return "/3/search/movie"
        }
    }
}
