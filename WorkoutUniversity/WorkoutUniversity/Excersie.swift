//
//  Excersie.swift
//  WorkoutUniversity
//
//  Created by Topu Saha on 11/11/23.
//

import Foundation

struct excersiseList: Decodable {
    var excerises : [Excersise] = []
}

struct Excersise: Decodable {
    let name : String
    let type : String
    let muscle : String
    let equipment : String
    let difficulty : String
    let instructions : String
}
