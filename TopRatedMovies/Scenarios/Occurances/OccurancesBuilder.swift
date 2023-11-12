//
//  OccurancesBuilder.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import UIKit

final class OccurancesBuilder {
    
    static func build(with movieItem: MovieItem) -> UIViewController {
        let useCase = UseCaseProvider(remoteDataSource: RemoteDataSourceProvider()).occurancesUseCase()
        let viewModel = OccurancesViewModel(movieItem: movieItem, useCase: useCase)
        let viewController = OccurancesViewController(viewModel: viewModel)
        return viewController
    }
}
