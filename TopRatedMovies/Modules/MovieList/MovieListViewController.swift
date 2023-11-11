//
//  TopRatedMoviesViewController.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    static let nibName = "MovieListViewController"
    
    private let viewModel: MovieListViewModelProtocol
    private var dataSource: ListDataSource<MovieCellViewModelProtocol>?
    
    init(viewModel: MovieListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: MovieListViewController.nibName, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        viewModel.fetchTopRatedMovies()
    }
    
    private func setup() {
        setupSearchBar()
        setupTableView()
        setupRefreshControl()
        setupBinding()
    }
    
    private func setupSearchBar() {
        navigationItem.titleView = searchBar
        searchBar.delegate = self
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.register(UINib(nibName: MovieCell.nibName, bundle: nil),
                           forCellReuseIdentifier: MovieCell.dequeueIdentifier)
    }
    
    private func setupRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
//        tableView.refreshControl?.addAction(UIAction(handler: { [weak self] _ in
//            self?.viewModel.fetchTopRatedMovies()
//        }), for: .valueChanged)
        
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    private func setupBinding() {
        viewModel.viewDelegate = self
    }
    
    private func configureView(withState state: ListViewState<MovieItem>) {
        switch state {
        case .empty:
            return
        case .error(let error):
            return
        case .populated(_):
            reloadTableView()
        }
    }
    
    private func reloadTableView() {
        dataSource = ListDataSource.make(for: viewModel.movieCells)
        tableView.dataSource = dataSource
        tableView.reloadData()
        
        if tableView.refreshControl?.isRefreshing == true {
            tableView.refreshControl?.endRefreshing()
        }
    }
    
    @objc func refresh() {
        viewModel.fetchTopRatedMovies()
    }
}

extension MovieListViewController: MovieListViewModelViewDelegate {
    
    func viewStateDidChange(_ state: ListViewState<MovieItem>) {
        configureView(withState: state)
        reloadTableView()
    }
}

// MARK: - UISearchBarDelegate

extension MovieListViewController: UISearchBarDelegate {
    
}

// MARK: - UITableViewDelegate

extension MovieListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
