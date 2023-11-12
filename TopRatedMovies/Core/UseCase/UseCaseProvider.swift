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
    private let localDataSource: LocalDataSourceProtocol
    
    init(remoteDataSource: RemoteDataSourceProtocol, localDataSource: LocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func movieUseCase() -> MovieUseCaseProtocol {
        let remoteDataSource = remoteDataSource.movieDataSource()
        let localDataSource = localDataSource.movieDataSource()
        let movieRepository = MovieRepository(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
        return MovieUseCase(movieRepository: movieRepository)
    }
    
    func occurancesUseCase() -> OccurancesUseCaseProtocol {
        let dataSource = remoteDataSource.occurancesDataSource()
        let occurancesRepository = OccurancesRepository(dataSource: dataSource)
        return OccurancesUseCase(repository: occurancesRepository)
    }
}
