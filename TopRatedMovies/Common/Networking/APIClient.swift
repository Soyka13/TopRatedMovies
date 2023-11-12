//
//  APIClient.swift
//  TopRatedMovies
//
//  Created by Olena Stepaniuk on 10.11.2023.
//

import Foundation

protocol APIClient {
    var session: URLSession { get }
    
    func fetch<T: Decodable>(with request: URLRequest?,
                             queue: DispatchQueue,
                             completion: @escaping (Result<T, APIError>) -> Void)
}

extension APIClient {
    
    private func decode<T: Decodable>(data: Data, decodingType: T.Type) -> (Result<T, APIError>) {
        do {
            let decoder = JSONDecoder()
            let genericModel = try decoder.decode(T.self, from: data)
            return .success(genericModel)
        } catch {
            return .failure(.invalidData)
        }
    }
    
    func fetch<T: Decodable>(with request: URLRequest?,
                             queue: DispatchQueue = .main,
                             completion: @escaping (Result<T, APIError>) -> Void) {
        guard let request = request else {
            completion(.failure(.invalidRequest))
            return
        }
        
        session.dataTask(with: request) { data, response, _ in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed))
                return
            }
            
            guard 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(APIError(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            let result = decode(data: data, decodingType: T.self)
            
            queue.async {
                completion(result)
            }
        }.resume()
    }
    
    func download(with request: URLRequest?,
                  queue: DispatchQueue = .main,
                  completion: @escaping (Result<Data, APIError>) -> Void) {
        guard let request = request else {
            completion(.failure(.invalidRequest))
            return
        }
        
        session.dataTask(with: request) { data, response, _ in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed))
                return
            }
            
            guard 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(APIError(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            queue.async {
                completion(.success(data))
            }
        }.resume()
    }
}
