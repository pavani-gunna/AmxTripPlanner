//
//  FlightSearchViewController.swift
//  AmxTripPlanner
//
//  Created by Pavani Gunna on 05/10/2024.
//

import UIKit

class FlightSearchViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var fromTextField: UITextField!
    
    @IBOutlet weak var toTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fromTextField.delegate = self
        toTextField.delegate = self
    }
    
    var availableFlights: [Flight] = []
    var mockDestinations = ["London", "New York", "Delhi", "Paris", "Frankfurt", "Amsterdam",  "Copenhagen"]
    
    
    @IBAction func searchFlightsButtonTapped(_ sender: UIButton) {
        let from = fromTextField.text ?? ""
        let to = toTextField.text ?? ""
        let date = datePicker.date
        availableFlights = searchFlights(from: from, to: to, date: date)
    }
    
func searchFlights(from: String, to: String, date: Date) -> [Flight] {
        return [
            Flight(flightNumber: "AA101", from: from, to: to, departureTime: "09:00 AM", arrivalTime: "12:00 PM"),
            Flight(flightNumber: "DL203", from: from, to: to, departureTime: "11:00 AM", arrivalTime: "02:00 PM"),
        ]
    }
    
    
}

struct Flight {
    var flightNumber: String
    var from: String
    var to: String
    var departureTime: String
    var arrivalTime: String
}
