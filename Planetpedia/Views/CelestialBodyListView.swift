//
//  MainView.swift
//  Shared
//
//  Created by Alex Bartis on 08.04.2021.
//

import SwiftUI

struct CelestialBodyListView: View {
    @EnvironmentObject var viewModel: CelestialBodyListViewModel
    
    var body: some View {
        List(viewModel.bodies, id: \.name) { body in
            BodyCell(celestialBody: body)
                .frame(maxWidth: .infinity)
        }
        .padding([.top, .leading, .trailing])
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: .constant(viewModel.showAlert), content: {
            Alert(title: Text(viewModel.alertMessage))
        })
        .onAppear(perform: {
            viewModel.getBodies()
        })

        if viewModel.showPopupBanner {
            ZStack {
                PlanetpediaAlert(message: viewModel.popupMessage, action: viewModel.popupTapped)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let listViewModel = CelestialBodyListViewModel()
        
        return CelestialBodyListView().environmentObject(listViewModel)
    }
}
