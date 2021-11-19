//
//  PersistenceServiceMock.swift
//  BodypediaTests
//
//  Created by Alex Bartis on 12.04.2021.
//

import Foundation
@testable import Planetpedia

class PersistenceServiceMock: PersistenceServiceProtocol {
    public var passedBodies = [Body]()
    
    convenience init(bodies: [Body]) {
        self.init()

        self.passedBodies = bodies
    }
    
    func save(bodies: [Body]) {
        self.passedBodies = bodies
    }
    
    func load() -> [Body] {
        return self.passedBodies
    }
}
