//
//  CelestialBodyListViewModel.swift
//  Planetpedia
//
//  Created by Alex Bartis on 12.04.2021.
//

import Foundation
import Combine

class CelestialBodyListViewModel: ObservableObject {
    private let networkService: NetworkServiceProtocol!
    private let persistenceService: PersistenceServiceProtocol!
    private var disposables = Set<AnyCancellable>()

    
    @Published var bodies = [Body]()
    @Published var alertMessage = ""
    @Published var popupMessage = ""

    var showAlert: Bool {
        return !alertMessage.isEmpty
    }

    var showPopupBanner: Bool {
        return !popupMessage.isEmpty
    }
    
    init(networkService: NetworkServiceProtocol = NetworkService(),
         persistenceService: PersistenceServiceProtocol = PersistenceService()) {
        self.networkService = networkService
        self.persistenceService = persistenceService
    }
    
    // MARK: - Public
    public func getBodies() {
        popupMessage = "Loading"
        
        requestBodiesFromAPI()
    }
    
    public func popupTapped() {
        popupMessage = ""
    }
    
    //MARK: - Private
    private func requestBodiesFromAPI() {
          networkService
             .getBodies()
             .sink(receiveCompletion: { [weak self] subscriptionCompletion in
                if case let .failure(error) = subscriptionCompletion {
                   self?.handleResponseError(with: error.localizedDescription)
                }
             }, receiveValue: { [weak self] bodies in
                self?.handleResponseSuccessful(with: bodies)
             })
             .store(in: &disposables)
        }
    
    /**
     Method that handles a failure from the API Request. This method is
     responsible for showing the error to the user and then loading the
     cached bodies from storage, if they exist.
     
     - parameter message: The localized error message received from the API.
     */
    private func handleResponseError(with message: String) {
        popupMessage = ""
        alertMessage = message
        self.bodies = loadCachedBodies()
        
        if self.bodies.isEmpty {
            popupMessage = "No bodies to show"
        } else {
            popupMessage = "Showing cached bodies"
        }
    }
    
    /**
     Method that handles a successful response from the API.
     After receiving the Body array the go ahead and cache
     them in the internal storage.
     
     - parameter bodies: An array of Body objects received from the API.
     */
    private func handleResponseSuccessful(with bodies: [Body]) {
        popupMessage = ""
        self.bodies = bodies
        cache(bodies)
    }
    
    private func loadCachedBodies() -> [Body] {
        return persistenceService.load()
    }
    
    private func cache(_ bodies: [Body]) {
        persistenceService.save(bodies: bodies)
    }
}
