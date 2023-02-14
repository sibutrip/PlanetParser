//
//  ViewModel.swift
//  MindMap
//
//  Created by Cory Tripathy on 2/10/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published private(set) var planets: [Planet]
    
    public func savePlanet() {
        ReadWrite.writeToDisk(self.planets)
    }
    
    init() {
        /// read from pre-loaded JSON if first time opening
        if UserDefaults.standard.object(forKey: "hasOpenedApp") == nil {
            planets = ReadWrite.readFromFile()
            ReadWrite.writeToDisk(planets)
            UserDefaults.standard.set(true, forKey: "hasOpenedApp")
            return
        }
        /// read from on-device file path if not first time opening
        planets = ReadWrite.readFromDisk()
    }
}
