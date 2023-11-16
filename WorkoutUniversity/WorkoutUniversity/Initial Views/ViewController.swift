//
//  ViewController.swift
//  WorkoutUniversity
//
//  Created by Topu Saha on 11/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var loginEnteredUsername : String = ""
    var loginEnteredPasswrod : String = ""
    
    
    @IBOutlet weak var loginUsernameTextField: UITextField!
    
    @IBOutlet weak var loginPasswordTextField: UITextField!
    
    
    // sets border of a text field to red
    func setRedBorder(for textField: UITextField) {
        textField.layer.borderColor = UIColor.red.cgColor // Set the border color to red
        textField.layer.borderWidth = 3.0 // Set the border width
        textField.layer.cornerRadius = 5.0 // Add some corner radius for a nicer appearance
    }
    
    // sets border
    func resetBorder(for textField: UITextField) {
        textField.layer.borderColor = nil // Remove the custom border color
        textField.layer.borderWidth = 0.0 // Remove the custom border width
        textField.layer.cornerRadius = 0.0 // Remove any corner radius
    }
    
    
    @IBAction func login(_ sender: Any) {
        loginEnteredUsername = loginUsernameTextField.text ?? ""
        loginEnteredPasswrod = loginPasswordTextField.text ?? ""
        
        self.resetBorder(for: self.loginUsernameTextField)
        self.resetBorder(for: self.loginPasswordTextField)
        
        if loginEnteredUsername == "" {
            setRedBorder(for: loginUsernameTextField)
        }
        
        if loginEnteredPasswrod == "" {
            setRedBorder(for: loginPasswordTextField)
        }
        
        print("Entered Username: " + loginEnteredUsername)
        print("Entered Password: " + loginEnteredPasswrod)
        // Send information to rest API
        // If passes, segue to the Workout-Screen screen
        // if fails, pop up message to try again
        
        if loginEnteredUsername != "" && loginEnteredPasswrod != "" {
            APIRequests.logUserIn(username: loginEnteredUsername, password: loginEnteredPasswrod) { result in
                switch result {
                case .success:
                    // Perform segue or other actions upon successful login
                    print("In thread")

                    self.performSegue(withIdentifier: "loginSegue", sender: self)

                    
                case .failure(let error):
                    // Handle login failure or display an error message
                    print("Login failed with error: \(error)")
                }
            }
            
            
        }
        
        
        
        
        /*
         @IBAction func pressedSignIn(_ sender: UIButton) {
         self.resetBorder(for: self.loginUsernameTextField)
         self.resetBorder(for: self.loginPasswordTextField)
         }
         */
        
        
        
        
        
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
       self.resetBorder(for: self.loginUsernameTextField)
       self.resetBorder(for: self.loginPasswordTextField)
       
   }
    
}
