//
//  MovieRemoteDataSource.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

protocol MovieRemoteDataSourceProtocol {
    
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void)
    func search(query: String, page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void)
}

final class MovieRemoteDataSource: MovieRemoteDataSourceProtocol {
    
    private let apiClient: MovieClientProtocol
    
    init(apiClient: MovieClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        apiClient.getTopRatedMovies(page: page, completion: completion)
    }
    
    func search(query: String, page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        apiClient.search(query: query, page: page, completion: completion)
    }
}
