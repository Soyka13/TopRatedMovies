//
//  OccurancesBuilderTests.swift
//  TopRatedMoviesTests
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import XCTest
@testable import TopRatedMovies

final class OccurancesBuilderTests: XCTestCase {
    
    func testBuild() {
        // Given, When
        let occurancesController = OccurancesBuilder.build(with: .mock())
        
        // Then
        XCTAssertNotNil(occurancesController as? OccurancesViewController)
    }
}
