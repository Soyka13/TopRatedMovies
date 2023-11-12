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
    func search(with query: String) -> [Movie]
}

final class MovieLocalDataSource: MovieLocalDataSourceProtocol {
    
    private let store: PersistenceStore<MovieEntity>
    private let searchService: MovieSearchServiceProtocol
    
    init(store: PersistenceStore<MovieEntity>, searchService: MovieSearchServiceProtocol) {
        self.searchService = searchService
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
    
    func search(with query: String) -> [Movie] {
        let movies = store.findAll().map { $0.asMovie() }
        return searchService.search(with: query, in: movies)
    }
}
