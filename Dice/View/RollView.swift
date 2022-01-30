//
//  RollView.swift
//  Dice
//
//  Created by Максим Нуждин on 28.01.2022.
//

import SwiftUI

struct RollView: View {
    
    @EnvironmentObject var model: AppModel
    var body: some View {
        ZStack {
            Color.green.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Choose number of dices")
                    .font(.largeTitle)
                if !model.isActive {
                    Text("Current choice is \(model.currentCube.rawValue) sided cube")
                } else {
                    if model.rolled != 0 {
                        Text("\(model.rolled) score")
                            .font(.title)
                            .bold()
                    }
                }
                Group {
                    Spacer()
                    if model.isActive {
                        Picker("Choose dices", selection: $model.currentCube) {
                            ForEach(AppModel.CubeSideVariants.allCases, id: \.self) { variant in
                                Text("\(variant.rawValue) sided cube")
                            }
                        }
                    } else {
                        Text("\(model.rolled) score")
                            .font(.title)
                            .bold()
                    }
                    Spacer()
                    Button("Roll") {
                        model.startRolling()
                    }.font(.largeTitle)
                        .padding()
                        .background(model.isActive ? .blue : .black.opacity(0.8))
                        .foregroundColor(model.isActive ? .white : .gray.opacity(0.6))
                        .clipShape(Capsule())
                }.allowsHitTesting(model.isActive)
                
            }
        }
        .onAppear {
            model.generateDice()
        }
        .onReceive(model.timer) { output in
            if model.seconds > 0 {
                model.rollDice()
            }
        }
    }
    
    
}

struct RollView_Previews: PreviewProvider {
    static var previews: some View {
        RollView()
    }
}
