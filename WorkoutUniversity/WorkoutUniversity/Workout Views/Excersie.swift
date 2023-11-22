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

struct Excersise: Codable, Hashable, Equatable {
    let name : String
    let type : String
    let muscle : String
    let equipment : String
    let difficulty : String
    let instructions : String
}

extension Excersise {
    static var favoritesKey: String {
        return "Favorites"
    }
    
    static func save(_ excercise: [Excersise], forKey key: String) {
        // 1.
        let defaults = UserDefaults.standard
        // 2.
        let encodedData = try! JSONEncoder().encode(excercise)
        // 3.
        defaults.set(encodedData, forKey: key)
    }
    
    static func getExcercises(forKey key: String) -> [Excersise] {
        // 1.
        let defaults = UserDefaults.standard
        // 2.
        if let data = defaults.data(forKey: key) {
            // 3.
            let decoded = try! JSONDecoder().decode([Excersise].self, from: data)
            // 4.
            return decoded
        } else {
            // 5.
            return []
        }
    }
    
    func addToFavorites() {
        // 1.
        var favorites = Excersise.getExcercises(forKey: Excersise.favoritesKey)
        // 2.
        favorites.append(self)
        // 3.
        Excersise.save(favorites, forKey: Excersise.favoritesKey)
    }
    
    func removeFromFavorites() {
        // 1.
        var favorites = Excersise.getExcercises(forKey: Excersise.favoritesKey)
        // 2.
        favorites.removeAll { excercise in
            // 3.
            return self == excercise
        }
        // 4.
        Excersise.save(favorites, forKey: Excersise.favoritesKey)
    }
}
