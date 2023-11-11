//
//  Movie.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

struct MovieResult: Decodable {

    let results: [Movie]
    let currentPage: Int
    let totalPages: Int

    private enum CodingKeys: String, CodingKey {
        case results
        case currentPage = "page"
        case totalPages = "total_pages"
    }
}

struct Movie: Decodable {

    let title: String
    let posterPath: String?
    let voteAverage: Double?

    private enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}

extension Movie {
    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        let urlString = Environment.shared.regularImageURLString.appending(posterPath)
        return URL(string: urlString)
    }
}
