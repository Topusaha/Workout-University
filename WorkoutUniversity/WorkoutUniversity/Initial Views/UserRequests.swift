//
//  UserRequests.swift
//  WorkoutUniversity
//
//  Created by Topu Saha on 11/15/23.
//

import Foundation

struct LoginRequest: Codable {
    let username : String
    let password : String
}

struct SignupRequest: Codable {
    let username : String
    let password : String
    let email : String
}

struct forgotPasswordRequest: Codable {
    let email : String
}
