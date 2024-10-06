//
//  TestSearch.swift
//  AmxTripPlanner
//
//  Created by Pavani Gunna on 06/10/2024.
//
import XCTest

class TestSearch : XCTestCase{
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
        TestUtil.UTIL.loginIfNeeded(app: app)

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testPageLayout() {
        let app = XCUIApplication()
        TestUtil.UTIL.anExpectation(element: app.textFields[TestData.SearchElementIDs.fromTextField],
                                    errorMessage: "Failed to find search Text Field - From.")
        TestUtil.UTIL.anExpectation(element: app.textFields[TestData.SearchElementIDs.toTextField],
                                    errorMessage: "Failed to find search Text Field - To.")
        TestUtil.UTIL.anExpectation(element: app.buttons[TestData.SearchElementIDs.searchButton],
                                    errorMessage: "Failed to find search button")
    }
    
    func testFlights() {
        let app = XCUIApplication()
        
        TestUtil.UTIL.tapAndSetTextFieldValue(app: app,
                                              textFieldIdentifier: TestData.SearchElementIDs.fromTextField,
                                              value: TestData.validMockData.from)
        TestUtil.UTIL.tapAndSetTextFieldValue(app: app,
                                              textFieldIdentifier:  TestData.SearchElementIDs.toTextField,
                                              value: TestData.validMockData.to)
        TestUtil.UTIL.tapButton(app: app,
                                buttonIdentifier: TestData.SearchElementIDs.searchButton)
        
        let flightsTableView = app.tables[TestData.SearchElementIDs.flightsAvaliableTableView]
        XCTAssertTrue(flightsTableView.exists, TestData.testMessages.flightsAvaliableTableViewError)
        XCTAssertTrue(flightsTableView.cells.count > 0, TestData.testMessages.noFlightsAvaliable)
        let firstCell = flightsTableView.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists, TestData.testMessages.flightsCellNotFound)
        XCTAssertEqual(firstCell.label, TestData.validMockData.flight, TestData.testMessages.inCorrectFlightData)
    }
    
    func testInvalidFromFlights() {
        let app = XCUIApplication()
        
        TestUtil.UTIL.tapAndSetTextFieldValue(app: app,
                                              textFieldIdentifier: TestData.SearchElementIDs.fromTextField,
                                              value: TestData.inValidMockData.from)
        TestUtil.UTIL.tapAndSetTextFieldValue(app: app,
                                              textFieldIdentifier:  TestData.SearchElementIDs.toTextField,
                                              value: TestData.validMockData.to)
        TestUtil.UTIL.tapButton(app: app,
                                buttonIdentifier: TestData.SearchElementIDs.searchButton)
        XCTAssert(!(app.tables[TestData.SearchElementIDs.flightsAvaliableTableView].cells.count > 0))
      
    }
    
    func testInvalidDestinationFlights() {
        let app = XCUIApplication()
        
        TestUtil.UTIL.tapAndSetTextFieldValue(app: app,
                                              textFieldIdentifier: TestData.SearchElementIDs.fromTextField,
                                              value: TestData.validMockData.from)
        TestUtil.UTIL.tapAndSetTextFieldValue(app: app,
                                              textFieldIdentifier:  TestData.SearchElementIDs.toTextField,
                                              value: TestData.inValidMockData.to)
        TestUtil.UTIL.tapButton(app: app,
                                buttonIdentifier: TestData.SearchElementIDs.searchButton)
        XCTAssert(!(app.tables[TestData.SearchElementIDs.flightsAvaliableTableView].cells.count > 0))
       
    }
}

