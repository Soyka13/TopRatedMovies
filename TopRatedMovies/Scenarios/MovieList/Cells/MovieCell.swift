//
//  MovieCell.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    static let dequeueIdentifier = "MovieCell"
    static let nibName = "MovieCell"
    
    var viewModel: MovieCellViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        viewModel?.cancelImageDownloading()
        posterImageView.image = nil
    }
    
    private func update() {
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.movie.title
        
        if let voteAverage = viewModel.movie.voteAverage {
            ratingLabel.text = "\(voteAverage)"
        }
        
        viewModel.loadImage { [weak self] result in
            if case .success(let data) = result {
                self?.posterImageView.image = UIImage(data: data)
            }
        }
    }
}
