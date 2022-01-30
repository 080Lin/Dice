//
//  OverallStatsView.swift
//  Dice
//
//  Created by Максим Нуждин on 28.01.2022.
//

import SwiftUI


struct OverallStatsView: View {
    
    @EnvironmentObject var model: AppModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("Hello. There are your overall stats during using this app.")
                        .font(.title)
                    Group {
                        Text("You have been rolled") +
                        Text(" \(model.totalRolls) ").bold() +
                        Text("count over") +
                        Text(" \(model.rolledTimes) ").bold() +
                        Text("times")
                    }
                    .font(.title2)
                    HStack {
                        Spacer()
                        Text("Amongst")
                            .bold()
                            .font(.title)
                        Spacer()
                    }
                    
                    Section {
                        HStack {
                            Text("Rolled as six sided cube")
                            Text("\(model.rolledAsSix)")
                                .bold()
                        }
                        HStack {
                            Text("Rolled times for that")
                            Text("\(model.rolledAsSixTimes)")
                                .bold()
                        }
                    } header: {
                        Text("Most light weighted cube")
                            .bold()
                            .padding([.top, .leading, .trailing])
                    }.font(.title3)
                    
                    Section {
                        HStack {
                            Text("Rolled as eight sided cube")
                            Text("\(model.rolledAsEight)")
                                .bold()
                        }
                        HStack {
                            Text("Rolled times for that")
                            Text("\(model.rolledAsEightTimes)")
                                .bold()
                        }
                    } header: {
                        Text("8 side weighted cube")
                            .bold()
                            .padding([.top, .leading, .trailing])
                    }.font(.title3)
                    
                    Section {
                        HStack {
                            Text("Rolled as ten sided cube")
                            Text("\(model.rolledAsTen)")
                                .bold()
                        }
                        HStack {
                            Text("Rolled times for that")
                            Text("\(model.rolledAsTenTimes)")
                                .bold()
                        }
                    } header: {
                        Text("10 side weighted cube")
                            .bold()
                            .padding([.top, .leading, .trailing])
                    }.font(.title3)
                    
                    Section {
                        HStack {
                            Text("Rolled as twelve sided cube")
                            Text("\(model.rolledAsTwelve)")
                                .bold()
                        }
                        HStack {
                            Text("Rolled times for that")
                            Text("\(model.rolledAsTwelveTimes)")
                                .bold()
                        }
                    } header: {
                        Text("Most high weighted cube")
                            .bold()
                            .padding([.top, .leading, .trailing])
                    }.font(.title3)
                    
                }.padding()
                    .multilineTextAlignment(.center)
            }
            .navigationBarTitle("Overall stats")
        }
    }
}

struct OverallStatsView_Previews: PreviewProvider {
    static var previews: some View {
        OverallStatsView()
    }
}
