//
//  UseCaseProvider.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

protocol UseCaseProviderProtocol {
    func movieUseCase() -> MovieUseCaseProtocol
    func occurancesUseCase() -> OccurancesUseCaseProtocol
}

final class UseCaseProvider: UseCaseProviderProtocol {
    
    private let remoteDataSource: RemoteDataSourceProtocol
    
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func movieUseCase() -> MovieUseCaseProtocol {
        let remoteDataSource = remoteDataSource.movieDataSource()
        let movieRepository = MovieRepository(remoteDataSource: remoteDataSource)
        return MovieUseCase(movieRepository: movieRepository)
    }
    
    func occurancesUseCase() -> OccurancesUseCaseProtocol {
        let dataSource = remoteDataSource.occurancesDataSource()
        let occurancesRepository = OccurancesRepository(dataSource: dataSource)
        return OccurancesUseCase(repository: occurancesRepository)
    }
}
