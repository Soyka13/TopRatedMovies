//
//  Environment.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

final class Environment {
    
    static let shared = Environment()
    
    var apiKey = ""
    var readAccessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MmU1ZDY1Njg1ZjcwZDM2ZWFhOTk4MzE1ZmFmODJhNSIsInN1YiI6IjVmNDc3NDczOWU0MDEyMDAzMmJjZWYxZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HqRO_7maLMa4I3jMLGZ3mPAtAhJEaGUsp3xsuueGNOo"
    
    var baseURLString: String {
        "https://api.themoviedb.org"
    }
    
    var regularImageBaseURLString: String {
        "https://image.tmdb.org"
    }
    
    private init() {}
}
