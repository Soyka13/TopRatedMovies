//
//  MovieListViewModel.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

protocol MovieListViewModelProtocol: AnyObject {
    var viewDelegate: ListViewStateDelegate? { get set }
    
    var movieCells: [MovieCellViewModel] { get }
    var viewState: ListViewState { get }
    
    func fetchTopRatedMovies()
    func searchMovies(with query: String)
}

final class MovieListViewModel: MovieListViewModelProtocol {
    
    weak var viewDelegate: ListViewStateDelegate?
    
    var viewState: ListViewState = .empty {
        didSet {
            DispatchQueue.main.async {
                self.viewDelegate?.viewStateDidChange(self.viewState)
            }
        }
    }
    
    
    var movieCells: [MovieCellViewModel] {
        currentEntities.map { MovieCellViewModel($0, useCase: movieUseCase) }
    }
    
    private let movieUseCase: MovieUseCaseProtocol
    private var searchWorkItem: DispatchWorkItem?
    
    private var currentEntities: [Movie] = []
    
    init(movieUseCase: MovieUseCaseProtocol) {
        self.movieUseCase = movieUseCase
    }
    
    func fetchTopRatedMovies() {
        movieUseCase.getTopRatedMovies(page: 1) { [weak self] result in
            self?.handleResult(result)
        }
    }
    
    func searchMovies(with query: String) {
        searchWorkItem?.cancel()
        
        let currentWorkItem = DispatchWorkItem {
            self.movieUseCase.search(query: query, page: 1) { [weak self] result in
                self?.handleResult(result)
            }
        }
        
        searchWorkItem = currentWorkItem
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.2, execute: currentWorkItem)
    }
    
    private func handleResult(_ result: Result<MovieResult, APIError>) {
        switch result {
        case .success(let movieResult):
            if movieResult.results.isEmpty {
                viewState = .empty
            } else {
                viewState = .populated
                currentEntities = movieResult.results
            }
        case .failure(let error):
            viewState = .error(error)
        }
    }
}
