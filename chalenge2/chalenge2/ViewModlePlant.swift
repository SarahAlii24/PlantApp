//
//  ViewModlePlant.swift
//  CodeChallenge2
//
//  Created by Sara Ali Alahmadi on 23/04/1446 AH.
//

import SwiftUI

    class ViweModle: ObservableObject{
                
                func savePlant() {
                   
                   let newPlant = Plant(
                       name: PlantName,
                       light: SelectedLight,
                       water: SelectedWater,
                       room: SelectedRoom,
                       isWatered: false
                   )
                   
                   Plants.append(newPlant)
                }
        func updatePlant(_ plant: Plant) {
                if let index = Plants.firstIndex(where: { $0.id == plant.id }) {
                    Plants[index].name = PlantName
                    Plants[index].room = SelectedRoom
                    Plants[index].light = SelectedLight
                    Plants[index].water = SelectedWater
                   // Plants[index].wateringDays = SelectedWateringDays
                }
                clearFields()
            }
        func deletePlant(plant: Plant) {
            if let index = Plants.firstIndex(where: { $0.id == plant.id }) {
                Plants.remove(at: index)
            }
        }
            // دالة لمسح الحقول
            private func clearFields() {
                PlantName = ""
                SelectedWater = ""
                SelectedLight = ""
                SelectedRoom = ""
                SelectedWateringDays = ""
                editingPlant = nil
            }
               var WateringDays = ["Everyday", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
               var Room = ["Bedroom", "Living Room", "Kitchen", "Balcony", "Bathroom"]
               var Water = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
               var Light = ["Full Sun", "Partial Sun", "Low Light"]
               
               @Published  var PlantName = ""
               @Published  var SelectedWateringDays = ""
               @Published  var SelectedRoom = ""
               @Published  var SelectedWater = ""
               @Published  var SelectedLight = ""
               @Published  var showSetSheet = false
               @Published  var showListPage = false
               @Published var showSheet : Bool = false
               @Published  var multiSelection = Set<UUID>()
               @Published var Plants: [Plant] = [] // قائمة النباتات
               @Published var editingPlant: Plant?
               @Published var isFirstTime = true
               @Published var showAllDonePage: Bool = false
           }
       
