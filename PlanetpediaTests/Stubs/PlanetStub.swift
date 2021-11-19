//
//  PlanetStub.swift
//  Planetpedia
//
//  Created by Alex Bartis on 08.04.2021.
//

import Foundation
@testable import Planetpedia

let bodyStub = Body(id: "01", name: "Sun", englishName: "Sun", isPlanet: false, moons: [], semimajorAxis: 0.0, perihelion: 1, aphelion: 1, eccentricity: 0.1, inclination: 0.1, mass: nil, vol: nil, density: 0, gravity: 0, escape: 0, meanRadius: 0, equaRadius: 0, polarRadius: 0, flattening: 0, dimension: "", sideralOrbit: 0, sideralRotation: 0, aroundPlanet: nil, discoveredBy: "Me", discoveryDate: "Me", alternativeName: "Sol", axialTilt: 0, rel: "")

func generateStubsWith(count: Int) -> [Body] {
    var planets = [Body]()
    
    for i in 1...count {
        let planet = Body(id: "\(i)", name: "Body \(i)", englishName: "", isPlanet: false, moons: [], semimajorAxis: 0.0, perihelion: 1, aphelion: 1, eccentricity: 0.1, inclination: 0.1, mass: nil, vol: nil, density: 0, gravity: 0, escape: 0, meanRadius: 0, equaRadius: 0, polarRadius: 0, flattening: 0, dimension: "", sideralOrbit: 0, sideralRotation: 0, aroundPlanet: nil, discoveredBy: "Me", discoveryDate: "Me", alternativeName: "", axialTilt: 0, rel: "")
        
        planets.append(planet)
    }
    
    return planets
}
