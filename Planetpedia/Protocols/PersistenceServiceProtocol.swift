//
//  PersistenceServiceProtocol.swift
//  Planetpedia
//
//  Created by Alex Bartis on 12.04.2021.
//

import Foundation

protocol PersistenceServiceProtocol {
    func save(bodies: [Body])
    func load() -> [Body]
}
