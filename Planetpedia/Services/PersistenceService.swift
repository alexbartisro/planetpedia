//
//  PersistenceService.swift
//  Planetpedia
//
//  Created by Alex Bartis on 12.04.2021.
//

import Foundation

class PersistenceService: PersistenceServiceProtocol {
    private let filename = "Bodies.json"
    private var savePath: URL? {
        guard let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentsPath.appendingPathComponent(filename)
    }
        
    /**
     This method convers a Bodies array to a serialized JSON
     and saves it in a "Bodies.json" file in the Documents Directory
     
     - parameter bodies: An array of Body objects.
     
     */
    func save(bodies: [Body]) {
        guard let savePath = savePath else { return }
        
        do {
            let jsonData = try JSONEncoder().encode(bodies)
            try jsonData.write(to: savePath)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    /**
     This method loads a cache of Body objects from
     the documents folder
     
     - returns: A non-optional array of Bodies
     
     */
    func load() -> [Body] {
        guard let savePath = savePath else { return [] }
        var bodies = [Body]()
        
        do {
            let data = try Data.init(contentsOf: savePath)
            bodies = try JSONDecoder().decode([Body].self, from: data)
        } catch  {
            print(error.localizedDescription)
        }
        
        
        return bodies
    }
}
