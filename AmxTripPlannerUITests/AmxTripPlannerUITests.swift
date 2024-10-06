//
//  AmxTripPlannerUITests.swift
//  AmxTripPlannerUITests
//
//  Created by Pavani Gunna on 05/10/2024.
//

import XCTest

final class AmxTripPlannerUITests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        continueAfterFailure = false
        XCUIApplication().launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testvalidlogin() throws {
        let app = XCUIApplication()

        TestUtil.UTIL.tapAndSetTextFieldValue(app: app, textFieldIdentifier: "userID", value: "admin")
        TestUtil.UTIL.tapAndSetSecureTextField(app: app, secureTextFieldIdentifier:  "password",  value: "password123")
        TestUtil.UTIL.tapButton(app: app, buttonIdentifier: "Signin")
        XCTAssert(!(app.staticTexts["Invalid User ID or Password"].exists))
//        let fromTextField = app.textFields["From"]
        TestUtil.UTIL.anExpectation(element: app.textFields["From"], errorMessage: "Failed to navigate to the flight search page.")
//        let existsPredicate = NSPredicate(format: "exists == true")
//        let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: fromTextField)
//        let result = XCTWaiter().wait(for: [expectation], timeout: 5)
//        XCTAssertEqual(result, .completed, "Failed to navigate to the flight search page.")

    }

    func testinValidlogin() throws {
        let app = XCUIApplication()

        TestUtil.UTIL.tapAndSetTextFieldValue(app: app, textFieldIdentifier: "userID", value: "admin1")
        TestUtil.UTIL.tapAndSetSecureTextField(app: app, secureTextFieldIdentifier:  "password",  value: "password123")
        TestUtil.UTIL.tapButton(app: app, buttonIdentifier: "Signin")
        XCTAssert(app.staticTexts["Invalid User ID or Password"].exists)
        
    }
    

}
