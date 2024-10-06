//
//  File.swift
//  AmxTripPlanner
//
//  Created by Pavani Gunna on 06/10/2024.
//


let app = XCUIApplication()
        
        TestUtil.UTIL.tapAndSetTextFieldValue(app: app, textFieldIdentifier: "userID", value: "admin1")
        TestUtil.UTIL.tapAndSetSecureTextField(app: app, secureTextFieldIdentifier:  "password",  value: "password123")
        TestUtil.UTIL.tapButton(app: app, buttonIdentifier: "Signin")