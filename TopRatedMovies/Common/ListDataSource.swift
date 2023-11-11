//
//  MovieListDataSource.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 11.11.2023.
//

import UIKit

final class ListDataSource<ViewModel>: NSObject, UITableViewDataSource {
    
    typealias CellConfigurator = (ViewModel, UITableViewCell) -> Void
    
    private let reuseIdentifier: String
    private let cellViewModels: [ViewModel]
    private let cellConfigurator: CellConfigurator
    
    // MARK: - Initializers
    
    init(cellViewModels: [ViewModel], reuseIdentifier: String, cellConfigurator: @escaping CellConfigurator) {
        self.cellViewModels = cellViewModels
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = cellViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cellConfigurator(viewModel, cell)
        return cell
    }
}

extension ListDataSource where ViewModel == MovieCellViewModelProtocol {
    
    static func make(for cellViewModels: [ViewModel],
                     reuseIdentifier: String = MovieCell.dequeueIdentifier) -> ListDataSource {
        ListDataSource(cellViewModels: cellViewModels,
                       reuseIdentifier: reuseIdentifier,
                       cellConfigurator: { (viewModel, cell) in
            let cell = cell as? MovieCell
            cell?.viewModel = viewModel
        })
    }
}
