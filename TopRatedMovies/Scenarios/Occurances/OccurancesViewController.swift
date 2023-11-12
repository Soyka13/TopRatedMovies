//
//  OccurancesViewController.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import UIKit

class OccurancesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    static let nibName = "OccurancesViewController"
    
    private var dataSource: ListDataSource<OccuranceCellViewModelProtocol>?
    private let viewModel: OccurancesViewModelProtocol

    init(viewModel: OccurancesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: OccurancesViewController.nibName, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        viewModel.fetchOccurances()
    }
    
    private func setup() {
        title = viewModel.title
        
        setupTableView()
        setupViewModelBinding()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: OccuranceCell.nibName, bundle: nil),
                           forCellReuseIdentifier: OccuranceCell.dequeueIdentifier)
    }
    
    private func setupViewModelBinding() {
        viewModel.viewDelegate = self
    }
    
    private func configureView(withState state: ListViewState<OccuranceItem>) {
        switch state {
        case .empty:
            // TODO: create empty view
            return
        case .error(let error):
            // TODO: create error view
            return
        case .populated(_):
            reloadTableView()
        }
    }
    
    private func reloadTableView() {
        dataSource = ListDataSource.make(for: viewModel.occurancesCells)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
}

extension OccurancesViewController: ListViewStateDelegate {
    
    func viewStateDidChange<T>(_ state: ListViewState<T>) {
        guard let state = state as? ListViewState<OccuranceItem> else {
            return
        }
        
        configureView(withState: state)
    }
}
