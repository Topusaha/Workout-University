//
//  SignUpViewController.swift
//  WorkoutUniversity
//
//  Created by Topu Saha on 11/4/23.
//

import UIKit

class SignUpViewController: UIViewController {

    var signupUsername : String = ""
    var signupPassword : String = ""
    var signupConfirmedPassword : String = ""
    var signupEmail : String = ""
    
    @IBOutlet weak var signupUsernameTextField: UITextField!
    
    @IBOutlet weak var signupPasswordTextField: UITextField!
    
    @IBOutlet weak var signupConfirmedPasswordTextField: UITextField!
    
    @IBOutlet weak var signupEmailTextField: UITextField!
    
    
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
    
    @IBAction func createAccount(_ sender: UIButton) {
        
        // resets borders
        resetBorder(for: signupUsernameTextField)
        resetBorder(for: signupPasswordTextField)
        resetBorder(for: signupConfirmedPasswordTextField)
        resetBorder(for: signupEmailTextField)
        
        signupUsername = signupUsernameTextField.text ?? ""
        signupPassword = signupPasswordTextField.text ?? ""
        signupEmail = signupEmailTextField.text ?? ""
        signupConfirmedPassword = signupConfirmedPasswordTextField.text ?? ""
        
        // if passwords does not match issue warning
        if signupPassword != signupConfirmedPassword {
            print("Password and Confirmed Password Does not Match")
            print("Password: \(signupPassword)")
            print("Confirmed Password: \(signupConfirmedPassword)")
            setRedBorder(for : signupPasswordTextField)
            setRedBorder(for : signupConfirmedPasswordTextField)
        }
        
        // if contents are blank issue warnings
        if signupUsername == "" { setRedBorder(for : signupUsernameTextField) }
        if signupPassword == "" {
            setRedBorder(for : signupPasswordTextField)
            setRedBorder(for : signupConfirmedPasswordTextField)
        }
        if signupEmail == "" {
            setRedBorder(for: signupEmailTextField)
        }
        
        if signupPassword == signupConfirmedPassword, !signupUsername.isEmpty, !signupEmail.isEmpty, !signupPassword.isEmpty {
            APIRequests.signUserUp(username: signupUsername, password: signupPassword, email: signupEmail) { result in
                switch result {
                case .success:
                    // Handle successful signup (e.g., navigate to the next screen)
                    print("Signup successful")
                case .failure(let error):
                    // Handle signup failure or display an error message
                    print("Signup failed with error: \(error)")
                }
            }
            
        }
        
        func viewDidLoad() {
            super.viewDidLoad()
    }
    
    }
}
