//
//  NetworkService.swift
//  Planetpedia
//
//  Created by Alex Bartis on 08.04.2021.
//

import Foundation
import Combine

class NetworkService: NetworkServiceProtocol {
    
    private var urlString = "https://api.le-systeme-solaire.net/rest/bodies/"
    
    init() {
        /** If this argument is found it means we're running a test
         in which me need to have the request fail*/
        if CommandLine.arguments.contains("--UI_TESTING") {
            urlString = "https://localhost.test"
        }
    }
    
    /**
     Method that performs an HTTP Request to the API
     
     - parameter completion: handler responsible for passing the Result back to the caller.
     ```
     */
    
    func getBodies() -> AnyPublisher<[Body], Error> {
        guard let url = URL(string: urlString) else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap { (data, response) -> Data in
                guard let code = (response as? HTTPURLResponse)?.statusCode else {
                    throw NetworkError.unknown
                }
                
                guard code == 200 else {
                    throw NetworkError.invalidResponse
                }
                
                return data
            }
            .decode(type: Bodies.self, decoder: JSONDecoder())
            .map { $0.bodies }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum NetworkError: Error {
    case unknown
    case invalidResponse
}
