//
//  MovieItem.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 11.11.2023.
//

import Foundation

struct MovieItem {
    
    let title: String
    var posterURL: URL?
    let voteAverage: Double?
    
    init(_ model: Movie) {
        self.title = model.title
        self.posterURL = model.posterURL
        self.voteAverage = model.voteAverage
    }
}
