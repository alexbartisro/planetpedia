//
//  Body.swift
//  Planetpedia
//
//  Created by Alex Bartis on 08.04.2021.
//

import Foundation

struct Bodies: Codable {
    let bodies: [Body]

    enum CodingKeys: String, CodingKey {
        case bodies = "bodies"
    }
}

// MARK: - Body
struct Body: Codable {
    let id: String
    let name: String
    let englishName: String
    let isPlanet: Bool
    let moons: [Moon]?
    let semimajorAxis: Double
    let perihelion: Int
    let aphelion: Int
    let eccentricity: Double
    let inclination: Double
    let mass: Mass?
    let vol: Vol?
    let density: Double
    let gravity: Double
    let escape: Double
    let meanRadius: Double
    let equaRadius: Double
    let polarRadius: Double
    let flattening: Double
    let dimension: String
    let sideralOrbit: Double
    let sideralRotation: Double
    let aroundPlanet: AroundPlanet?
    let discoveredBy: String
    let discoveryDate: String
    let alternativeName: String
    let axialTilt: Double
    let rel: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case englishName = "englishName"
        case isPlanet = "isPlanet"
        case moons = "moons"
        case semimajorAxis = "semimajorAxis"
        case perihelion = "perihelion"
        case aphelion = "aphelion"
        case eccentricity = "eccentricity"
        case inclination = "inclination"
        case mass = "mass"
        case vol = "vol"
        case density = "density"
        case gravity = "gravity"
        case escape = "escape"
        case meanRadius = "meanRadius"
        case equaRadius = "equaRadius"
        case polarRadius = "polarRadius"
        case flattening = "flattening"
        case dimension = "dimension"
        case sideralOrbit = "sideralOrbit"
        case sideralRotation = "sideralRotation"
        case aroundPlanet = "aroundPlanet"
        case discoveredBy = "discoveredBy"
        case discoveryDate = "discoveryDate"
        case alternativeName = "alternativeName"
        case axialTilt = "axialTilt"
        case rel = "rel"
    }
}

// MARK: - AroundPlanet
struct AroundPlanet: Codable {
    let planet: String
    let rel: String

    enum CodingKeys: String, CodingKey {
        case planet = "planet"
        case rel = "rel"
    }
}

// MARK: - Mass
struct Mass: Codable {
    let massValue: Double
    let massExponent: Int

    enum CodingKeys: String, CodingKey {
        case massValue = "massValue"
        case massExponent = "massExponent"
    }
}

// MARK: - Moon
struct Moon: Codable {
    let moon: String
    let rel: String

    enum CodingKeys: String, CodingKey {
        case moon = "moon"
        case rel = "rel"
    }
}

// MARK: - Vol
struct Vol: Codable {
    let volValue: Double
    let volExponent: Int

    enum CodingKeys: String, CodingKey {
        case volValue = "volValue"
        case volExponent = "volExponent"
    }
}
