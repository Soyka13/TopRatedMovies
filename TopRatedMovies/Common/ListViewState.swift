//
//  ListViewState.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 11.11.2023.
//

import Foundation

protocol ListViewStateDelegate: AnyObject {
    func viewStateDidChange(_ state: ListViewState)
}

enum ListViewState {
    case empty
    case error(Error)
    case populated
}

extension ListViewState: Equatable {
    static func == (lhs: ListViewState, rhs: ListViewState) -> Bool {
        switch (lhs, rhs) {
        case (.empty, .empty):
            return true
        case (.error(_), .error(_)):
            return true
        case (.populated, .populated):
            return true
        default:
            return false
        }
    }
}
