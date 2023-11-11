//
//  MoviewUseCase.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

protocol MovieUseCaseProtocol {
    func getTopRatedMovies(page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void)
    func search(query: String, page: Int, completion: @escaping (Result<MovieResult, APIError>) -> Void)
}
