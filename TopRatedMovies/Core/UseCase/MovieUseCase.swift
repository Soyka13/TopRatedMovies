//
//  MoviewUseCase.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

protocol MovieUseCaseProtocol {
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void)
    func loadImage(with path: String, completion: @escaping (Result<Data, APIError>) -> Void)
    func search(query: String, page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void)
}

final class MovieUseCase: MovieUseCaseProtocol {
    
    private var movieRepository: MovieRepositoryProtocol
    
    init(movieRepository: MovieRepositoryProtocol) {
        self.movieRepository = movieRepository
    }
    
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        movieRepository.getTopRatedMovies(page: page, completion: completion)
    }
    
    func loadImage(with path: String, completion: @escaping (Result<Data, APIError>) -> Void) {
        movieRepository.loadImage(with: path, completion: completion)
    }
    
    func search(query: String, page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void) {
        movieRepository.search(query: query, page: page, completion: completion)
    }
}
