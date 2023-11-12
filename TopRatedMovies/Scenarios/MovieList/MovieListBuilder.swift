//
//  MovieListBuilder.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import UIKit

final class MovieListBuilder {
    
    static func build() -> UIViewController {
        let useCase = UseCaseProvider(remoteDataSource: RemoteDataSourceProvider()).movieUseCase()
        let viewModel = MovieListViewModel(movieUseCase: useCase)
        let viewController = MovieListViewController(viewModel: viewModel)
        return viewController
    }
}
