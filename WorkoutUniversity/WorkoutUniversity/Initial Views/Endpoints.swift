//
//  Endpoints.swift
//  WorkoutUniversity
//
//  Created by Topu Saha on 11/15/23.
//

import Foundation

enum APIEndPoints {
    // base URL
    static let baseURL = ""
    
    enum Authentication {
        static let login = baseURL + "/login" // APIEndpoints.Authentication.login
        static let signup = baseURL + "/register"
        static let forgotPassword = baseURL + "/resetPassword"
        static let logout = baseURL + "/logout"
    }
}


