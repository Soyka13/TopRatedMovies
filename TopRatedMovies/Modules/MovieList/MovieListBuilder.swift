//
//  MovieListBuilder.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import UIKit

final class MovieListBuilder: ModuleBuilder {
    static func build() -> UIViewController {
        let viewModel = MovieListViewModel(movieUseCase: UseCaseProvider(remoteDataSource: RemoteDataSourceProvider()).movieUseCase())
        let viewController = MovieListViewController(viewModel: viewModel)
        return viewController
    }
}
