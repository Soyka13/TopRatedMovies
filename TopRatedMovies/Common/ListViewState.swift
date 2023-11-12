//
//  ListViewState.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 11.11.2023.
//

import Foundation

protocol ListViewStateDelegate: AnyObject {
    func viewStateDidChange<T>(_ state: ListViewState<T>)
}

enum ListViewState<T> {
    case empty
    case error(Error)
    case populated([T])
    
    var currentEntities: [T] {
        switch self {
        case .populated(let entities):
            return entities
        case .empty, .error:
            return []
        }
    }
}
