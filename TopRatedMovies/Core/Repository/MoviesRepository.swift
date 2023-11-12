//
//  MovieRepository.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void)
    func search(query: String, page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void)
}

final class MovieRepository: MovieRepositoryProtocol {
    
    private let remoteDataSource: MovieRemoteDataSourceProtocol
    
    init(remoteDataSource: MovieRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        remoteDataSource.getTopRatedMovies(page: page, completion: completion)
    }
    
    func search(query: String, page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        remoteDataSource.search(query: query, page: page, completion: completion)
    }
}
