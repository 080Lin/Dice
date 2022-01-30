//
//  DataToSave.swift
//  Dice
//
//  Created by Максим Нуждин on 30.01.2022.
//

import Foundation


struct DataToSave: Codable {
    
    var rolledTimes: Int
    
    var rolledAsSix: Int
    var rolledAsSixTimes: Int
    var rolledAsEight: Int
    var rolledAsEightTimes: Int
    var rolledAsTen: Int
    var rolledAsTenTimes: Int
    var rolledAsTwelve: Int
    var rolledAsTwelveTimes: Int

    var totalRolls: Int
    
}
