//
//  PlanetpediaAlert.swift
//  Planetpedia
//
//  Created by Alex Bartis on 12.04.2021.
//

import SwiftUI

struct PlanetpediaAlert: View {
    var message: String
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Color.white
            Text(message)
                .font(.headline)
                .padding()
        }
        .frame(width: 200, height: 100)
        .cornerRadius(20).shadow(radius: 20)
        .onTapGesture {
            action()
        }
    }
}

struct PlanetpediaAlert_Previews: PreviewProvider {
    static var previews: some View {
        PlanetpediaAlert(message: "Loading", action: {  })
    }
}
