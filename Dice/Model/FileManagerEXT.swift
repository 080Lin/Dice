//
//  FileManagerEXT.swift
//  Dice
//
//  Created by Максим Нуждин on 28.01.2022.
//

import Foundation


extension FileManager {
    
    static var documentDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
