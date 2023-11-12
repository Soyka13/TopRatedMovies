//
//  MovieListViewModelTests.swift
//  TopRatedMoviesTests
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import XCTest
@testable import TopRatedMovies

final class MovieListViewModelTests: XCTestCase {

    func testFetchTopRatedMovies_viewStateChanged() {
        // Given
        let expectation = expectation(description: "viewStateDidChange called")
        let useCase = MockMovieUseCase()
        let viewModel = MovieListViewModel(movieUseCase: useCase)
        let delegateResponder = ViewDelegateResponder()
        viewModel.viewDelegate = delegateResponder
        
        // When
        viewModel.fetchTopRatedMovies()
        
        // Then
        delegateResponder.onViewStateDidChangeCalled = {
            expectation.fulfill()
            XCTAssertEqual(viewModel.viewState, delegateResponder.state)
        }
        
        waitForExpectations(timeout: 5.0)
    }
    
    func testSearchMovies_viewStateChanged() {
        // Given
        let expectation = expectation(description: "viewStateDidChange called")
        let useCase = MockMovieUseCase()
        let viewModel = MovieListViewModel(movieUseCase: useCase)
        let delegateResponder = ViewDelegateResponder()
        viewModel.viewDelegate = delegateResponder
        
        // When
        viewModel.searchMovies(with: "Harry Potter")
        
        // Then
        delegateResponder.onViewStateDidChangeCalled = {
            expectation.fulfill()
            XCTAssertEqual(viewModel.viewState, delegateResponder.state)
        }
        
        waitForExpectations(timeout: 5.0)
    }
    
    func testFetchTopRatedMovies_populated() {
        // Given
        let expectation = expectation(description: "viewStateDidChange called")
        let useCase = MockMovieUseCase()
        let viewModel = MovieListViewModel(movieUseCase: useCase)
        let delegateResponder = ViewDelegateResponder()
        viewModel.viewDelegate = delegateResponder
        
        // When
        viewModel.fetchTopRatedMovies()
        
        // Then
        delegateResponder.onViewStateDidChangeCalled = {
            expectation.fulfill()
            XCTAssertEqual(viewModel.viewState, .populated)
        }
        
        waitForExpectations(timeout: 5.0)
    }
    
    func testFetchTopRatedMovies_error() {
        // Given
        let expectation = expectation(description: "viewStateDidChange called")
        let useCase = MockMovieUseCase()
        useCase.expectedMovieResult = .failure(.unknown)
        let viewModel = MovieListViewModel(movieUseCase: useCase)
        let delegateResponder = ViewDelegateResponder()
        viewModel.viewDelegate = delegateResponder
        
        // When
        viewModel.fetchTopRatedMovies()
        
        // Then
        delegateResponder.onViewStateDidChangeCalled = {
            expectation.fulfill()
            XCTAssertEqual(viewModel.viewState, .error(APIError.unknown))
        }
        
        waitForExpectations(timeout: 5.0)
    }
    
    func testFetchTopRatedMovies_empty() {
        // Given
        let expectation = expectation(description: "viewStateDidChange called")
        let useCase = MockMovieUseCase()
        useCase.expectedMovieResult = .success(MovieResult(results: []))
        let viewModel = MovieListViewModel(movieUseCase: useCase)
        let delegateResponder = ViewDelegateResponder()
        viewModel.viewDelegate = delegateResponder
        
        // When
        viewModel.fetchTopRatedMovies()
        
        // Then
        delegateResponder.onViewStateDidChangeCalled = {
            expectation.fulfill()
            XCTAssertEqual(viewModel.viewState, .empty)
        }
        
        waitForExpectations(timeout: 5.0)
    }
    
    func testSearchMovies_populated() {
        // Given
        let expectation = expectation(description: "viewStateDidChange called")
        let useCase = MockMovieUseCase()
        let viewModel = MovieListViewModel(movieUseCase: useCase)
        let delegateResponder = ViewDelegateResponder()
        viewModel.viewDelegate = delegateResponder
        
        // When
        viewModel.searchMovies(with: "Harry Potter")
        
        // Then
        delegateResponder.onViewStateDidChangeCalled = {
            expectation.fulfill()
            XCTAssertEqual(viewModel.viewState, .populated)
        }
        
        waitForExpectations(timeout: 5.0)
    }
    
    func testSearchMovies_error() {
        // Given
        let expectation = expectation(description: "viewStateDidChange called")
        let useCase = MockMovieUseCase()
        useCase.expectedMovieResult = .failure(.unknown)
        let viewModel = MovieListViewModel(movieUseCase: useCase)
        let delegateResponder = ViewDelegateResponder()
        viewModel.viewDelegate = delegateResponder
        
        // When
        viewModel.searchMovies(with: "Harry Potter")
        
        // Then
        delegateResponder.onViewStateDidChangeCalled = {
            expectation.fulfill()
            XCTAssertEqual(viewModel.viewState, .error(APIError.unknown))
        }
        
        waitForExpectations(timeout: 5.0)
    }
    
    func testSearchMovies_empty() {
        // Given
        let expectation = expectation(description: "viewStateDidChange called")
        let useCase = MockMovieUseCase()
        useCase.expectedMovieResult = .success(MovieResult(results: []))
        let viewModel = MovieListViewModel(movieUseCase: useCase)
        let delegateResponder = ViewDelegateResponder()
        viewModel.viewDelegate = delegateResponder
        
        // When
        viewModel.searchMovies(with: "Harry Potter")
        
        // Then
        delegateResponder.onViewStateDidChangeCalled = {
            expectation.fulfill()
            XCTAssertEqual(viewModel.viewState, .empty)
        }
        
        waitForExpectations(timeout: 5.0)
    }
}
