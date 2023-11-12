//
//  MovieListBuilder.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import UIKit

final class MovieListBuilder {
    
    static func build() -> UIViewController {
        let remoteDataSource = RemoteDataSourceProvider()
        let localDataSource = LocalDataSourceProvider()
        let useCase = UseCaseProvider(remoteDataSource: remoteDataSource, localDataSource: localDataSource).movieUseCase()
        let viewModel = MovieListViewModel(movieUseCase: useCase)
        let viewController = MovieListViewController(viewModel: viewModel)
        return viewController
    }
}
