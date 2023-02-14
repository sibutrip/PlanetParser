//
//  ReadWrite.swift
//  MindMap
//
//  Created by Cory Tripathy on 2/10/23.
//

import Foundation

struct ReadWrite {
    
    static func writeToDisk(_ models: [Planet]) {
        do {
            try JSONEncoder()
                .encode(models)
                .write(to: Repository.shared.url)
        } catch {
            print("couldn't Models.json to disk")
        }
    }
    
    static func readFromDisk() -> [Planet] {
        do {
            let encodedPlanets = try Data(contentsOf: Repository.shared.url)
            let decodedPlanets = try JSONDecoder().decode([Planet].self, from: encodedPlanets)
            return decodedPlanets
        } catch {
            print("error reading Models.json data")
            return [Planet]()
        }
    }
    
    static func readFromFile() -> [Planet] {
        guard let path = Bundle.main.url(forResource: "planets", withExtension: "json") else {
            print("could not find file path to planets.json")
            return [Planet]()
        }
        do {
            let encodedPlanets = try Data(contentsOf: path)
            let decodedPlanets = try JSONDecoder().decode([Planet].self, from: encodedPlanets)
            return decodedPlanets
        } catch {
            print("error reading planets.json data")
            return [Planet]()
        }
    }
}


