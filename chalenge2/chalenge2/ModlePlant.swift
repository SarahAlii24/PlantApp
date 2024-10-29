//
//  ModlePlant.swift
//  CodeChallenge2
//
//  Created by Sara Ali Alahmadi on 23/04/1446 AH.
//

import Foundation

struct Plant: Identifiable {
    var id = UUID()
    var name: String
    var light: String
    var water: String
    var room: String
    var isWatered: Bool = false
    
    init(id: UUID = UUID(), name: String, light: String, water: String, room: String, isWatered: Bool) {
        self.id = id
        self.name = name
        self.light = light
        self.water = water
        self.room = room
        self.isWatered = isWatered

    }
}

