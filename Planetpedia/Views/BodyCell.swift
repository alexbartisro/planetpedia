//
//  PlanetCell.swift
//  Planetpedia
//
//  Created by Alex Bartis on 08.04.2021.
//

import SwiftUI

struct BodyCell: View {
    let celestialBody: Body
        
    var body: some View {
        VStack(alignment: .leading) {
                Text(celestialBody.name)
                    .font(.headline)
                    .padding([.leading, .bottom])
                HStack {
                    Text("Discovery date: \(celestialBody.discoveryDate)")
                        .font(.body)
                        .padding(.trailing, 10.0)
                    Text("Discovered By: \(celestialBody.discoveredBy)")
                        .font(.body)
                        .padding(.leading, 10.0)
                }
                .padding([.leading, .bottom])
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading)
    }
}

struct BodyCell_Previews: PreviewProvider {
    static var previews: some View {
        BodyCell(celestialBody: bodyStub)
    }
    
    static private let bodyStub = Body(id: "01", name: "Sun", englishName: "Sun", isPlanet: false, moons: [], semimajorAxis: 0.0, perihelion: 1, aphelion: 1, eccentricity: 0.1, inclination: 0.1, mass: nil, vol: nil, density: 0, gravity: 0, escape: 0, meanRadius: 0, equaRadius: 0, polarRadius: 0, flattening: 0, dimension: "", sideralOrbit: 0, sideralRotation: 0, aroundPlanet: nil, discoveredBy: "Me", discoveryDate: "Me", alternativeName: "Sol", axialTilt: 0, rel: "")
    
}
