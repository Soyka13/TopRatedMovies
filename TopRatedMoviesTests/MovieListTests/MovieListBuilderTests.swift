//
//  MovieListBuilderTests.swift
//  TopRatedMoviesTests
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import XCTest
@testable import TopRatedMovies

final class MovieListBuilderTests: XCTestCase {

    func testBuild() {
        // Given, When
        let movieListController = MovieListBuilder.build()
        
        // Then
        XCTAssertNotNil(movieListController as? MovieListViewController)
    }
}
