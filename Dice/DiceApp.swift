//
//  DiceApp.swift
//  Dice
//
//  Created by Максим Нуждин on 28.01.2022.
//

import SwiftUI

@main
struct DiceApp: App {
    
    @StateObject var model = AppModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
