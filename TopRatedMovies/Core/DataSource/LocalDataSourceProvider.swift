//
//  LocalDataSourceProvider.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import Foundation

protocol LocalDataSourceProtocol {
    func movieDataSource() -> MovieLocalDataSource
}

final class LocalDataSourceProvider: LocalDataSourceProtocol {
    
    func movieDataSource() -> MovieLocalDataSource {
        let store: PersistenceStore<MovieEntity> = PersistenceStore(CoreDataStack.shared.persistentContainer)
        let searchService = MovieSearchService()
        return MovieLocalDataSource(store: store, searchService: searchService)
    }
}
