//
//  OccurancesViewModel.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import Foundation

protocol OccurancesViewModelProtocol: AnyObject {
    var title: String { get }
    var viewDelegate: ListViewStateDelegate? { get set }
    var occurancesCells: [OccuranceCellViewModel] { get }
    
    func fetchOccurances()
}

final class OccurancesViewModel: OccurancesViewModelProtocol {
    
    var title: String {
        movieItem.title
    }
    
    weak var viewDelegate: ListViewStateDelegate?
    
    var viewState: ListViewState = .empty {
        didSet {
            viewDelegate?.viewStateDidChange(viewState)
        }
    }
    
    var occurancesCells: [OccuranceCellViewModel] {
        currentEntities.map(OccuranceCellViewModel.init)
    }
    
    private let movieItem: Movie
    private let useCase: OccurancesUseCaseProtocol
    private var currentEntities: [OccuranceItem] = []
    
    init(movieItem: Movie, useCase: OccurancesUseCaseProtocol) {
        self.movieItem = movieItem
        self.useCase = useCase
    }
    
    func fetchOccurances() {
        let occurances = useCase
            .getOccurances(in: movieItem.title)
            .map { OccuranceItem(char: $0.key, count: $0.value)}
            .sorted { $0.char < $1.char }
        
        viewState = occurances.isEmpty ? .empty : .populated
        currentEntities = occurances
    }
}
