//
//  OccurancesDataSource.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import Foundation

protocol OccurancesDataSourceProtocol {
    func getOccurances(in str: String) -> [Character: UInt]
}

final class OccurancesDataSource: OccurancesDataSourceProtocol {
    
    private let service: OccurancesCounterServiceProtocol
    
    init(service: OccurancesCounterServiceProtocol) {
        self.service = service
    }
    
    func getOccurances(in str: String) -> [Character: UInt] {
        service.getOccurances(in: str)
    }
}
