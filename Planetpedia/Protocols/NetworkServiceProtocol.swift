//
//  NetworkServiceProtocol.swift
//  Planetpedia
//
//  Created by Alex Bartis on 09.04.2021.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func getBodies() -> AnyPublisher<[Body], Error>
}
