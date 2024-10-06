//
//  CucumberishInitializer.swift
//  AmxTripPlanner
//
//  Created by Pavani Gunna on 06/10/2024.
//
import Cucumberish

@objc class CucumberishInitializer: NSObject {
    @objc class func CucumberishSwiftInit() {
        let steps = AmxTripPlannerSteps()
        steps.setupLoginSteps()
        
        let bundle = Bundle(for: CucumberishInitializer.self)
        Cucumberish.executeFeatures(inDirectory: "features", from: bundle, includeTags: nil, excludeTags: nil)
        
    }
}
