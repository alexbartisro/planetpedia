//
//  NetworkServiceMock.swift
//  PlanetpediaTests
//
//  Created by Alex Bartis on 09.04.2021.
//

import Foundation
import Combine

@testable import Planetpedia

class NetworkServiceMock: NetworkServiceProtocol {
    public var shouldFail = false
    public var bodies = [Body]()
    
    convenience init(bodies: [Body], shouldFail: Bool = false) {
        self.init()
        
        self.shouldFail = shouldFail
        self.bodies = bodies
    }
    
    func getBodies() -> AnyPublisher<[Body], Error> {
          if shouldFail {
            return Fail(outputType: [Body].self, failure: NetworkError.errorThrown)
               .eraseToAnyPublisher()
          } else {
            return Just(bodies)
               .setFailureType(to: Error.self)
               .eraseToAnyPublisher()
          }
       }
}

enum NetworkError: Error {
    case errorThrown
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .errorThrown:
            return "This is an Error"
        }
    }
}
