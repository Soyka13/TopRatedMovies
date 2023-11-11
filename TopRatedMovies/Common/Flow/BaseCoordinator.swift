//
//  BaseCoordinator.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import UIKit

class BaseCoordinator: NSObject, Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    func start() {
        fatalError("Start method should be implemented")
    }
}
