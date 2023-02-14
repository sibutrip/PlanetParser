//
//  Repository.swift
//  MindMap
//
//  Created by Cory Tripathy on 2/10/23.
//

import Foundation

struct Repository {
    
    /// the link to where you plan to store local data
    let url: URL
    
    init() {
        guard let url = try? FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Models.json") else {
            fatalError("cannot create repository for unknown reason")
        }
        self.url = url
    }
    
    static let shared = Repository()
}
