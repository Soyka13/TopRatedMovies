//
//  OccurancesRepository.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import Foundation

protocol OccurancesRepositoryProtocol {
    func getOccurances(in str: String) -> [Character: UInt]
}

final class OccurancesRepository: OccurancesRepositoryProtocol {
    
    private let dataSource: OccurancesDataSourceProtocol
    
    init(dataSource: OccurancesDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func getOccurances(in str: String) -> [Character: UInt] {
        dataSource.getOccurances(in: str)
    }
}
