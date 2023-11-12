//
//  MovieCellViewModel.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

protocol MovieCellViewModelProtocol {
    var movie: Movie { get }
    func loadImage(completion: @escaping (Result<Data, APIError>) -> Void)
    func cancelImageDownloading()
}

final class MovieCellViewModel: MovieCellViewModelProtocol {
   
    let movie: Movie
    private let useCase: MovieUseCaseProtocol
    private var loadImageItem: DispatchWorkItem?
    
    init(_ movie: Movie, useCase: MovieUseCaseProtocol) {
        self.movie = movie
        self.useCase = useCase
    }
    
    func loadImage(completion: @escaping (Result<Data, APIError>) -> Void) {
        guard let posterPath = movie.posterPath else {
            loadImageItem = nil
            return
        }
        
        let currentLoadImageItem = DispatchWorkItem { [weak self] in
            self?.useCase.loadImage(with: posterPath, completion: completion)
        }
        
        loadImageItem = currentLoadImageItem
        
        DispatchQueue.global(qos: .background).async(execute: currentLoadImageItem)
    }
    
    func cancelImageDownloading() {
        loadImageItem?.cancel()
    }
}
