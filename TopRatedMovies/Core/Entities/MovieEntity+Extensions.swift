//
//  MovieEntity+Extensions.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import CoreData

extension MovieEntity {
    
    func asMovie() -> Movie {
        return Movie(id: Int(movieId), title: title ?? "", posterPath: posterPath, voteAverage: voteAverage)
    }
}
