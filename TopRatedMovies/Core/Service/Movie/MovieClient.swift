//
//  MovieClient.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

protocol MovieClientProtocol {
    
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void)
    func search(query: String, page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void)
}

final class MovieClient: APIClient, MovieClientProtocol {
   
    let session: URLSession
    
    init() {
        session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        let request = MovieProvider.getTopRated(page: page).request
        fetch(with: request, completion: completion)
    }
    
    func search(query: String, page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        let request = MovieProvider.search(query: query, page: page).request
        fetch(with: request, completion: completion)
    }
}
