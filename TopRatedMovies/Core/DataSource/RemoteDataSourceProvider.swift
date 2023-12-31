//
//  RemoteDataSourceProvider.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

protocol RemoteDataSourceProtocol {

    func movieDataSource() -> MovieRemoteDataSourceProtocol
    func occurancesDataSource() -> OccurancesDataSourceProtocol
}

final class RemoteDataSourceProvider: RemoteDataSourceProtocol {
    
    func movieDataSource() -> MovieRemoteDataSourceProtocol {
        MovieRemoteDataSource(apiClient: MovieClient())
    }
    
    func occurancesDataSource() -> OccurancesDataSourceProtocol {
        OccurancesDataSource(service: OccurancesCounterService())
    }
}
