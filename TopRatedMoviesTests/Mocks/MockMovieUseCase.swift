//
//  MockMovieUseCase.swift
//  TopRatedMoviesTests
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import UIKit
@testable import TopRatedMovies

final class MockMovieUseCase: MovieUseCaseProtocol {
    
    var expectedMovieResult: Result<MovieResult, APIError> = .success(MovieResult(results: [.mock()]))
    var expectedImageResult: Result<Data, APIError> = .success(UIImage(systemName: "heart.fill")!.pngData()!)
    
    func getTopRatedMovies(page: Int, completion: @escaping (Result<TopRatedMovies.MovieResult, TopRatedMovies.APIError>) -> Void) {
        completion(expectedMovieResult)
    }
    
    func loadImage(with path: String, completion: @escaping (Result<Data, TopRatedMovies.APIError>) -> Void) {
        completion(expectedImageResult)
    }
    
    func search(query: String, page: Int, completion: @escaping (Result<TopRatedMovies.MovieResult, TopRatedMovies.APIError>) -> Void) {
        completion(expectedMovieResult)
    }
}
