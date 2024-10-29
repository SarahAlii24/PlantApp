//
//  chalenge2App.swift
//  chalenge2
//
//  Created by Sara Ali Alahmadi on 26/04/1446 AH.
//

import SwiftUI

@main
struct chalenge2App: App {
    @StateObject var vm = ViweModle()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
