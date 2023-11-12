//
//  OccurancesUseCase.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import Foundation

protocol OccurancesUseCaseProtocol {
    func getOccurances(in str: String) -> [Character: UInt]
}

final class OccurancesUseCase: OccurancesUseCaseProtocol {
    
    private let repository: OccurancesRepositoryProtocol
    
    init(repository: OccurancesRepositoryProtocol) {
        self.repository = repository
    }
    
    func getOccurances(in str: String) -> [Character: UInt] {
        repository.getOccurances(in: str)
    }
}
