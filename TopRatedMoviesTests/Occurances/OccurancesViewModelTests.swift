//
//  OccurancesViewModelTests.swift
//  TopRatedMoviesTests
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import XCTest
@testable import TopRatedMovies

final class OccurancesViewModelTests: XCTestCase {

    func testFetchOccurances_viewStateChanged() {
        // Given
        let useCase = MockOccurancesUseCase()
        let viewModel = OccurancesViewModel(movieItem: .mock(), useCase: useCase)
        let delegateResponder = ViewDelegateResponder()
        viewModel.viewDelegate = delegateResponder
        
        // When
        viewModel.fetchOccurances()
        
        // Then
        XCTAssertEqual(viewModel.viewState, delegateResponder.state)
    }
    
    func testFetchOccurances_populated() {
        // Given
        let useCase = MockOccurancesUseCase()
        let viewModel = OccurancesViewModel(movieItem: .mock(), useCase: useCase)
        
        // When
        viewModel.fetchOccurances()
        
        // Then
        XCTAssertEqual(viewModel.viewState, .populated)
    }
    
    func testFetchOccurances_empty() {
        // Given
        let useCase = MockOccurancesUseCase()
        useCase.expectedOccurancesResult = [:]
        let viewModel = OccurancesViewModel(movieItem: .mock(), useCase: useCase)
        
        // When
        viewModel.fetchOccurances()
        
        // Then
        XCTAssertEqual(viewModel.viewState, .empty)
    }
}
