//
//  MovieListCoordinatorTests.swift
//  TopRatedMoviesTests
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import XCTest
@testable import TopRatedMovies

final class MovieListCoordinatorTests: XCTestCase {

    func testShowOccurances() {
        // Given
        let mockNavigationController = MockNavigationController()
        let coordinator = MovieListCoordinator(navigationController: mockNavigationController)
        // When
        coordinator.showOccurances(with: .mock())
        // Then
        XCTAssertEqual(mockNavigationController.pushViewControllerCallCount, 1)
    }
}
