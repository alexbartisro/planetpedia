//
//  PlanetpediaUITests.swift
//  PlanetpediaUITests
//
//  Created by Alex Bartis on 08.04.2021.
//

import XCTest

class PlanetpediaUITests: XCTestCase {
    
    override func tearDown() {
        Springboard.deleteApp()
    }

    func testListOfPlanetsLoaded() throws {
        //given
        let expectedVisibleCells = 286
        let app = XCUIApplication()
        app.launchArguments = [""]
                
        //when
        app.launch()
            
        //then
        let tablesQuery = app.tables
        XCTAssertEqual(tablesQuery.cells.count, expectedVisibleCells)
    }
    
    func testNoPlanetsResponseErrorShown() throws {
        //given
        let expectedVisibleCells = 0
        let app = XCUIApplication()
        app.launchArguments = ["--UI_TESTING"]
        
        //when
        app.launch()
        
        //then
        let tablesQuery = app.tables
        XCTAssertEqual(tablesQuery.cells.count, expectedVisibleCells)
        XCTAssertEqual(app.alerts.count, 1)
    }
}

//MARK: - Helpers
final class Springboard {
    private static var springboardApp = XCUIApplication(bundleIdentifier: "com.apple.springboard")

    /**
     This method deletes the installed App on the Simulator
     by tacking control of the `Springboard` of the device.
     This is a nice way to completly cleanup between each test
     run for the purpose of not having anything cached.
     
     */
    class func deleteApp() {
        XCUIApplication().terminate()

        springboardApp.activate()

        sleep(1)

        let appIcon = springboardApp.icons.matching(identifier: "Planetpedia").firstMatch
        appIcon.press(forDuration: 1.3)

        sleep(1)

        springboardApp.buttons["Remove App"].tap()

        let deleteButton = springboardApp.alerts.buttons["Delete App"].firstMatch
        if deleteButton.waitForExistence(timeout: 5) {
            deleteButton.tap()
            springboardApp.alerts.buttons["Delete"].tap()
        }
    }
}
