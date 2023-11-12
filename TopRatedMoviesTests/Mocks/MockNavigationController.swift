//
//  MockNavigationController.swift
//  TopRatedMoviesTests
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import UIKit

final class MockNavigationController: UINavigationController {
    
    var pushViewControllerCallCount = 0
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerCallCount += 1
    }
}
