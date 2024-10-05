//
//  ViewController.swift
//  AmxTripPlanner
//
//  Created by Pavani Gunna on 05/10/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorLabel.isHidden = true
    }


    @IBOutlet weak var userIdTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let userId = userIdTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        if validateLogin(userId: userId, password: password) {
            errorLabel.isHidden = false
            errorLabel.text = "valid User ID or Password"
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Invalid User ID or Password"
        }
    }
    
    func validateLogin(userId: String, password: String) -> Bool {
            return userId == "admin" && password == "password123"
        }
    
    
}

