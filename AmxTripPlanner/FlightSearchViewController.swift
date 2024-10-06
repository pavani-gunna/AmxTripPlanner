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
    
    @IBOutlet weak var tableView: UITableView!
    
    var availableFlights: [Flight] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fromTextField.delegate = self
        toTextField.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    
    var mockDestinations = ["London", "New York", "Delhi", "Paris", "Frankfurt", "Amsterdam",  "Copenhagen"]
    
    
    @IBAction func searchFlightsButtonTapped(_ sender: UIButton) {
        let from = fromTextField.text ?? ""
        let to = toTextField.text ?? ""
        let date = datePicker.date
        availableFlights = searchFlights(from: from, to: to, date: date)
        tableView.reloadData()
    }
    
    func searchFlights(from: String, to: String, date: Date) -> [Flight] {
        return containsCaseInsensitive(list: mockDestinations, destination: from) &&
            containsCaseInsensitive(list: mockDestinations, destination: to) ? [
                Flight(flightNumber: "AA101", from: from, to: to, departureTime: "09:00 AM", arrivalTime: "12:00 PM"),
                Flight(flightNumber: "DL203", from: from, to: to, departureTime: "11:00 AM", arrivalTime: "02:00 PM"),
            ] : []
    }
    
    func containsCaseInsensitive(list: [String], destination: String) -> Bool {
        return list.contains { $0.lowercased() == destination.lowercased() }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            showAutoCompleteSuggestions(for: updatedText, textField: textField)
        }
        return true
    }
    
    func showAutoCompleteSuggestions(for query: String, textField: UITextField) {
        let suggestions = mockDestinations.filter { $0.lowercased().contains(query.lowercased()) }
        print(suggestions)
    }
    
}

extension FlightSearchViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Flights Avaliable")
    }
}


extension FlightSearchViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableFlights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightCell", for: indexPath)
        let flight = availableFlights[indexPath.row]
        cell.textLabel?.text = "\(flight.flightNumber) - \(flight.from) - \(flight.to)"
        return cell
    }
}



struct Flight {
    var flightNumber: String
    var from: String
    var to: String
    var departureTime: String
    var arrivalTime: String
}
