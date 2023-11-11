//
//  MovieCell.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterImageView: DownloadableImageView!
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
        
        posterImageView.cancelDownloading()
        posterImageView.image = nil
    }
    
    private func update() {
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.movie.title
        
        if let voteAverage = viewModel.movie.voteAverage {
            ratingLabel.text = "\(voteAverage)"
        }
        
        if let posterURL = viewModel.movie.posterURL {
            posterImageView.download(from: posterURL)
        }
    }
}
