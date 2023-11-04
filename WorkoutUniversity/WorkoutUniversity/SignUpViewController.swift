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
    
    @IBOutlet weak var signuPasswordTextField: UITextField!
    
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
        resetBorder(for: signuPasswordTextField)
        resetBorder(for: signupConfirmedPasswordTextField)
        resetBorder(for: signupEmailTextField)
        
        // if passwords does not match issue warning
        if signupConfirmedPasswordTextField.text != signupConfirmedPasswordTextField.text {
            print("Password and Confirmed Password Does not Match")
            setRedBorder(for : signuPasswordTextField)
            setRedBorder(for : signupConfirmedPasswordTextField)
        }
        
    
        signupUsername = signupUsernameTextField.text ?? ""
        signupPassword = signuPasswordTextField.text ?? ""
        signupEmail = signupEmailTextField.text ?? ""
        
        // if contents are blank issue warnings
        if signupUsername == "" { setRedBorder(for : signupUsernameTextField) }
        if signupPassword == "" {
            setRedBorder(for : signuPasswordTextField)
            setRedBorder(for : signupConfirmedPasswordTextField)
        }
        if signupEmail == "" {
            setRedBorder(for: signupEmailTextField)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    

}
