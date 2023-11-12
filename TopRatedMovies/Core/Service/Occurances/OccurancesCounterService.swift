//
//  OccurancesCounterService.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import Foundation

protocol OccurancesCounterServiceProtocol {
    func getOccurances(in str: String) -> [Character: UInt]
}

final class OccurancesCounterService: OccurancesCounterServiceProtocol {

    func getOccurances(in str: String) -> [Character: UInt] {
        let cleanedString = str
            .lowercased()
            .filter { !$0.isWhitespace }
        
        var characterCounts: [Character: UInt] = [:]
        
        for char in cleanedString {
            characterCounts[char, default: 0] += 1
        }
        
        return characterCounts
    }
}
