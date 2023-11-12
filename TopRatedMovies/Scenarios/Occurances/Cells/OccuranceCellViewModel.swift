//
//  OccuranceCellViewModel.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import Foundation

protocol OccuranceCellViewModelProtocol {
    var occurance: OccuranceItem { get }
}

final class OccuranceCellViewModel: OccuranceCellViewModelProtocol {
    
    let occurance: OccuranceItem
    
    init(_ occurance: OccuranceItem) {
        self.occurance = occurance
    }
}
