//
//  TestData.swift
//  AmxTripPlanner
//
//  Created by Pavani Gunna on 06/10/2024.
//

import Foundation

struct TestData {

    struct validMockData {
        static let username = "admin"
        static let password = "password123"
        static let from = "london"
        static let to = "frankfurt"
        static let flight = "DL203 - london - frankfurt"
    }
    
    struct inValidMockData {
        static let username = "admin1"
        static let password = "password1234"
        static let from = "Dubai"
        static let to = "Tokyo"
    }
    
    
    struct LoginElementIDs {
        static let usernameTextField = "userID"
        static let passwordSecureField = "password"
        static let signinButton = "Signin"
        static let errorLabel = "Invalid User ID or Password"
        static let searchButton = "Search"
    }
    
    struct SearchElementIDs {
        static let fromTextField = "from"
        static let toTextField = "to"
        static let searchButton = "searchFlights"
        static let flightsAvaliableTableView = "flightsAvaliable"
    }
    
    struct testMessages {
        static let flightsAvaliableTableViewError = "The flights table view does not exist."
        static let noFlightsAvaliable = "No flights available in the table view."
        static let flightsCellNotFound = "The first flight cell does not exist."
        static let inCorrectFlightData  = "Unexpected flight information in the first cell."
    }
    
}
