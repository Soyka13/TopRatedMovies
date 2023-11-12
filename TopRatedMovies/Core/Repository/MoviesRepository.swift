//
//  MovieRepository.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import CoreData

protocol MovieRepositoryProtocol {
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void)
    func loadImage(with path: String, completion: @escaping (Result<Data, APIError>) -> Void)
    func search(query: String, page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void)
}

final class MovieRepository: MovieRepositoryProtocol {
    
    private let remoteDataSource: MovieRemoteDataSourceProtocol
    private let localDataSource: MovieLocalDataSourceProtocol
    
    init(remoteDataSource: MovieRemoteDataSourceProtocol, localDataSource: MovieLocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        let localMovies = localDataSource.findAllMovies()
        completion(.success(MovieResult(results: localMovies)))
        
        remoteDataSource.getTopRatedMovies(page: page) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let remoteMovieResult):
                self.localDataSource.saveMovies(remoteMovieResult.results)
                completion(.success(remoteMovieResult))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadImage(with path: String, completion: @escaping (Result<Data, APIError>) -> Void) {
        remoteDataSource.loadImage(with: path, completion: completion)
    }
    
    func search(query: String, page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        let localSearchResults = localDataSource.search(with: query)
        completion(.success(MovieResult(results: localSearchResults)))
        
        remoteDataSource.search(query: query, page: page, completion: completion)
    }
}
