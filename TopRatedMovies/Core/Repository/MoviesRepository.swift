//
//  MovieRepository.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

final class MovieRepository: MovieUseCaseProtocol {
    
    private let remoteDataSource: MovieRemoteDataSourceProtocol
    
    init(remoteDataSource: MovieRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        remoteDataSource.getTopRatedMovies(page: page, completion: completion)
    }
}
