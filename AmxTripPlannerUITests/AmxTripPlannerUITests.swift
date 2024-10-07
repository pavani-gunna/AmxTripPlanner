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


        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testvalidlogin() throws {
        let app = XCUIApplication()
        
        TestUtil.UTIL.tapAndSetTextFieldValue(app: app,
                                              textFieldIdentifier: TestData.LoginElementIDs.usernameTextField,
                                              value: TestData.validMockData.username)
        TestUtil.UTIL.tapAndSetSecureTextField(app: app,
                                               secureTextFieldIdentifier:  TestData.LoginElementIDs.passwordSecureField,
                                               value: TestData.validMockData.password)
        TestUtil.UTIL.tapButton(app: app,
                                buttonIdentifier: TestData.LoginElementIDs.signinButton)
        XCTAssert(!(app.staticTexts[TestData.LoginElementIDs.errorLabel].exists))
        TestUtil.UTIL.anExpectation(element: app.textFields[TestData.SearchElementIDs.fromTextField],
                                    errorMessage: "Failed to navigate to the flight search page.")
    }
        
    func testinValidlogin() throws {
        let app = XCUIApplication()
        
        TestUtil.UTIL.tapAndSetTextFieldValue(app: app,
                                              textFieldIdentifier: TestData.LoginElementIDs.usernameTextField,
                                              value: TestData.inValidMockData.from)
        TestUtil.UTIL.tapAndSetSecureTextField(app: app,
                                               secureTextFieldIdentifier:  TestData.LoginElementIDs.passwordSecureField,
                                               value: TestData.inValidMockData.to)
        TestUtil.UTIL.tapButton(app: app,
                                buttonIdentifier: TestData.LoginElementIDs.signinButton)

        XCTAssert(app.staticTexts[TestData.LoginElementIDs.errorLabel].exists)
            
    }
                
}
