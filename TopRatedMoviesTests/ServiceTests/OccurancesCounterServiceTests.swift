//
//  OccurancesCounterServiceTests.swift
//  TopRatedMoviesTests
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import XCTest
@testable import TopRatedMovies

final class OccurancesCounterServiceTests: XCTestCase {
    
    private let service = OccurancesCounterService()
    
    func testEmptyString() {
        // Given
        let input = ""
        
        // When
        let result = service.getOccurances(in: input)
        
        // Then
        XCTAssertTrue(result.isEmpty)
    }
    
    func testStringWithWhitespace() {
        // Given
        let input = "  Hello World  "
        
        // When
        let result = service.getOccurances(in: input)
        
        // Then
        XCTAssertEqual(result.count, 7)
        XCTAssertEqual(result["h"], 1)
        XCTAssertEqual(result["e"], 1)
        XCTAssertEqual(result["l"], 3)
        XCTAssertEqual(result["o"], 2)
        XCTAssertEqual(result["w"], 1)
        XCTAssertEqual(result["r"], 1)
        XCTAssertEqual(result["d"], 1)
    }
    
    func testStringWithVariousCharacters() {
        // Given
        let input = "aabbccAA!123"
        
        // When
        let result = service.getOccurances(in: input)
        
        // Then
        XCTAssertEqual(result.count, 7)
        XCTAssertEqual(result["a"], 4)
        XCTAssertEqual(result["b"], 2)
        XCTAssertEqual(result["c"], 2)
        XCTAssertEqual(result["!"], 1)
        XCTAssertEqual(result["1"], 1)
        XCTAssertEqual(result["2"], 1)
        XCTAssertEqual(result["3"], 1)
    }
}
