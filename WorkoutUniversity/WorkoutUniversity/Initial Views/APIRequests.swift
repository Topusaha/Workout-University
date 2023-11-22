//
//  APIRequests.swift
//  WorkoutUniversity
//
//  Created by Topu Saha on 11/15/23.
//

import Foundation
import UIKit


class APIRequests {
    
    static func logUserIn(username : String, password : String, completion: @escaping (Result<String, Error>) -> Void) {
        let loginEndpoint = APIEndPoints.Authentication.login
        let login_request : LoginRequest = LoginRequest(username: username, password: password)
        
        let url = URL(string : loginEndpoint)!
        var request = URLRequest(url : url)
        request.httpMethod = "POST"
        
        
        do {
            let jsonData = try JSONEncoder().encode(login_request)
            request.httpBody = jsonData
        } catch {
            print("Error")
            return
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid HTTP response")
                return
            }
            
            if (200...299).contains(httpResponse.statusCode) {
                print("Success")
                DispatchQueue.main.async {
                                // Perform UI-related tasks on the main thread
                                completion(.success("Login successful"))
                            }
            }
            
            else {
                print("Failed status code: \(httpResponse.statusCode)")
                let error = NSError(domain: "", code: httpResponse.statusCode, userInfo: nil)
                           DispatchQueue.main.async {
                               // Perform UI-related tasks on the main thread
                               completion(.failure(error))
                           }
            }
        }
        task.resume()
    }
    
    /*
    static func signUserOut() {
    }
    */
    
    static func userForgotPassword(email : String) -> Bool {
        let forgotPasswordEndpoint = APIEndPoints.Authentication.forgotPassword
        let user_forgot_password : forgotPasswordRequest = forgotPasswordRequest(email : email)
        var working : Bool = false
        
        let url = URL(string : forgotPasswordEndpoint)!
        var request = URLRequest(url : url)
        
        do {
            let jsonData = try JSONEncoder().encode(user_forgot_password)
            request.httpBody = jsonData
        } catch {
            print("Error")
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let error = error {
                print("Network Error \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid HTTP response")
                return
            }
            
            if (200...299).contains(httpResponse.statusCode) {
                print("Success")
                working = true
            }
            
            else {
                print("Failed status code: \(httpResponse.statusCode)")
            }
        }
        task.resume()
        
        return working
    }
    
    
    
    static func signUserUp(username : String, password : String, email : String, completion: @escaping (Result<Void, Error>) -> Void){
        let signinEndpoint = APIEndPoints.Authentication.signup
        let signup_request : SignupRequest = SignupRequest(username: username, password: password, email: email)
        
        let url = URL(string : signinEndpoint)!
        var request = URLRequest(url : url)
        request.httpMethod = "POST"
        
        do {
            let jsonData = try JSONEncoder().encode(signup_request)
            request.httpBody = jsonData
        } catch {
            print("Error")
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let error = error {
                print("Network Error \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid HTTP response")
                return
            }
            
            if (200...299).contains(httpResponse.statusCode) {
                print("Success")
            }
            
            else {
                print("Failed status code: \(httpResponse.statusCode)")
            }
        }
        task.resume()
    }
}

/*
 
 let apiKey = "CoGoxCyj4fSBJiUQFo/OjA==YPeYhNjRKFXrSSHQ"
 let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=")!
 var request = URLRequest(url: url)
 request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")

 let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
     guard let data = data else {
         print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
         completion([])
         return
     }

     do {
         let exercises = try JSONDecoder().decode([Excersise].self, from: data)
         completion(exercises)
     } catch {
         print("Error decoding data: \(error.localizedDescription)")
         completion([])
     }
 }

 task.resume()
}
 
 */
