//
//  ImageViewDownloadable.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 11.11.2023.
//

import UIKit

class DownloadableImageView: UIImageView {
    
    private var task: URLSessionTask?
    
    func download(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let data = data, let image = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }
        
        task?.resume()
    }
    
    func cancelDownloading() {
        task?.cancel()
    }
}
