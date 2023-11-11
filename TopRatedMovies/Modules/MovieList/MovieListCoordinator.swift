//
//  MovieListCoordinator.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import UIKit

final class MovieListCoordinator: BaseCoordinator {
    
    override func start() {
        let vc = MovieListBuilder.build()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showOccurances() {
        
    }
}
