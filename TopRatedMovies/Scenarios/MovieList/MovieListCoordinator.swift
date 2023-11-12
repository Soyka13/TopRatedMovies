//
//  MovieListCoordinator.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import UIKit

protocol MovieListCoordinatorProtocol: Coordinator {
    func showOccurances(with movieItem: MovieItem)
}

final class MovieListCoordinator: BaseCoordinator, MovieListCoordinatorProtocol {
    
    override func start() {
        guard let vc = MovieListBuilder.build() as? MovieListViewController else { return }
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showOccurances(with movieItem: MovieItem) {
        let vc = OccurancesBuilder.build(with: movieItem)
        navigationController.pushViewController(vc, animated: true)
    }
}
