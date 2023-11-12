//
//  Movie+Mock.swift
//  TopRatedMoviesTests
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import Foundation
@testable import TopRatedMovies

extension Movie {
    
    static func mock(
        id: Int = 1,
        title: String = "Mock Title",
        posterPath: String = "path/to/poster.jpg",
        voteAverage: Double = 10.0
    ) -> Movie {
        Movie(id: id, title: title, posterPath: posterPath, voteAverage: voteAverage)
    }
}
