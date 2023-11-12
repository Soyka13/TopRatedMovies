//
//  OccuranceCell.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import UIKit

class OccuranceCell: UITableViewCell {
    
    @IBOutlet weak var occurancesLabel: UILabel!
    
    static let dequeueIdentifier = "OccuranceCell"
    static let nibName = "OccuranceCell"
    
    var viewModel: OccuranceCellViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    private func update() {
        guard let occurance = viewModel?.occurance else { return }
        occurancesLabel.text = "\(occurance.char) : \(occurance.count)"
    }
}
