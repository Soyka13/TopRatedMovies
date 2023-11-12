//
//  ViewDelegateResponder.swift
//  TopRatedMoviesTests
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import Foundation
@testable import TopRatedMovies

final class ViewDelegateResponder: ListViewStateDelegate {
    
    var state: ListViewState?
    var onViewStateDidChangeCalled: (() -> ())?
    
    func viewStateDidChange(_ state: ListViewState) {
        self.state = state
        onViewStateDidChangeCalled?()
    }
}
