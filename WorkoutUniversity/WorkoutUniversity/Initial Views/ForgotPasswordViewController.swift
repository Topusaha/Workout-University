//
//  ForgotPasswordViewController.swift
//  WorkoutUniversity
//
//  Created by Topu Saha on 11/4/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    
    // sets border of a text field to red
    func setRedBorder(for textField: UITextField) {
            textField.layer.borderColor = UIColor.red.cgColor // Set the border color to red
        textField.layer.borderWidth = 3.0 // Set the border width
            textField.layer.cornerRadius = 5.0 // Add some corner radius for a nicer appearance
    }
    
    // resets border
    func resetBorder(for textField: UITextField) {
            textField.layer.borderColor = nil // Remove the custom border color
            textField.layer.borderWidth = 0.0 // Remove the custom border width
            textField.layer.cornerRadius = 0.0 // Remove any corner radius
    }
    
    var forgotPasswordEnteredUsername : String = ""
    var forgotPasswordEnteredEmail : String = ""
    
    
    @IBOutlet weak var forgotPasswordUsernameTextField: UITextField!
    
    @IBOutlet weak var forgotPasswordEmailTextField: UITextField!
    
    @IBAction func forgotPasswordResetAccount(_ sender: UIButton) {
        
        // resets borders
        resetBorder(for: forgotPasswordUsernameTextField)
        resetBorder(for: forgotPasswordEmailTextField)
        
        forgotPasswordEnteredUsername = forgotPasswordUsernameTextField.text ?? ""
        forgotPasswordEnteredEmail = forgotPasswordEmailTextField.text ?? ""
        
        // if text fields are blank issue red border
        if forgotPasswordEnteredUsername == "" {
            setRedBorder(for: forgotPasswordUsernameTextField)
        }
        
        if forgotPasswordEnteredEmail == "" {
            setRedBorder(for: forgotPasswordEmailTextField)
        }
        
        print("Entered Username: " + forgotPasswordEnteredUsername)
        print("Entered Email: " + forgotPasswordEnteredEmail)
        
        // Send info to API
        if APIRequests.userForgotPassword(email: forgotPasswordEnteredEmail) == false {
            showInvalidEmailAlert()
        }
        
    }
    
    func showInvalidEmailAlert() {
            let alertController = UIAlertController(title: "Invalid Email", message: "Please enter a valid email address.", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)

            present(alertController, animated: true, completion: nil)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    

}
