//
//  MockOccurancesUseCase.swift
//  TopRatedMoviesTests
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import Foundation
@testable import TopRatedMovies

final class MockOccurancesUseCase: OccurancesUseCaseProtocol {
    
    var expectedOccurancesResult: [Character: UInt] = ["a": 1, "b": 2, "c": 3]
    
    func getOccurances(in str: String) -> [Character: UInt] {
        return expectedOccurancesResult
    }
}
