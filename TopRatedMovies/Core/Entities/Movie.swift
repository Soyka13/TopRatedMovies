//
//  Movie.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

struct MovieResult: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {

    let id: Int
    let title: String
    let posterPath: String?
    let voteAverage: Double?

    private enum CodingKeys: String, CodingKey {
        case id, title
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
