//
//  bodypediaTests.swift
//  bodypediaTests
//
//  Created by Alex Bartis on 08.04.2021.
//

import XCTest
@testable import Planetpedia

class bodyListViewModelTests: XCTestCase {

    func testViewModelRequestSuccessfulNobodys() throws {
        //given
        let networkMock = NetworkServiceMock()
        let viewModel = CelestialBodyListViewModel(networkService: networkMock)
        
        //when
        viewModel.getBodies()
        
        //then
        XCTAssertEqual(viewModel.bodies.count, 0)
    }
    
    func testViewModelRequestSuccessful() throws {
        //given
        let numberOfExpectedbodys = 3
        let stubBodies = generateStubsWith(count: numberOfExpectedbodys)
        let networkMock = NetworkServiceMock(bodies: stubBodies)
        let viewModel = CelestialBodyListViewModel(networkService: networkMock)
        
        //when
        viewModel.getBodies()
        
        //then
        XCTAssertEqual(viewModel.bodies.count, numberOfExpectedbodys)
        compare(expectedbodys: stubBodies, with: viewModel.bodies)
    }
    
    func testViewModelRequestFailed() throws {
        //given
        let networkMock = NetworkServiceMock(bodies: [], shouldFail: true)
        let persistenceMock = PersistenceServiceMock(bodies: [])
        let viewModel = CelestialBodyListViewModel(networkService: networkMock, persistenceService: persistenceMock)
        
        //when
        viewModel.getBodies()
        
        //then
        XCTAssertEqual(viewModel.bodies.count, 0)
        XCTAssertFalse(viewModel.alertMessage.isEmpty)
        XCTAssertEqual(viewModel.alertMessage, NetworkError.errorThrown.localizedDescription)
    }
    
    func testViewModelPopupTapped() throws {
        //given
        let numberOfExpectedbodys = 5
        let stubbodys = generateStubsWith(count: numberOfExpectedbodys)
        let networkMock = NetworkServiceMock(bodies: [], shouldFail: true)
        let persistenceMock = PersistenceServiceMock(bodies: stubbodys)
        let viewModel = CelestialBodyListViewModel(networkService: networkMock, persistenceService: persistenceMock)
        
        //when
        viewModel.getBodies()
        viewModel.popupTapped()
        
        //then
        XCTAssertEqual(viewModel.popupMessage, "")
        XCTAssertFalse(viewModel.showPopupBanner)
        XCTAssertEqual(viewModel.bodies.count, numberOfExpectedbodys)
    }
    
    func testViewModelCacheLoaded() throws {
        //given
        let expectedPopupMessage = "Showing cached bodies"
        let numberOfExpectedbodys = 5
        let stubbodys = generateStubsWith(count: numberOfExpectedbodys)
        let networkMock = NetworkServiceMock(bodies: [], shouldFail: true)
        let persistenceMock = PersistenceServiceMock(bodies: stubbodys)
        let viewModel = CelestialBodyListViewModel(networkService: networkMock, persistenceService: persistenceMock)
        
        //when
        viewModel.getBodies()
        
        //then
        XCTAssertEqual(viewModel.popupMessage, expectedPopupMessage)
        XCTAssertTrue(viewModel.showPopupBanner)
        XCTAssertEqual(viewModel.bodies.count, numberOfExpectedbodys)
    }
    
    //MARK: - Private
    private func compare(expectedbodys: [Body], with modelbodys: [Body]) {
        if expectedbodys.count != modelbodys.count {
            XCTFail("Expected \(expectedbodys.count) but received \(modelbodys.count)")
        }
        
        for (index, body) in expectedbodys.enumerated() {
            XCTAssertEqual(body, modelbodys[index], "Mismatch in bodys at index \(index)")
        }
    }
}

//MARK: - Helpers
extension Body: Equatable {
    public static func == (lhs: Body, rhs: Body) -> Bool {
        return lhs.name == rhs.name
    }
}
