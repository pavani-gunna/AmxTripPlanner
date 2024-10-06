//
//  TestInvalidLogin.swift
//  AmxTripPlanner
//
//  Created by Pavani Gunna on 06/10/2024.
//
import XCTest

class TestInvalidLogin: AmxTripPlannerUITests {
    
    func testinValidlogin() throws {
        let app = XCUIApplication()
        
        TestUtil.UTIL.tapAndSetTextFieldValue(app: app,
                                              textFieldIdentifier: TestData.LoginElementIDs.usernameTextField,
                                              value: TestData.inValidMockData.username)
        TestUtil.UTIL.tapAndSetSecureTextField(app: app,
                                               secureTextFieldIdentifier:  TestData.LoginElementIDs.passwordSecureField,
                                               value: TestData.inValidMockData.password)
        TestUtil.UTIL.tapButton(app: app,
                                buttonIdentifier: TestData.LoginElementIDs.signinButton)

        XCTAssert(app.staticTexts[TestData.LoginElementIDs.errorLabel].exists)
        
    }
}
