//
//  File.swift
//  Dice
//
//  Created by Максим Нуждин on 28.01.2022.
//

import SwiftUI
import CoreData


@MainActor class AppModel: ObservableObject {
    
    enum CubeSideVariants: Int, CaseIterable {
        case sixSided = 6
        case eightSided = 8
        case temSided = 10
        case twelveSided = 12
    }

    
    
    @Published var currentCube: CubeSideVariants = .sixSided {
        didSet {
            generateDice()
        }
    }
    @Published private(set) var possibleRolls: [Int] = []
    @Published private(set) var seconds = 0
    
    @Published private(set) var rolled = 0
    @Published private(set) var rolledTimes = 0
    
    @Published private(set) var rolledAsSix = 0
    @Published private(set) var rolledAsSixTimes = 0
    @Published private(set) var rolledAsEight = 0
    @Published private(set) var rolledAsEightTimes = 0
    @Published private(set) var rolledAsTen = 0
    @Published private(set) var rolledAsTenTimes = 0
    @Published private(set) var rolledAsTwelve = 0
    @Published private(set) var rolledAsTwelveTimes = 0
    
    var isActive: Bool {
        seconds == 0
    }
    
    
    @Published var totalRolls = 0
    
    private let saveKey = "totalRolls"
    private let savePath = FileManager.documentDirectory.appendingPathComponent("totalRolls")
    
    let timer = Timer.publish(every: 1, tolerance: 0.2, on: .main, in: .common).autoconnect()
    
    init() {
        loadData()
    }
    
    func generateDice() {
        possibleRolls = Array(1...currentCube.rawValue)
    }
    
    func startRolling() {
        seconds = 3
    }
    
    func rollDice() {
        provideHaptic()
        rolled = possibleRolls.randomElement()!
        seconds -= 1
        if seconds == 0 {
            totalRolls += rolled
            rolledTimes += 1
            switch currentCube {
            case .sixSided:
                rolledAsSix += rolled
                rolledAsSixTimes += 1
            case .eightSided:
                rolledAsEight += rolled
                rolledAsEightTimes += 1
            case .temSided:
                rolledAsTen += rolled
                rolledAsTenTimes += 1
            case .twelveSided:
                rolledAsTwelve += rolled
                rolledAsTwelveTimes += 1
            }
            saveData()
        }
    }
    
    private func saveData() {
        let data = DataToSave(rolledTimes: rolledTimes, rolledAsSix: rolledAsSix, rolledAsSixTimes: rolledAsSixTimes, rolledAsEight: rolledAsEight, rolledAsEightTimes: rolledAsEightTimes, rolledAsTen: rolledAsTen, rolledAsTenTimes: rolledAsTenTimes, rolledAsTwelve: rolledAsTwelve, rolledAsTwelveTimes: rolledAsTwelveTimes, totalRolls: totalRolls)
        if let encoded = try? JSONEncoder().encode(data) {
            try? encoded.write(to: savePath)
        }
    }
    
    private func loadData() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(DataToSave.self, from: data) {
                totalRolls = decoded.totalRolls
                rolledTimes = decoded.rolledTimes
                rolledAsSix = decoded.rolledAsSix
                rolledAsSixTimes = decoded.rolledAsSixTimes
                rolledAsEight = decoded.rolledAsEight
                rolledAsEightTimes = decoded.rolledAsEightTimes
                rolledAsTen = decoded.rolledAsTen
                rolledAsTenTimes = decoded.rolledAsTenTimes
                rolledAsTwelve = decoded.rolledAsTwelve
                rolledAsTwelveTimes = decoded.rolledAsTwelveTimes
                return
            }
        }
        totalRolls = 0
        seconds = 0
        rolledTimes = 0
        rolledAsSix = 0
        rolledAsSixTimes = 0
        rolledAsEight = 0
        rolledAsEightTimes = 0
        rolledAsTen = 0
        rolledAsTenTimes = 0
        rolledAsTwelve = 0
        rolledAsTwelveTimes = 0
    }
    
    private func provideHaptic() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}
