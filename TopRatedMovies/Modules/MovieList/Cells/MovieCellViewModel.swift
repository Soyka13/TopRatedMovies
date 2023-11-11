//
//  MovieCellViewModel.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

protocol MovieCellViewModelProtocol {
    
    var movie: MovieItem { get }
}

final class MovieCellViewModel: MovieCellViewModelProtocol {
   
    let movie: MovieItem
    
    init(_ movie: MovieItem) {
        self.movie = movie
    }
}
