//
//  UseCaseProvider.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

protocol UseCaseProviderProtocol {
    func movieUseCase() -> MovieUseCaseProtocol
}

final class UseCaseProvider: UseCaseProviderProtocol {
    
    private let remoteDataSource: RemoteDataSourceProtocol
    
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func movieUseCase() -> MovieUseCaseProtocol {
        let remoteDataRepository = remoteDataSource.movieDataSource()
        return MovieRepository(remoteDataSource: remoteDataRepository)
    }
}
