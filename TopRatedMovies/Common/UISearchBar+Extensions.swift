//
//  UISearchBar+Extensions.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 12.11.2023.
//

import UIKit

extension UISearchBar {
    
    var searchField: UITextField? {
        return value(forKey: "searchField") as? UITextField
    }
    
    var activityIndicator: UIActivityIndicatorView? {
        searchField?.leftView as? UIActivityIndicatorView
    }
    
    var isLoading: Bool {
        get {
            activityIndicator != nil
        }
        
        set {
            if newValue {
                if activityIndicator == nil {
                    let newActivityIndicator = UIActivityIndicatorView(style: .medium)
                    newActivityIndicator.startAnimating()
                    
                    searchField?.leftView = newActivityIndicator
                }
            } else {
                activityIndicator?.removeFromSuperview()
                
                let imageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
                imageView.tintColor = .secondaryLabel
                searchField?.leftView = imageView
            }
        }
    }
}
