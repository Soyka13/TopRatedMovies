//
//  Coordinator.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    func start()
}
