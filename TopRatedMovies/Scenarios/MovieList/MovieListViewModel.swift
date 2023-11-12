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
    var viewState: ListViewState<Movie> { get }
    
    func fetchTopRatedMovies()
    func searchMovies(with query: String)
}

final class MovieListViewModel: MovieListViewModelProtocol {
    
    weak var viewDelegate: ListViewStateDelegate?
    
    var viewState: ListViewState<Movie> = .empty {
        didSet {
            DispatchQueue.main.async {
                self.viewDelegate?.viewStateDidChange(self.viewState)
            }
        }
    }
    
    var movieCells: [MovieCellViewModel] {
        viewState.currentEntities.map { MovieCellViewModel($0, useCase: movieUseCase) }
    }
    
    private let movieUseCase: MovieUseCaseProtocol
    
    private var searchWorkItem: DispatchWorkItem?
    
    init(movieUseCase: MovieUseCaseProtocol) {
        self.movieUseCase = movieUseCase
    }
    
    func fetchTopRatedMovies() {
        movieUseCase.getTopRatedMovies(page: 1) { [weak self] result in
            switch result {
            case .success(let movieResult):
                
                if movieResult.results.isEmpty {
                    self?.viewState = .empty
                } else {
                    self?.viewState = .populated(movieResult.results)
                }
            case .failure(let error):
                self?.viewState = .error(error)
            }
        }
    }
    
    func searchMovies(with query: String) {
        searchWorkItem?.cancel()
        
        let currentWorkItem = DispatchWorkItem {
            self.movieUseCase.search(query: query, page: 1) { [weak self] result in
                switch result {
                case .success(let movieResult):
                    
                    if movieResult.results.isEmpty {
                        self?.viewState = .empty
                    } else {
                        self?.viewState = .populated(movieResult.results)
                    }
                case .failure(let error):
                    self?.viewState = .error(error)
                }
            }
        }
        
        searchWorkItem = currentWorkItem
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.2, execute: currentWorkItem)
    }
}
