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
    
    weak var coordinator: MovieListCoordinatorProtocol?
    
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
        setupViewModelBinding()
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
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    private func setupViewModelBinding() {
        viewModel.viewDelegate = self
    }
    
    private func configureView(withState state: ListViewState<MovieItem>) {
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
        dataSource = ListDataSource.make(for: viewModel.movieCells)
        tableView.dataSource = dataSource
        tableView.reloadData()
        
        if tableView.refreshControl?.isRefreshing == true {
            tableView.refreshControl?.endRefreshing()
        }
    }
    
    @objc private func refresh() {
        if let searchText = searchBar.text, searchBar.text?.isEmpty == false {
            viewModel.searchMovies(with: searchText)
        } else {
            viewModel.fetchTopRatedMovies()
        }
    }
    
    private func stopLoaderIfNeeded() {
        if searchBar.isLoading {
            searchBar.isLoading = false
        }
    }
}

extension MovieListViewController: ListViewStateDelegate {
    
    func viewStateDidChange<T>(_ state: ListViewState<T>) {
        guard let state = state as? ListViewState<MovieItem> else {
            return
        }
        
        stopLoaderIfNeeded()
        configureView(withState: state)
    }
}

// MARK: - UISearchBarDelegate

extension MovieListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty, !searchText.trimmingCharacters(in: .whitespaces).isEmpty else {
            viewModel.fetchTopRatedMovies()
            return
        }
    
        searchBar.isLoading = true
        viewModel.searchMovies(with: searchText)
    }
}

// MARK: - UITableViewDelegate

extension MovieListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = viewModel.movieCells[indexPath.row].movie
        coordinator?.showOccurances(with: model)
    }
}