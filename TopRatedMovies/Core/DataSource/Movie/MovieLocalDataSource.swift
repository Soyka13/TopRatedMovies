//
//  MovieLocalDataSource.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import Foundation

protocol MovieLocalDataSourceProtocol {
    func saveMovies(_ movies: [Movie])
    func findAllMovies() -> [Movie]
}

final class MovieLocalDataSource: MovieLocalDataSourceProtocol {
    
    private let store: PersistenceStore<MovieEntity>
    
    init(store: PersistenceStore<MovieEntity>) {
        self.store = store
        self.store.configureResultsContoller()
    }
    
    func saveMovies(_ movies: [Movie]) {
        store.clear()
        movies.forEach { store.saveMovie($0) }
    }
    
    func findAllMovies() -> [Movie] {
        store.findAll().map { $0.asMovie() }
    }
    
    func savePosters(_ data: Data, movieId: Int) {
        
    }
}
