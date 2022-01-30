//
//  ContentView.swift
//  Dice
//
//  Created by Максим Нуждин on 28.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            RollView()
                .tabItem {
                    Label("Roll", systemImage: "circle.grid.cross.fill")
                }
            OverallStatsView()
                .tabItem {
                    Label("Statistics", systemImage: "person.3.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
