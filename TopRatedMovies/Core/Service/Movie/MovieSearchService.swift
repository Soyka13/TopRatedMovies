//
//  MovieSearchService.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 13.11.2023.
//

import Foundation

protocol MovieSearchServiceProtocol {
    func search(with query: String, in collection: [Movie]) -> [Movie]
}

final class MovieSearchService: MovieSearchServiceProtocol {
    
    func search(with query: String, in collection: [Movie]) -> [Movie] {
        let updatedQuery = query
            .replacingOccurrences(of: " ", with: "")
            .lowercased()
        
        return collection.filter { movie in
            movie.title
                .replacingOccurrences(of: " ", with: "")
                .lowercased()
                .contains(updatedQuery)
        }
    }
}
