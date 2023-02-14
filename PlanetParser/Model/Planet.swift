//
//  Model.swift
//  MindMap
//
//  Created by Cory Tripathy on 2/10/23.
//

import Foundation

struct Planet: Codable, Hashable {
    let name: String
    var distanceFromSun: Double
    let mass: Double
    let numberOfMoons: Int
    var isFavorited: Bool
    
    var massInKg: String {
        let massInScientific: String
        if self.mass < 100 {
            massInScientific = String(format: "%.2f", self.mass)
        } else {
            massInScientific = String(format: "%.0f", self.mass)
        }
        return massInScientific
    }
    
    var distanceFromSunInKm: String {
        return String(format: "%.0f", self.distanceFromSun)
    }
}
