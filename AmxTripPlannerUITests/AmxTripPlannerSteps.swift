//
//  AmxTripPlannerSteps.swift
//  AmxTripPlanner
//
//  Created by Pavani Gunna on 06/10/2024.
//

import XCTest
import Cucumberish

class AmxTripPlannerSteps: NSObject {
    func setupLoginSteps() {
        // Step 1: Define "Given" for app launch
        Given("the app is launched") { _, _ in
            print("Launching the app")
            let app = XCUIApplication()
            app.launch()
        }
        
        // Step 2: Define "And I am on the login screen"
        Given("I am on the login screen") { _, _ in
            let app = XCUIApplication()
            TestUtil.UTIL.assertTextField(app: app, textFieldIdentifier: "userID")
            TestUtil.UTIL.assertSecureTextField(app: app, secureTextFieldIdentifier:  "password")
            TestUtil.UTIL.assertButton(app: app, buttonIdentifier: "Signin")
        }
    }
}
